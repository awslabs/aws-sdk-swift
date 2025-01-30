//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.FileManager
import class Foundation.OutputStream
import struct Foundation.URL

public extension S3TransferManager {
    /// Downloads S3 bucket to a local directory.
    ///
    /// Returns a `Task` immediately after function call; download is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `DownloadBucketInput`, a synthetic input type specific to this operation of the S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<DownloadBucketOutput, Error>` that can be waited on or cancelled as needed.
    func downloadBucket(input: DownloadBucketInput) throws -> Task<DownloadBucketOutput, Error> {
        return Task {
            // S3 client used for the operation.
            let s3 = config.s3Client

            // Set-up to ensure that we have a valid destination directory.
            if FileManager.default.fileExists(atPath: input.destination.path) {
                guard try input.destination.resourceValues(forKeys: [.isDirectoryKey]).isDirectory ?? false else {
                    throw S3TMDownloadBucketError.ProvidedDestinationIsNotADirectory
                }
            } else {
                // Create the destination directory if not present.
                do {
                    try FileManager.default.createDirectory(at: input.destination, withIntermediateDirectories: true)
                } catch {
                    throw S3TMDownloadBucketError.FailedToCreateDestinationDirectory
                }
            }

            // Counters that get returned at the end upon operation completion.
            var successfulDownloadCount = 0, failedDownloadCount = 0

            // The ListObjectsV2 calls must be made serially due to the nature of its continuation token.
            // The repeat-while loop below fetches all object keys with provided prefix (if nil, every object in bucket),
            //      resolves the destination URL for each object key, and creates the files at the resolved URLs.
            var nextContinuationToken: String? = nil
            repeat {
                let listObjectsV2Output = try await s3.listObjectsV2(
                    // Prefix must use user-provided prefix & delimiter must be null.
                    // This gets all objects with given prefix as a flat list of key-value pairs.
                    input: ListObjectsV2Input(
                        bucket: input.bucket,
                        continuationToken: nextContinuationToken,
                        prefix: input.s3Prefix
                    )
                )
                // Save new next continuation token; if nil, ListObjectsV2 won't be called anymore.
                nextContinuationToken = listObjectsV2Output.nextContinuationToken
                // Fetch objects from ListObjectsV2Output.
                guard let contents = listObjectsV2Output.contents else {
                    throw S3TMDownloadBucketError.FailedToRetrieveObjectsUsingListObjectsV2
                }

                // For each fetched object, resolve the destination URL, create file, & save the mapping.
                var objectKeyToURLMapping: [String: URL] = [:]
                for object in contents {
                    let originalKey = object.key!
                    // USe user-provided filter to skip objects.
                    // If key ends with "/" it's a 0-byte file used by S3 to simulate directory structure; skip that too.
                    if input.filter(object) || originalKey.hasSuffix("/") {
                       continue
                    }

                    // Remove prefix from object key value
                    let keyWithoutPrefix = originalKey.removePrefix(input.s3Prefix ?? "")

                    // Replace instances of input.s3Delimiter in keyWithoutPrefix with Mac/Linux system default
                    //      path separtor "/" if input.s3Delimiter isn't "/".
                    let keyWithSystemPathSeparator = input.s3Delimiter == defaultPathSeparator() ? keyWithoutPrefix : keyWithoutPrefix.replacingOccurrences(of: input.s3Delimiter, with: defaultPathSeparator())

                    // If key escapes to parent directory, skip the object.
                    if (filePathIsInsideDirectory(directoryURL: input.destination, filePath: keyWithoutPrefix)) {
                        continue
                    }

                    // Create destination URL for the object.
                    let destinationURL = input.destination.appendingPathComponent(keyWithSystemPathSeparator)
                    let destinationPath = destinationURL.absoluteString.replacingOccurrences(
                        of: "file://", with: ""
                    )

                    // Check if a file already exists at destinationURL
                    if FileManager.default.fileExists(atPath: destinationPath) {
                        // Skip this object if there's duplicate.
                        logger.debug("Skipping object with key \(originalKey) that resolves to location previously processed.")
                        continue
                    } else {
                        try createFile(at: destinationURL)
                    }

                    // Save the resolved file URL mapping.
                    objectKeyToURLMapping[originalKey] = destinationURL
                }

                // List of concurrent tasks; each task is for a single downloadObject operation.
                var tasks: [Task<Void, Error>] = []

                // Iterate through dictionary. Concurrently call S3TM::DownloadObject on each.
                for pair in objectKeyToURLMapping {
                    try Task.checkCancellation()
                    // Add task for downloading object
                    tasks.append(
                        Task {
                            guard let outputStream = OutputStream(url: pair.value, append: false) else {
                                throw S3TMDownloadBucketError.FailedToCreateOutputStreamForFileURL(url: pair.value)
                            }
                            let downloadObjectInput = DownloadObjectInput(
                                outputStream: outputStream,
                                getObjectInput: GetObjectInput(
                                    bucket: input.bucket,
                                    // User must've set s3Client.config.responseChecksumValidation to false as well
                                    //  to disable response checksum validation.
                                    checksumMode: config.checksumValidationEnabled ? .enabled : .sdkUnknown("DISABLED"),
                                    key: pair.key
                                )
                            )
                            do {
                                // This is where an object is actually downloaded.
                                _ = try downloadObject(input: downloadObjectInput)
                            } catch {
                                throw S3TMDownloadBucketError.FailedToDownloadObject(
                                    originalErrorFromDownloadObject: error,
                                    failedDownloadObjectInput: downloadObjectInput
                                )
                            }
                        }
                    )
                }

                // Iterate through each child task; handle failures based on failure policy.
                for task in tasks {
                    do {
                        // Calling .value on child task waits for DownloadObject grandchild task as well.
                        try await task.value
                        successfulDownloadCount += 1
                    } catch {
                        failedDownloadCount += 1
                        do {
                            // Call failure policy to handle DownloadObject failure.
                            try await input.failurePolicy(error, input)
                        } catch { // input.failurePolicy threw an error; cancel all tasks & rethrow error back up.
                            tasks.forEach { $0.cancel() }
                            throw error
                        }
                    }
                }
            } while nextContinuationToken != nil // Repeat processing object keys until there's no more objects.

            // Return output with counters.
            return DownloadBucketOutput(objectsDownloaded: successfulDownloadCount, objectsFailed: failedDownloadCount)
        }
    }

    // Helper function that returns true iff provided file path is contained with provided directory URL.
    private func filePathIsInsideDirectory(directoryURL: URL, filePath: String) -> Bool {
        // Get the file URL by appending the path to the directory URL
        let fileURL = directoryURL.appendingPathComponent(filePath)

        // Resolve the standardized paths for the directory and file
        let standardizedDirectoryPath = directoryURL.standardizedFileURL.path
        let standardizedFilePath = fileURL.standardizedFileURL.path

        // Check if the standardized file path starts with the standardized directory path
        return standardizedFilePath.hasPrefix(standardizedDirectoryPath)
    }

    // Helper function for creating a file at the given URL; creates directories as needed along the way.
    private func createFile(at url: URL) throws {
        let fileManager = FileManager.default

        // Get the directory path by deleting the last path component (the file name)
        let directoryURL = url.deletingLastPathComponent()

        // Create the directory (and all intermediate directories, if necessary)
        do {
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw S3TMDownloadBucketError.FailedToCreateNestedDestinationDirectory(at: directoryURL)
        }

        // Create the file at the specified location
        fileManager.createFile(atPath: url.path, contents: nil)
    }
}

/// A non-exhausive list of errors that can be thrown by the DownloadBucket operation of S3 Transfer Manager.
public enum S3TMDownloadBucketError: Error {
    case ProvidedDestinationIsNotADirectory
    case FailedToCreateDestinationDirectory
    case FailedToRetrieveObjectsUsingListObjectsV2
    case FailedToCreateOutputStreamForFileURL(url: URL)
    case FailedToDownloadObject(originalErrorFromDownloadObject: Error, failedDownloadObjectInput: DownloadObjectInput)
    case FailedToCreateNestedDestinationDirectory(at: URL)
}
