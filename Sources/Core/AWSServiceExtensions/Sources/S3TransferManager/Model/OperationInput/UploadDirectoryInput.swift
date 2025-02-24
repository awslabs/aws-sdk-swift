//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import struct Foundation.URL
import struct Foundation.UUID

/// The synthetic input type for the `uploadDirectory` operation of `S3TransferManager`.
public struct UploadDirectoryInput: TransferInput {
    public let operationID: String = UUID().uuidString

    public let bucket: String
    public let source: URL
    public let followSymbolicLinks: Bool
    public let recursive: Bool
    public let s3Prefix: String?
    public let s3Delimiter: String
    public let putObjectRequestCallback: (PutObjectInput) -> PutObjectInput
    public let failurePolicy: FailurePolicy
    public let transferListeners: [TransferListener]

    /// Initializes `UploadDirectoryInput` with provided parameters.
    ///
    /// - Parameters:
    ///   - bucket: The name of the S3 bucket to upload the local directory to.
    ///   - source: The URL for the local directory to upload.
    ///   - followSymbolicLinks: The flag for whether to follow symlinks or not. Default value is `false`.
    ///   - recursive: The flag for whether to recursively upload `source` including contents of all subdirectories. Default value is `false`.
    ///   - s3Prefix: The S3 key prefix prepended to object keys during uploads. E.g., if this value is set to `"pre-"`, `source` is set to `/dir1`, and the file being uploaded is `/dir1/dir2/file.txt`, then the uploaded S3 object would have the key `pre-dir2/file.txt`. Default value is `nil`.
    ///   - s3Delimiter: The path separator to use in the object key. E.g., if `source` is `/dir1`, `s3Delimiter` is `"-"`, and the file being uploaded is `/dir1/dir2/dir3/dir4/file.txt`, then the uploaded S3 object will have the key `dir2-dir3-dir4-file.txt`. Default value is `"/"`, which is the system default path separator for all Apple platforms and Linux distros.
    ///   - putObjectRequestCallback: A closure that allows customizing the individual `PutObjectInput` passed to each part `putObject` calls used behind the scenes. Default behavior is a no-op closure that returns provided `PutObjectInput` without modification.
    ///   - failurePolicy: A closure that handles failed `uploadObject` operations. Default behavior is `DefaultFailurePolicy.rethrowExceptionToTerminateRequest`, which bubbles up the error to the caller and terminates the entire `uploadDirectory` operation.
    ///   - transferListeners: An array of `TransferListener`. The transfer progress of the operation will be published to each transfer listener provided here via hooks. Default value is an empty array.
    public init(
        bucket: String,
        source: URL,
        followSymbolicLinks: Bool = false,
        recursive: Bool = false,
        s3Prefix: String? = nil,
        s3Delimiter: String = "/",
        putObjectRequestCallback: @escaping (PutObjectInput) -> PutObjectInput = { input in return input },
        failurePolicy: @escaping FailurePolicy = DefaultFailurePolicy.rethrowExceptionToTerminateRequest,
        transferListeners: [TransferListener] = []
    ) throws {
        self.bucket = bucket
        self.source = source
        self.followSymbolicLinks = followSymbolicLinks
        self.recursive = recursive
        self.s3Prefix = s3Prefix
        self.s3Delimiter = s3Delimiter
        self.putObjectRequestCallback = putObjectRequestCallback
        self.failurePolicy = failurePolicy
        self.transferListeners = transferListeners
        try validateSourceURL(source)
    }

    private func validateSourceURL(_ source: URL) throws {
        let urlProperties = try source.resourceValues(forKeys: [.isDirectoryKey])
        guard urlProperties.isDirectory ?? false else {
            throw S3TMUploadDirectoryError.InvalidSourceURL("Invalid source: provided source URL is not a directory URL.")
        }
    }
}
