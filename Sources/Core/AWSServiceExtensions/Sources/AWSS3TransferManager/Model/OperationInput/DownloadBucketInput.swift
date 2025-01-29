//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import struct Foundation.URL

/// The synthetic input type for the DownloadBucket operation of AWS S3 Transfer Manager.
public struct DownloadBucketInput: TransferInput {
    public let operationType: OperationType = .downloadBucket

    public let bucket: String
    public let destination: URL
    public let s3Prefix: String?
    public let s3Delimiter: String
    public let filter: (S3ClientTypes.Object) -> Bool
    public let getObjectRequestCallback: (GetObjectInput) -> GetObjectInput
    public let failurePolicy: DownloadBucketFailurePolicy
    public let transferListeners: [TransferListener]

    /// Creates `DownloadBucketInput` using provided parameters.
    ///
    /// - Parameters:
    ///   - bucket: The name of the S3 bucket to download.
    ///   - destination: The URL for the local directory to download the S3 bucket to.
    ///   - s3Prefix: If non-nil, only the S3 objects that have this prefix will be downloaded. All downloaded files will be saved to the `destination`, with this prefix removed. E.g., if `destination` is `"/dir1/dir2/"`, provided `s3Prefix` is `"dir3/dir4"`, and object key is `"dir3/dir4/dir5/file.txt"`, the object will be saved to `"/dir1/dir2/dir5/file.txt"`, which is destination + (object key - prefix). Default value is `nil`.
    ///   - s3Delimiter: Specifies what delimiter is used by the S3 objects you want to download. All downloaded files will be saved to the location resolved by replacing specified `s3Delimiter` with system default path separator `"/"`. E.g., if `destination` is `"/dir1"`, `s3Delimiter` is `"-"`, and the object key is `"dir2-dir3-dir4-file.txt"`, the object will be saved to `"/dir1/dir2/dir3/dir4/file.txt"`.  Default value is `"/"`, which is the system default path separator for all Apple platforms and Linux distros.
    ///   - putObjectRequestCallback: A closure that allows input customization for the individual `PutObjectInput` used behind the scenes. Default behavior is a no-op closure that returns provided input without modification.
    ///   - failurePolicy: A closure that handles failed operations. Default behavior is simple bubble-up of the error, which causes the operation and all child tasks to get cancelled.
    ///   - transferListeners: An array of `TransferListener`. The transfer progress of the UploadDirectory operation will be published to each transfer listener provided here via hooks. Default value is an empty array.
    public init(
        bucket: String,
        destination: URL,
        s3Prefix: String? = nil,
        s3Delimiter: String = "/",
        filter: @escaping (S3ClientTypes.Object) -> Bool = { input in return false },
        getObjectRequestCallback: @escaping (GetObjectInput) -> GetObjectInput = { input in return input },
        failurePolicy: @escaping DownloadBucketFailurePolicy = DefaultDownloadBucketFailurePolicy.rethrowExceptionToTerminateRequest,
        transferListeners: [TransferListener] = []
    ) {
        self.bucket = bucket
        self.destination = destination
        self.s3Prefix = s3Prefix
        self.s3Delimiter = s3Delimiter
        self.filter = filter
        self.getObjectRequestCallback = getObjectRequestCallback
        self.failurePolicy = failurePolicy
        self.transferListeners = transferListeners
    }
}
