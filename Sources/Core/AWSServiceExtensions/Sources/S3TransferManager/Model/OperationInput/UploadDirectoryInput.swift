//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import struct Foundation.URL

/// The synthetic input type for the UploadDirectory operation of S3 Transfer Manager.
public struct UploadDirectoryInput: TransferInput {
    public let operationType: OperationType = .uploadDirectory

    public let bucket: String
    public let source: URL
    public let followSymbolicLinks: Bool
    public let recursive: Bool
    public let s3Prefix: String?
    public let s3Delimiter: String
    public let putObjectRequestCallback: (PutObjectInput) -> PutObjectInput
    public let failurePolicy: FailurePolicy
    public let transferListeners: [TransferListener]

    /// Creates `UploadDirectoryInput` using provided parameters.
    ///
    /// - Parameters:
    ///   - bucket: The name of the S3 bucket to upload local directory to.
    ///   - source: The URL for the local directory to upload.
    ///   - followSymbolicLinks: The flag for whether to follow symlinks or not during recursive upload. Default is value is `false`.
    ///   - recursive: The flag for whether to recursively upload the local directory, including contents of all subdirectories. Default value is `false`.
    ///   - s3Prefix: All files uploaded will have this prefix prepended to their object key values. Default value is `nil`.
    ///   - s3Delimiter: All files uploaded will use this as their path separator in the object key instead of the system default. E.g., if `source` is `/dir1`, `s3Delimiter` is `"-"`, and the file being uploaded is at `/dir1/dir2/dir3/dir4/file.txt`, the uploaded S3 object will have the key `dir2-dir3-dir4-file.txt`. Default value is `"/"`, which is the system default path separator for all Apple platforms and Linux distros.
    ///   - putObjectRequestCallback: A closure that allows input customization for the individual `PutObjectInput` used behind the scenes. Default behavior is a no-op closure that returns provided input without modification.
    ///   - failurePolicy: A closure that handles failed operations. Default behavior is simple bubble-up of the error, which causes the operation and all child tasks to get cancelled.
    ///   - transferListeners: An array of `TransferListener`. The transfer progress of the UploadDirectory operation will be published to each transfer listener provided here via hooks. Default value is an empty array.
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
    }

    private func validateSourceURL(_ source: URL, followSymbolicLinks: Bool) throws {
        let urlProperties = try source.resourceValues(forKeys: [.isDirectoryKey, .isSymbolicLinkKey])
        guard urlProperties.isDirectory ?? false else {
            throw S3TMUploadDirectoryError.InvalidSourceURL("Provided source URL is not a directory URL.")
        }
        if (urlProperties.isSymbolicLink ?? false) && !followSymbolicLinks {
            throw S3TMUploadDirectoryError.InvalidSourceURL(
                "Provided source URL is symlink for a direcotry, but `input.followSymbolicLinks` is false."
            )
        }
    }
}
