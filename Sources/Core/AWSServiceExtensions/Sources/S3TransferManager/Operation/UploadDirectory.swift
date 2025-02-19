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

    internal func getNestedFileURLs(
        in source: URL,
        recursive: Bool,
        followSymbolicLinks: Bool
    ) throws -> [URL] {
        var nestedFileURLs: [URL] = []
        var visitedURLs = Set<String>()
        visitedURLs.insert(source.resolvingSymlinksInPath().absoluteString)

        // Start BFS with files directly nested below source directory.
        var bfsQueue = try getDirectlyNestedURLs(
            in: source,
            isSymlink: source.resourceValues(forKeys: [.isSymbolicLinkKey]).isSymbolicLink ?? false
        )

        // BFS for processing URLs contained in source directory.
        while !bfsQueue.isEmpty {
            let originalURL = bfsQueue.removeFirst()
            let originalURLProperties = try originalURL.resourceValues(
                forKeys: [.isSymbolicLinkKey]
            )
            let originalURLIsSymlink = originalURLProperties.isSymbolicLink ?? false
            if originalURLIsSymlink && !followSymbolicLinks {
                continue
            }

            // URL without "./", "../", and symlinks.
            let resolvedURL = originalURL.resolvingSymlinksInPath()

            // Skip if current URL has already been looked at.
            if visitedURLs.contains(resolvedURL.absoluteString) {
                logger.debug("Skipping a duplicate URL: \(originalURL).")
                continue
            }

            // Add resolved URL to visited set.
            visitedURLs.insert(resolvedURL.absoluteString)

            let resolvedURLProperties = try resolvedURL.resourceValues(
                forKeys: [.isDirectoryKey, .isRegularFileKey]
            )
            // If current URL is / points to a directory URL & TM is configured to be recursive:
            if resolvedURLProperties.isDirectory ?? false && recursive {
                // Process the directly nested URLs and add them to BFS queue.
                let directlyNestedURLs = try getDirectlyNestedURLs(in: originalURL, isSymlink: originalURLIsSymlink)
                bfsQueue.append(contentsOf: directlyNestedURLs)
            } else if resolvedURLProperties.isRegularFile ?? false {
                nestedFileURLs.append(originalURL)
            }
        }

        return nestedFileURLs
    }

    /*
        Q: Why are we using resolvedDirURL to retrieve files nested by it, and prefixing returned URLs with originalDirURL?

        A: Because we want to keep symlink names in the paths of nested URLs.

        If originalDirURL is a _symlink_ to a directory, we need to resolve it to resolvedDirURL because FileManager's contentsOfDirectory() doesn't work with symlink URL that points to a dir.
        The URLs fetched using resolvedDirURL therefore have resolvedDirURL as their base URL. Say the filesystem is structured like below:

                |- dir
                    |- symlinkToDir2
                |- dir2
                    |- file.txt

        If dir/ is the directory being uploaded and TM is configured to follow symlinks and subdirectories, we need file.txt to have the path "dir/symlinkToDir2/file.txt" (notice the name of symlink in path leading to file.txt), rather than "dir2/file.txt". We use that path to resolve the object key to upload the file with.
     */
    internal func getDirectlyNestedURLs(
        in originalDirURL: URL,
        isSymlink: Bool
    ) throws -> [URL] {
        let resolvedDirURL = isSymlink ? originalDirURL.resolvingSymlinksInPath() : originalDirURL
        // Gets file URLs (files, symlinks, directories, etc.) exactly one level below provided directory URL.
        let directlyNestedURLs = try FileManager.default.contentsOfDirectory(
            at: resolvedDirURL,
            includingPropertiesForKeys: [.isDirectoryKey, .isRegularFileKey, .isSymbolicLinkKey],
            options: isSymlink ? [.producesRelativePathURLs] : []
        )
        return isSymlink ? directlyNestedURLs.map {
            // Use original directory URL as base URL (prefix) to the relative path of newly fetched nested URL.
            URL(string: originalDirURL.absoluteString.appendingPathComponent($0.relativePath))!
        } : directlyNestedURLs // Return without changing base URL if original URL wasn't a symlink.
    }

    internal func uploadObjectFromURL(url: URL, input: UploadDirectoryInput) async throws {
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

    internal func getResolvedObjectKey(of url: URL, inDir dir: URL, input: UploadDirectoryInput) throws -> String {
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
        // Get absolute string of file URL & dir URL; remove dir URL prefix from file URL to get relative path.
        let dirAbsoluteString = dir.absoluteString
        let fileAbsoluteString = url.absoluteString
        var relativePath = fileAbsoluteString.removePrefix(dirAbsoluteString)
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
    case FailedToUploadAnObject(originalErrorFromUploadObject: Error, failedUploadObjectInput: UploadObjectInput)
    case InvalidFileName(String)
}
