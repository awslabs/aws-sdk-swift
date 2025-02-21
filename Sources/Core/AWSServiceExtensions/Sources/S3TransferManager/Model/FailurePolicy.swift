//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The closure signature for failure handler used by directory transfer operations (`uploadDirectory` and `downloadBucket`).
///
/// Custom policy can be provided by writing a closure that conforms to this typealias and providing it in the `UploadDirectoryInput` and/or `DownloadBucketInput`.
///
/// The closure takes in an `Error` instance whose underlying type is either `S3TMUploadDirectoryError.FailedToUploadAnObject` or `S3TMDownloadBucketError.FailedToDownloadAnObject`.
/// These concrete error types contain the original error thrown from the failed single object transfer & the single object transfer input used with the failed operation. I.e., you could provide a custom failure policy that retries the failed single object transfer by retrieving and re-using the `UploadObjectInput` / `DownloadObjectInput` nested within them.
///
/// The closure also takes in a `TransferInput` instance which is the original directory transfer input that was passed to the directory transfer operation (i.e., either `UploadDirectoryInput` or `DownloadBucketInput`).
public typealias FailurePolicy = (
    Error,
    TransferInput
) async throws -> Void

/// The enum namespace for two default failure policy closures `rethrowExceptionToTerminateRequest` and `ignoreFailureAndContinueTransfer`.
public enum DefaultFailurePolicy {
    /// A default failure policy that just re-throws the error from the failed single object transfer and terminates the directory transfer operation.
    public static let rethrowExceptionToTerminateRequest: FailurePolicy = {
        (failedSingleObjectTransferError: Error, directoryTransferInput: TransferInput) in
        throw failedSingleObjectTransferError // Just rethrow the error.
    }

    /// A default failure policy that ignores the error from the failed single object transfer.
    public static let ignoreFailureAndContinueTransfer: FailurePolicy = {
        (failedSingleObjectTransferError: Error, directoryTransferInput: TransferInput) in
        return // No-op; just return.
    }
}
