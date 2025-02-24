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
    /// If the `Task` returned by the function gets cancelled, all child tasks also get cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `DownloadBucketInput`, the synthetic input type specific to this operation of `S3TransferManager`.
    /// - Returns: An asynchronous `Task<DownloadBucketOutput, Error>` that can be optionally waited on or cancelled as needed.
    func downloadBucket(input: DownloadBucketInput) throws -> Task<DownloadBucketOutput, Error> {
        return Task {
            let s3 = config.s3Client
            try validateOrCreateDestinationDirectory(input: input)

            let objects = try await fetchS3ObjectsUsingListObjectsV2Paginated(s3: s3, input: input)
            let objectKeyToResolvedFileURLMap: [String: URL] = getFileURLsResolvedFromObjectKeys(
                objects: objects,
                destination: input.destination,
                s3Prefix: input.s3Prefix,
                s3Delimiter: input.s3Delimiter,
                filter: input.filter
            )
            // Subset of `objectKeyToResolvedFileURLMap` above.
            // If resolved fileURL escapes the destination directory, it gets skipped.
            let objectKeyToCreatedFileURLMap: [String: URL] = try createDestinationFiles(
                keyToResolvedURLMapping: objectKeyToResolvedFileURLMap
            )

            let (successfulDownloadCount, failedDownloadCount) = try await withThrowingTaskGroup(
                // Each child task returns the result of a single `downloadObject` call.
                of: Result<Void, Error>.self,
                // Task group returns success & failure counts of all the `downloadObject` calls.
                returning: (successfulDownloadCount: Int, failedDownloadCount: Int).self
            ) { group in
                // Add `downloadObject` child tasks.
                var downloadObjectOperationNum = 1
                for pair in objectKeyToCreatedFileURLMap {
                    group.addTask {
                        do {
                            try Task.checkCancellation()
                            _ = try await self.downloadSingleObject(
                                objectKeyToURL: pair,
                                input: input,
                                operationNumber: downloadObjectOperationNum
                            )
                            return .success(())
                        } catch {
                            // Errors are caught and wrapped in .failure to allow individual error handling.
                            return .failure(error)
                        }
                    }
                    downloadObjectOperationNum += 1
                }

                // Collect results of `downloadObject` child tasks.
                var successfulDownloadCount = 0, failedDownloadCount = 0

                while let downloadObjectResult = try await group.next() {
                    switch downloadObjectResult {
                    case .success:
                        successfulDownloadCount += 1
                    case .failure(let error):
                        failedDownloadCount += 1
                        do {
                            // Call failure policy closure to handle `downloadObject` failure.
                            try await input.failurePolicy(error, input)
                        } catch { // input.failurePolicy threw an error; bubble up the error.
                            // Error being thrown here automatically cancels all tasks within the throwing task group.
                            throw error
                        }
                    }
                }

                // Return the counts.
                return (successfulDownloadCount, failedDownloadCount)
            }

            return DownloadBucketOutput(
                objectsDownloaded: successfulDownloadCount,
                objectsFailed: failedDownloadCount
            )
        }
    }

    internal func validateOrCreateDestinationDirectory(input: DownloadBucketInput) throws {
        if FileManager.default.fileExists(atPath: input.destination.path) {
            // Throw if destination exists but isn't a directory.
            guard try input.destination.resourceValues(forKeys: [.isDirectoryKey]).isDirectory ?? false else {
                throw S3TMDownloadBucketError.ProvidedDestinationIsNotADirectory
            }
        } else {
            // Create the destination directory if it's not present.
            do {
                try FileManager.default.createDirectory(at: input.destination, withIntermediateDirectories: true)
            } catch {
                throw S3TMDownloadBucketError.FailedToCreateDestinationDirectory
            }
        }
    }

    private func fetchS3ObjectsUsingListObjectsV2Paginated(
        s3: S3Client,
        input: DownloadBucketInput
    ) async throws -> [S3ClientTypes.Object] {
        var objects: [S3ClientTypes.Object] = []
        let paginatorOutputs = s3.listObjectsV2Paginated(input: ListObjectsV2Input(
            bucket: input.bucket,
            prefix: input.s3Prefix
        ))
        for try await output in paginatorOutputs {
            guard let contents = output.contents else {
                throw S3TMDownloadBucketError.FailedToRetrieveObjectsUsingListObjectsV2
            }
            objects += contents
        }
        return objects
    }

    internal func getFileURLsResolvedFromObjectKeys(
        objects: [S3ClientTypes.Object],
        destination: URL,
        s3Prefix: String? = nil,
        s3Delimiter: String,
        filter: (S3ClientTypes.Object) -> Bool
    ) -> [String: URL] {
        return Dictionary(uniqueKeysWithValues: objects.compactMap { object -> (String, URL)? in
            let originalKey = object.key!

            // Use user-provided filter to skip objects.
            // If key ends with delimiter, it's a 0-byte file used by S3 to simulate directory structure; skip that too.
            if filter(object) || originalKey.hasSuffix(s3Delimiter) {
               return nil
            }

            let keyWithoutPrefix = originalKey.removePrefix(s3Prefix ?? "")

            // Replace instances of s3Delimiter in keyWithoutPrefix with Mac/Linux system default
            //      path separtor "/" if s3Delimiter isn't "/".
            // This effectively "translates" object key value to a file path.
            let relativeFilePath = s3Delimiter == defaultPathSeparator() ? keyWithoutPrefix : keyWithoutPrefix.replacingOccurrences(of: s3Delimiter, with: defaultPathSeparator())

            // If relativeFilePath escapes destination directory, skip it.
            if (filePathEscapesDestination(filePath: relativeFilePath)) {
                return nil
            }

            // Return the mapping of original key to resolved file URL.
            return (originalKey, URL(string: destination.absoluteString.appendingPathComponent(relativeFilePath))!)
        })
    }

    internal func createDestinationFiles(keyToResolvedURLMapping: [String: URL]) throws -> [String: URL] {
        var objectKeyToCreatedURLMapping: [String: URL] = [:]
        for pair in keyToResolvedURLMapping {
            let destinationPath = pair.value.standardizedFileURL.path
            // Check if a file already exists at destinationURL.
            if FileManager.default.fileExists(atPath: destinationPath) {
                // Skip this object if there's duplicate.
                logger.debug("Skipping object with key \(pair.key) that resolves to location previously processed.")
                continue
            } else {
                try createFile(at: URL(fileURLWithPath: destinationPath))
            }

            // Save the created file URL mapping.
            objectKeyToCreatedURLMapping[pair.key] = pair.value
        }
        return objectKeyToCreatedURLMapping
    }

    private func downloadSingleObject(
        objectKeyToURL pair: (key: String, value: URL),
        input: DownloadBucketInput,
        operationNumber: Int
    ) async throws {
        guard let outputStream = OutputStream(url: pair.value, append: true) else {
            throw S3TMDownloadBucketError.FailedToCreateOutputStreamForFileURL(url: pair.value)
        }
        let downloadObjectInput = DownloadObjectInput(
            operationID: input.operationID + "-\(operationNumber)",
            outputStream: outputStream,
            getObjectInput: GetObjectInput(
                bucket: input.bucket,
                // User must've set `s3Client.config.responseChecksumValidation` to `.whenRequired` as well
                //  to disable response checksum validation.
                checksumMode: config.checksumValidationEnabled ? .enabled : .sdkUnknown("DISABLED"),
                key: pair.key
            ),
            transferListeners: input.transferListeners
        )
        do {
            // Create S3TM `downloadObject` task and await its completion before returning.
            let downloadObjectTask = try downloadObject(input: downloadObjectInput)
            _ = try await downloadObjectTask.value
        } catch {
            // Upon failure, wrap the original error and the input in the synthetic error and throw.
            throw S3TMDownloadBucketError.FailedToDownloadAnObject(
                originalErrorFromDownloadObject: error,
                failedDownloadObjectInput: downloadObjectInput
            )
        }
    }

    internal func filePathEscapesDestination(filePath: String) -> Bool {
        let pathComponents = filePath.components(separatedBy: defaultPathSeparator())
        var nestedLevel = 0
        for component in pathComponents {
            if component == ".." {
                nestedLevel -= 1
            } else {
                nestedLevel += 1
            }
            // If at any point we go outside of destination directory (negative level), return true.
            // It _could_ come back into destination directory, but we just return as soon as it escapes for simplicity.
            if nestedLevel < 0 {
                return true
            }
        }
        return false
    }

    internal func createFile(at url: URL) throws {
        let fileManager = FileManager.default

        // Get the directory path by deleting the last path component (the file name)
        let directoryURL = url.deletingLastPathComponent()

        do {
            // No-op if directory already exists.
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw S3TMDownloadBucketError.FailedToCreateNestedDestinationDirectory(at: directoryURL)
        }

        // Create the file at the specified location
        fileManager.createFile(atPath: url.path, contents: nil)
    }
}

/// A non-exhaustive list of errors that can be thrown by the `downloadBucket` operation of `S3TransferManager`.
public enum S3TMDownloadBucketError: Error {
    case ProvidedDestinationIsNotADirectory
    case FailedToCreateDestinationDirectory
    case FailedToRetrieveObjectsUsingListObjectsV2
    case FailedToCreateOutputStreamForFileURL(url: URL)
    case FailedToDownloadAnObject(
        originalErrorFromDownloadObject: Error,
        failedDownloadObjectInput: DownloadObjectInput
    )
    case FailedToCreateNestedDestinationDirectory(at: URL)
}
