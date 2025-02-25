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
    /// Uploads local directory to a S3 bucket.
    ///
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function gets cancelled, all child tasks also get cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadDirectoryInput`, the synthetic input type specific to this operation of `S3TransferManager`.
    /// - Returns: An asynchronous `Task<UploadDirectoryOutput, Error>` that can be optionally waited on or cancelled as needed.
    func uploadDirectory(input: UploadDirectoryInput) throws -> Task<UploadDirectoryOutput, Error> {
        return Task {
            onTransferInitiated(
                input.transferListeners,
                input,
                DirectoryTransferProgressSnapshot(transferredFiles: 0, totalFiles: 0)
            )
            let nestedFileURLs = try getNestedFileURLs(
                in: input.source,
                recursive: input.recursive,
                followSymbolicLinks: input.followSymbolicLinks
            )
            let (successfulUploadCount, failedUploadCount) = try await withThrowingTaskGroup(
                // Each child task returns the result of a single `uploadObject` call.
                of: Result<Void, Error>.self,
                // Task group returns success & failure counts of all the `uploadObject` calls.
                returning: (successfulUploadCount: Int, failedUploadCount: Int).self
            ) { group in
                // Add `uploadObject` child tasks.
                var uploadObjectOperationNum = 1
                for url in nestedFileURLs {
                    group.addTask {
                        do {
                            try Task.checkCancellation()
                            _ = try await self.uploadObjectFromURL(
                                url: url,
                                input: input,
                                operationNumber: uploadObjectOperationNum
                            )
                            return .success(())
                        } catch {
                            // Errors are caught and wrapped in .failure to allow individual error handling.
                            return .failure(error)
                        }
                    }
                    uploadObjectOperationNum += 1
                }

                // Collect results of `uploadObject` child tasks.
                var successfulUploadCount = 0, failedUploadCount = 0
                while let uploadObjectResult = try await group.next() {
                    switch uploadObjectResult {
                    case .success:
                        successfulUploadCount += 1
                    case .failure(let error):
                        failedUploadCount += 1
                        do {
                            // Call failure policy closure to handle `uploadObject` failure.
                            try await input.failurePolicy(error, input)
                        } catch { // input.failurePolicy threw an error; bubble up the error.
                            // Error being thrown here automatically cancels all tasks within the throwing task group.
                            onTransferFailed(
                                input.transferListeners,
                                input,
                                DirectoryTransferProgressSnapshot(
                                    transferredFiles: successfulUploadCount,
                                    totalFiles: successfulUploadCount + failedUploadCount
                                )
                            )
                            throw error
                        }
                    }
                }

                // Return the counts.
                return (successfulUploadCount, failedUploadCount)
            }

            let uploadDirectoryOutput = UploadDirectoryOutput(
                objectsUploaded: successfulUploadCount,
                objectsFailed: failedUploadCount
            )
            onTransferComplete(
                input.transferListeners,
                input,
                uploadDirectoryOutput,
                DirectoryTransferProgressSnapshot(
                    transferredFiles: successfulUploadCount,
                    totalFiles: successfulUploadCount + failedUploadCount
                )
            )
            return uploadDirectoryOutput
        }
    }

    internal func getNestedFileURLs(
        in source: URL,
        recursive: Bool,
        followSymbolicLinks: Bool
    ) throws -> [URL] {
        var nestedFileURLs: [URL] = []
        var visitedURLs = Set<String>()

        // Mark source directory as visited.
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
            // If it's a directory URL & TM is configured to be recursive:
            if resolvedURLProperties.isDirectory ?? false && recursive {
                // Add subdirectory's directly nested file URLs to the BFS queue.
                let directlyNestedURLs = try getDirectlyNestedURLs(in: originalURL, isSymlink: originalURLIsSymlink)
                bfsQueue.append(contentsOf: directlyNestedURLs)
            } else if resolvedURLProperties.isRegularFile ?? false {
                // If it's a regular file, save it to the return value array.
                nestedFileURLs.append(originalURL)
            }
        }

        return nestedFileURLs
    }

    /*
        Note on logic:

        If originalDirURL is a symlink, we resolve it to get the resolvedDirURL because FileManager's contentsOfDirectory() doesn't work with symlink URL that points to a directory.

        Then we retrieve relative path URLs of the directly nested files using resolvedDirURL, and _swap out_ the base URLs (stuff before relative path URL) with the originalDirURL.

        This is done because we want to keep symlink names in the paths of nested URLs. For example, say we have the file structure below:
                |- dir
                    |- symlinkToDir2
                |- dir2
                    |- file.txt

        If dir/ is the source directory being uploaded and TM is configured to follow symlinks and subdirectories, we want file.txt to have the path "dir/symlinkToDir2/file.txt" (notice the name of symlink in path leading to file.txt), rather than "dir2/file.txt". We then use the path "dir/symlinkToDir2/file.txt" to resolve the object key to upload the file with.
     */
    internal func getDirectlyNestedURLs(
        in originalDirURL: URL,
        isSymlink: Bool
    ) throws -> [URL] {
        // Resolve original directory URL if it's a symlink.
        let resolvedDirURL = isSymlink ? originalDirURL.resolvingSymlinksInPath() : originalDirURL
        // Get file URLs (files, symlinks, directories, etc.) exactly one level below the provided directory URL.
        let directlyNestedURLs = try FileManager.default.contentsOfDirectory(
            at: resolvedDirURL,
            includingPropertiesForKeys: [.isDirectoryKey, .isRegularFileKey, .isSymbolicLinkKey],
            // If source directory URL is symlink, get relative path URLs.
            options: isSymlink ? [.producesRelativePathURLs] : []
        )
        return isSymlink ? directlyNestedURLs.map {
            // Swap out the base URL in relative path URLs; swap out resolvedDirURL with the originalDirURL.
            URL(string: originalDirURL.absoluteString.appendingPathComponent($0.relativePath))!
        } : directlyNestedURLs // Return without changing base URL if original URL wasn't a symlink.
    }

    private func uploadObjectFromURL(
        url: URL,
        input: UploadDirectoryInput,
        operationNumber: Int
    ) async throws {
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
            operationID: input.operationID + "-\(operationNumber)",
            // This is the callback that allows custom modifications of
            //  the individual `PutObjectInput` structs for the SDK user.
            putObjectInput: input.putObjectRequestCallback(PutObjectInput(
                body: .stream(FileStream(fileHandle: fileHandle)),
                bucket: input.bucket,
                checksumAlgorithm: config.checksumAlgorithm,
                key: resolvedObjectKey
            )),
            transferListeners: input.transferListeners
        )

        do {
            // Create S3TM `uploadObject` task and await its completion before returning.
            let uploadObjectTask = try uploadObject(input: uploadObjectInput)
            _ = try await uploadObjectTask.value
        } catch {
            // Upon failure, wrap the original error and the input in the synthetic error and throw.
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
        // Get absolute string of file URL & dir URL; remove dir URL prefix from file URL to get the relative path.
        let dirAbsoluteString = dir.absoluteString
        let fileAbsoluteString = url.absoluteString
        var relativePath = fileAbsoluteString.removePrefix(dirAbsoluteString)
        // Step 4: if user configured a custom s3Delimiter, replace all instances of system default path separator "/" in the relative path from step 3 with the custom s3Delimiter.
        if (input.s3Delimiter != defaultPathSeparator()) {
            relativePath = relativePath.replacingOccurrences(of: defaultPathSeparator(), with: input.s3Delimiter)
        }
        // Step 5: prefix the string from Step 4 with the resolved prefix.
        return resolvedPrefix + relativePath
    }
}

/// A non-exhaustive list of errors that can be thrown by the `uploadDirectory` operation of `S3TransferManager`.
public enum S3TMUploadDirectoryError: Error {
    case InvalidSourceURL(String)
    case FailedToUploadAnObject(
        originalErrorFromUploadObject: Error,
        failedUploadObjectInput: UploadObjectInput
    )
    case InvalidFileName(String)
}
