//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.FileHandle
import class Foundation.FileManager
import class SmithyStreams.FileStream
import enum Smithy.ByteStream
import struct Foundation.URL

public extension S3TransferManager {
    /// Uploads a local directory to S3.
    ///
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadDirectoryInput`, a synthetic input type specific to this operation of the S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<UploadDirectoryOutput, Error>` that can be waited on or cancelled as needed.
    func uploadDirectory(input: UploadDirectoryInput) throws -> Task<UploadDirectoryOutput, Error> {
        return Task {
            let nestedFileURLs = try getNestedFileURLs(
                in: input.source,
                recursive: input.recursive,
                followSymbolicLinks: input.followSymbolicLinks
            )
            let (successfulUploadCount, failedUploadCount) = try await withThrowingTaskGroup(
                // Each child task returns the result of a single upload object call.
                of: Result<Void, Error>.self,
                // Task group returns success / failure counts of the upload object calls.
                returning: (successfulUploadCount: Int, failedUploadCount: Int).self
            ) { group in
                // Add upload object child tasks.
                for url in nestedFileURLs {
                    group.addTask {
                        do {
                            try Task.checkCancellation()
                            _ = try await self.uploadObjectFromURL(url: url, input: input)
                            return .success(())
                        } catch {
                            // Errors are caught and wrapped in .failure to allow individual error handling.
                            return .failure(error)
                        }
                    }
                }

                // Collect results of upload object child tasks.
                var successfulUploadCount = 0, failedUploadCount = 0
                while let uploadObjectResult = try await group.next() {
                    switch uploadObjectResult {
                    case .success:
                        successfulUploadCount += 1
                    case .failure(let error):
                        failedUploadCount += 1
                        do {
                            // Call failure policy to handle DownloadObject failure.
                            try await input.failurePolicy(error, input)
                        } catch { // input.failurePolicy threw an error; bubble up error.
                            // Error being thrown automatically cancels all tasks within throwing task group.
                            throw error
                        }
                    }
                }

                // Return counts.
                return (successfulUploadCount, failedUploadCount)
            }

            return UploadDirectoryOutput(
                objectsUploaded: successfulUploadCount,
                objectsFailed: failedUploadCount
            )
        }
    }

    private func getNestedFileURLs(
        in source: URL,
        recursive: Bool,
        followSymbolicLinks: Bool
    ) throws -> [URL] {
        var nestedFileURLs: [URL] = []
        var visitedCanonicalPaths = Set<String>()
        var nestedURLs = try getDirectlyNestedURLs(in: source)

        // BFS for processing URLs fetched from source directory.
        while !nestedURLs.isEmpty {
            var url = nestedURLs.removeFirst()
            let urlProperties = try url.resourceValues(
                forKeys: [.canonicalPathKey, .isDirectoryKey, .isRegularFileKey, .isSymbolicLinkKey]
            )

            // Skip symlink URL if configured to skip.
            if urlProperties.isSymbolicLink ?? false {
                if followSymbolicLinks {
                    // Resolve symlink URL to the actual file or directory.
                    url = url.resolvingSymlinksInPath()
                } else {
                    continue
                }
            }

            // Skip URL if it's already visited. Prevents symlink loop.
            guard let canonicalPath = urlProperties.canonicalPath else {
                throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: url)
            }
            if visitedCanonicalPaths.contains(canonicalPath) {
                logger.debug("Skipping a duplicate URL: \(url).")
                continue
            }

            // "Mark" URL as "visited".
            visitedCanonicalPaths.insert(canonicalPath)

            if urlProperties.isDirectory ?? false {
                if recursive {
                    nestedURLs.append(contentsOf: try getDirectlyNestedURLs(in: url))
                }
            } else if urlProperties.isRegularFile ?? false {
                nestedFileURLs.append(url)
            } else {
                logger.debug("Skipped URL because it's neither directory nor a regular file: \(url)")
                continue
            }
        }
        return nestedFileURLs
    }

    private func getDirectlyNestedURLs(in directory: URL) throws -> [URL] {
        return try FileManager.default.contentsOfDirectory(
            at: directory,
            includingPropertiesForKeys: [.canonicalPathKey, .isDirectoryKey, .isRegularFileKey, .isSymbolicLinkKey]
        )
    }

    private func uploadObjectFromURL(url: URL, input: UploadDirectoryInput) async throws {
        let resolvedObjectKey = try getResolvedObjectKey(
            of: url,
            inDir: input.source,
            input: input
        )

        var fileHandle: FileHandle
        do {
            fileHandle = try FileHandle.init(forReadingFrom: url)
        } catch {
            logger.debug("Could not read from URL: \(url.absoluteString), skipping.")
            return
        }

        let uploadObjectInput = UploadObjectInput(
            putObjectInput: input.putObjectRequestCallback(PutObjectInput(
                body: .stream(FileStream(fileHandle: fileHandle)),
                bucket: input.bucket,
                checksumAlgorithm: config.checksumAlgorithm,
                key: resolvedObjectKey
            ))
        )

        do {
            let uploadObjectTask = try uploadObject(input: uploadObjectInput)
            _ = try await uploadObjectTask.value
        } catch {
            throw S3TMUploadDirectoryError.FailedToUploadAnObject(
                originalErrorFromUploadObject: error,
                failedUploadObjectInput: uploadObjectInput
            )
        }
    }

    private func getResolvedObjectKey(of url: URL, inDir dir: URL, input: UploadDirectoryInput) throws -> String {
        // Step 1: if given a non-default s3Delimter, throw validation exception if the file name contains s3Delimiter.
        if (input.s3Delimiter != defaultPathSeparator()) {
            guard !url.lastPathComponent.contains(input.s3Delimiter) else {
                throw S3TMUploadDirectoryError.InvalidFileName(
                    "The file \"\(url.absoluteString)\" has S3 delimiter \"\(input.s3Delimiter)\" in its name."
                )
            }
        }
        // Step 2: append s3Delimiter to s3Prefix if it does not already end with it.
        var resolvedPrefix: String = ""
        if let providedPrefix = input.s3Prefix {
            resolvedPrefix = providedPrefix + (providedPrefix.hasSuffix(input.s3Delimiter) ? "" : input.s3Delimiter)
        }
        // Step 3: retrieve the relative path of the file URL.
        // Get canonical path of file URL & dir URL; remove canonical path of dir URL from file URL to get relative path.
        let dirCanonicalPath = try dir.resourceValues(forKeys: [.canonicalPathKey]).canonicalPath
        var fileCanonicalPath = try url.resourceValues(forKeys: [.canonicalPathKey]).canonicalPath
        guard let dirCanonicalPath else {
            throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: dir)
        }
        guard let fileCanonicalPath else {
            throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: url)
        }
        var relativePath = fileCanonicalPath.removePrefix(dirCanonicalPath)
        // Step 4: if the s3Delimiter isn't the system default file separator, replace default with the s3Delimiter in the relative path from step 3.
        if (input.s3Delimiter != defaultPathSeparator()) {
            relativePath = relativePath.replacingOccurrences(of: defaultPathSeparator(), with: input.s3Delimiter)
        }
        // Step 5: prefix s3Prefix to the string from Step 3.
        return resolvedPrefix + relativePath
    }
}

/// A non-exhausive list of errors that can be thrown by the UploadDirectory operation of S3 Transfer Manager.
public enum S3TMUploadDirectoryError: Error {
    case InvalidSourceURL(String)
    case FailedToGetCanonicalPathForURL(url: URL)
    case FailedToUploadAnObject(originalErrorFromUploadObject: Error, failedUploadObjectInput: UploadObjectInput)
    case InvalidFileName(String)
}
