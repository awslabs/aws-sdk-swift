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
            var visitedCanonicalPaths = Set<String>() // Used to prevent infinite loop from symlinks.

            // Get the list of files, symlinks, directories _directly nested_ under the source directory URL from user.
            var nestedURLs = try getNestedURLs(in: input.source)

            // Array of child tasks; each task will call S3TM::UploadObject for a single file.
            var tasks: [Task<Void, Error>] = []

            // Use BFS to iterate through each URL fetched from source URL & process them.
            while !nestedURLs.isEmpty {
                var url = nestedURLs.removeFirst()
                // URL properties of current URL.
                let resourceValues = try url.resourceValues(
                    forKeys: [.isSymbolicLinkKey, .isDirectoryKey, .canonicalPathKey]
                )

                // If current URL is symlink ...
                let isSymlink = resourceValues.isSymbolicLink ?? false
                if isSymlink {
                    // ... and we should follow it, resolve it to file or directory URL.
                    if input.followSymbolicLinks {
                        url = url.resolvingSymlinksInPath()
                    } else {
                        // ... and we shouldn't follow it, skip this URL.
                        continue
                    }
                }

                // Prevent loops using the canonical path; skip processing if it's a duplicate.
                guard let canonicalPath = resourceValues.canonicalPath else {
                    throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: url)
                }
                if visitedCanonicalPaths.contains(canonicalPath) {
                    logger.debug("Detected loop at \(canonicalPath), skipping.")
                    continue
                }
                // Append current URL's canonical path to visited log.
                visitedCanonicalPaths.insert(canonicalPath)

                let isDir = resourceValues.isDirectory ?? false
                if isDir {
                    // Add subdirectory contents into BFS queue only if the corresponding flag is set to true.
                    if input.recursive {
                        nestedURLs.append(contentsOf: try getNestedURLs(in: url))
                    }
                } else { // URL is a regular file URL.
                    // Check for cancellation before adding UploadObject child task.
                    try Task.checkCancellation()
                    // Append task that calls S3TM::UploadObject on the current file URL.
                    tasks.append(
                        Task {
                            // Resolve the key for the file, using s3Prefix, s3Delimiter, and relative path.
                            let resolvedObjectKey = try getResolvedObjectKey(
                                of: url,
                                inDir: input.source,
                                input: input
                            )
                            // Log message if failed to create fileHandle from file URL & skip upload.
                            var fileHandle: FileHandle
                            do {
                                fileHandle = try FileHandle.init(forReadingFrom: url)
                            } catch {
                                logger.debug("Could not read from URL: \(url.absoluteString)")
                                return
                            }
                            // Use input.putObjectRequestCallback to allow input customization.
                            let uploadObjectInput = UploadObjectInput(
                                putObjectInput: input.putObjectRequestCallback(PutObjectInput(
                                    body: .stream(FileStream(fileHandle: fileHandle)),
                                    bucket: input.bucket,
                                    checksumAlgorithm: config.checksumAlgorithm,
                                    key: resolvedObjectKey
                                ))
                            )
                            do {
                                // This is where an object actually gets uploaded.
                                _ = try uploadObject(input: uploadObjectInput)
                            } catch {
                                // Throw error with UploadObjectInput & original error.
                                // Allows custom failure policy to retry the request if desired.
                                throw S3TMUploadDirectoryError.FailedToUploadObject(
                                    originalErrorFromUploadObject: error,
                                    failedUploadObjectInput: uploadObjectInput
                                )
                            }
                        } // End child task.
                    )
                }
            } // End BFS while loop block.

            // By this point in code, `tasks` contains a child task for each file upload.
            var successfulUploadCount = 0, failedUploadCount = 0
            for task in tasks {
                do {
                    // Calling .value on the child task waits for the UploadObject grandchild task as well.
                    try await task.value
                    successfulUploadCount += 1
                } catch {
                    failedUploadCount += 1
                    do {
                        // Call failure policy to handle UploadObject failure.
                        try await input.failurePolicy(error, input)
                    } catch { // input.failurePolicy threw an error; cancel all tasks & bubble up error.
                        tasks.forEach { $0.cancel() }
                        throw error
                    }
                }
            }

            // Return output with counters.
            return UploadDirectoryOutput(objectsUploaded: successfulUploadCount, objectsFailed: failedUploadCount)
        } // End root Task block.
    }

    // Helper function to get file / directoy / symlink URLs nested directly under a directory URL.
    private func getNestedURLs(in directory: URL) throws -> [URL] {
        return try FileManager.default.contentsOfDirectory(
            at: directory,
            includingPropertiesForKeys: [.isSymbolicLinkKey, .isDirectoryKey, .canonicalPathKey]
        )
    }

    // Helper function to resolve S3 object key to use for upload.
    private func getResolvedObjectKey(of file: URL, inDir dir: URL, input: UploadDirectoryInput) throws -> String {
        // Step 1: if a non-default s3Delimter is used, throw validation exception if the file name contains s3Delimiter.
        if (input.s3Delimiter != defaultPathSeparator()) {
            guard !file.lastPathComponent.contains(input.s3Delimiter) else {
                throw S3TMUploadDirectoryError.InvalidFileName(
                    "The file \"\(file.absoluteString)\" has S3 delimiter \"\(input.s3Delimiter)\" in its name!"
                )
            }
        }
        // Step 2: append s3Delimiter to s3Prefix if it does not already end with it.
        var prefix = input.s3Prefix ?? input.s3Delimiter
        if !prefix.hasSuffix(input.s3Delimiter) {
            prefix = prefix + input.s3Delimiter
        }
        // Step 3: retrieve the relative path of the local file.
            // Get canonical path of file URL & dir URL; remove canonical path of dir URL from file URL to get relative path.
        let dirCanonicalPath = try dir.resourceValues(forKeys: [.canonicalPathKey]).canonicalPath
        var fileCanonicalPath = try file.resourceValues(forKeys: [.canonicalPathKey]).canonicalPath
        guard let dirCanonicalPath else {
            throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: dir)
        }
        guard let fileCanonicalPath else {
            throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: file)
        }
        var relativePath = fileCanonicalPath.removePrefix(dirCanonicalPath)
        // Step 4: if the system default file separator is different from the s3Delimiter, replace it with the s3Delimiter in the relative path from step 3.
        if (input.s3Delimiter != defaultPathSeparator()) {
            relativePath = relativePath.replacingOccurrences(of: defaultPathSeparator(), with: input.s3Delimiter)
        }
        // Step 5: prefix s3Prefix to the string from Step 3.
        return prefix + relativePath
    }
}

/// A non-exhausive list of errors that can be thrown by the UploadDirectory operation of S3 Transfer Manager.
public enum S3TMUploadDirectoryError: Error {
    case InvalidSourceURL(String)
    case FailedToGetCanonicalPathForURL(url: URL)
    case FailedToUploadObject(originalErrorFromUploadObject: Error, failedUploadObjectInput: UploadObjectInput)
    case InvalidFileName(String)
}
