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
            try await validateOrCreateDestinationDirectory(input: input)

            let objects = try await fetchS3ObjectsUsingListObjectsV2Paginated(s3: s3, input: input)
            let objectKeyToURLMapping = try resolveAndCreateDestinationFileURLs(of: objects, input: input)

            let (successfulDownloadCount, failedDownloadCount) = try await withThrowingTaskGroup(
                // Each child task returns the result of a single download object call.
                of: Result<Void, Error>.self,
                // Task group returns success / failure counts of the download object calls.
                returning: (successfulDownloadCount: Int, failedDownloadCount: Int).self
            ) { group in
                // Add download object child tasks.
                for pair in objectKeyToURLMapping {
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

    private func validateOrCreateDestinationDirectory(input: DownloadBucketInput) async throws {
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

    private func resolveAndCreateDestinationFileURLs(
        of objects: [S3ClientTypes.Object],
        input: DownloadBucketInput
    ) throws -> [String: URL] {
        var objectKeyToURLMapping: [String: URL] = [:]
        // For each fetched object, resolve the destination URL, create file, & save the mapping.
        for object in objects {
            let originalKey = object.key!
            // USe user-provided filter to skip objects.
            // If key ends with "/" it's a 0-byte file used by S3 to simulate directory structure; skip that too.
            if input.filter(object) || originalKey.hasSuffix("/") {
               continue
            }

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

        return objectKeyToURLMapping
    }

    private func downloadSingleObject(
        objectKeyToURL pair: (key: String, value: URL),
        input: DownloadBucketInput
    ) async throws {
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
            let downloadObjectTask = try downloadObject(input: downloadObjectInput)
            _ = try await downloadObjectTask.value
        } catch {
            throw S3TMDownloadBucketError.FailedToDownloadAnObject(
                originalErrorFromDownloadObject: error,
                failedDownloadObjectInput: downloadObjectInput
            )
        }
    }

    private func filePathIsInsideDirectory(directoryURL: URL, filePath: String) -> Bool {
        // Get the file URL by appending the path to the directory URL.
        let fileURL = directoryURL.appendingPathComponent(filePath)

        // Resolve the standardized paths for both the directory and file.
        let standardizedDirectoryPath = directoryURL.standardizedFileURL.path
        let standardizedFilePath = fileURL.standardizedFileURL.path

        // Check if the standardized file path starts with the standardized directory path.
        return standardizedFilePath.hasPrefix(standardizedDirectoryPath)
    }

    private func createFile(at url: URL) throws {
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
