//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public typealias FailurePolicy = (
    Error, // Error from failed single object transfer during directory transfer.
    TransferInput // The original directory transfer input given to the operation.
) async throws -> Void

public enum DefaultFailurePolicy {
    public static let rethrowExceptionToTerminateRequest: FailurePolicy = {
        (failedSingleObjectTransferError: Error, directoryTransferInput: TransferInput) in
        // Just throw error back up.
        throw failedSingleObjectTransferError
    }

    public static let ignoreFailureAndContinueTransfer: FailurePolicy = {
        (failedSingleObjectTransferError: Error, directoryTransferInput: TransferInput) in
        // No-op; return.
        return
    }
}
