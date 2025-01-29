//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public typealias UploadDirectoryFailurePolicy = (
    Error, // Error from failed UploadObject call during UploadDirectory operation.
    UploadDirectoryInput // The original UploadDirectoryInput given to UploadDirectory operation.
) async throws -> Void

public enum DefaultUploadDirectoryFailurePolicy {
    public static let rethrowExceptionToTerminateRequest: UploadDirectoryFailurePolicy = {
        (failedUploadObjectError: Error, uploadDirectoryInput: UploadDirectoryInput) in
        // Just throw error back up.
        throw failedUploadObjectError
    }

    public static let ignoreFailureAndContinueTransfer: UploadDirectoryFailurePolicy = {
        (failedUploadObjectError: Error, uploadDirectoryInput: UploadDirectoryInput) in
        // No-op; return.
        return
    }
}

public typealias DownloadBucketFailurePolicy = (
    Error, // Error from failed DownloadObject call during DownloadBucket operation.
    DownloadBucketInput // The original DownloadBucketInput given to DownloadBucket operation.
) async throws -> Void

public enum DefaultDownloadBucketFailurePolicy {
    public static let rethrowExceptionToTerminateRequest: DownloadBucketFailurePolicy = {
        (failedDownloadObjectError: Error, downloadBucketInput: DownloadBucketInput) in
        // Just throw error back up.
        throw failedDownloadObjectError
    }

    public static let ignoreFailureAndContinueTransfer: DownloadBucketFailurePolicy = {
        (failedDownloadObjectError: Error, downloadBucketInput: DownloadBucketInput) in
        // No-op; return.
        return
    }
}
