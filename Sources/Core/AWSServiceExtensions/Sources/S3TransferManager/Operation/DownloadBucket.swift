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
            let objectKeyToCreatedFileURLMap: [String: URL] = try createDestinationFiles(
                keyToResolvedURLMapping: objectKeyToResolvedFileURLMap
            )

            let (successfulDownloadCount, failedDownloadCount) = try await withThrowingTaskGroup(
                // Each child task returns the result of a single download object call.
                of: Result<Void, Error>.self,
                // Task group returns success / failure counts of the download object calls.
                returning: (successfulDownloadCount: Int, failedDownloadCount: Int).self
            ) { group in
                // Add download object child tasks.
                for pair in objectKeyToCreatedFileURLMap {
                    group.addTask {
                        do {
                            try Task.checkCancellation()
                            _ = try await self.downloadSingleObject(objectKeyToURL: pair, input: input)
                            return .success(())
                        } catch {
                            // Errors are caught and wrapped in .failure to allow individual error handling.
                            return .failure(error)
                        }
                    }
                }

                // Collect results of download object child tasks.
                var successfulDownloadCount = 0, failedDownloadCount = 0
                while let downloadObjectResult = try await group.next() {
                    switch downloadObjectResult {
                    case .success:
                        successfulDownloadCount += 1
                    case .failure(let error):
                        failedDownloadCount += 1
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

    internal func fetchS3ObjectsUsingListObjectsV2Paginated(
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
            // If key ends with delimiter it's a 0-byte file used by S3 to simulate directory structure; skip that too.
            if filter(object) || originalKey.hasSuffix(s3Delimiter) {
               return nil
            }

            let keyWithoutPrefix = originalKey.removePrefix(s3Prefix ?? "")

            // Replace instances of s3Delimiter in keyWithoutPrefix with Mac/Linux system default
            //      path separtor "/" if s3Delimiter isn't "/".
            let relativeFilePath = s3Delimiter == defaultPathSeparator() ? keyWithoutPrefix : keyWithoutPrefix.replacingOccurrences(of: s3Delimiter, with: defaultPathSeparator())

            // If relativeFilePath escapes destination directory, skip the object.
            if (filePathEscapesDestination(filePath: relativeFilePath)) {
                return nil
            }

            // Return the mapping of original key to resolved file URL.
            return (originalKey, URL(string: destination.absoluteString.appendingPathComponent(relativeFilePath))!)
        })
    }

    // Returns mapping of original object keys to created file URLs.
    internal func createDestinationFiles(keyToResolvedURLMapping: [String: URL]) throws -> [String: URL] {
        var objectKeyToCreatedURLMapping: [String: URL] = [:]
        for pair in keyToResolvedURLMapping {
            let destinationPath = pair.value.standardizedFileURL.path
            // Check if a file already exists at destinationURL
            if FileManager.default.fileExists(atPath: destinationPath) {
                // Skip this object if there's duplicate.
                logger.debug("Skipping object with key \(pair.key) that resolves to location previously processed.")
                continue
            } else {
                try createFile(at: URL(fileURLWithPath: destinationPath))
            }

            // Save the resolved file URL mapping.
            objectKeyToCreatedURLMapping[pair.key] = pair.value
        }
        return objectKeyToCreatedURLMapping
    }

    internal func downloadSingleObject(
        objectKeyToURL pair: (key: String, value: URL),
        input: DownloadBucketInput
    ) async throws {
        guard let outputStream = OutputStream(url: pair.value, append: true) else {
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
            let downloadObjectTask = try downloadObject(input: downloadObjectInput)
            _ = try await downloadObjectTask.value
        } catch {
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

        // Create the directories if necessary.
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
    case FailedToDownloadAnObject(originalErrorFromDownloadObject: Error, failedDownloadObjectInput: DownloadObjectInput)
    case FailedToCreateNestedDestinationDirectory(at: URL)
}
