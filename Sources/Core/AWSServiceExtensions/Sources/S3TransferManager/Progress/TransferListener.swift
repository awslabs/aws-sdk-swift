//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyHTTPAPI

/// The protocol that all concrete transfer listeners must conform to.
///
/// The S3 Transfer Manager is "instrumented" with these transfer listener hooks.
/// 
/// Users can implement custom transfer listeners and provide it via the `transferListeners` argument of the input struct of a given operation.
/// For operation specific behavior (e.g., UploadObject vs. DownloadObject) or to access operation specific input fields, check i`TransferInput.operationType` field to safely typecast into the corresponding input type.
public protocol TransferListener {
    /// This method is invoked exactly once per transfer, right after the operation has starrted.
    func onTransferInitiated(input: TransferInput, snapshot: TransferProgressSnapshot)

    /// This method is invoked when some number of bytes are submitted or received. It is called at least once if transfer is successful.
    func onBytesTransferred(input: TransferInput, snapshot: TransferProgressSnapshot)

    /// This method is invoked when the transfer has completed successfully. It is called exactly once for a successful transfer.
    func onTransferComplete(input: TransferInput, output: TransferOutput, snapshot: TransferProgressSnapshot)

    /// This method is invoked when the transfer has failed. It is called exactly once for a failed transfer.
    func onTransferFailed(input: TransferInput, snapshot: TransferProgressSnapshot)
}
