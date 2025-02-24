//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyHTTPAPI

/// The protocol that all concrete transfer listener types must conform to.
///
/// The operations of `S3TransferManager` are "instrumented" with these transfer listener hooks.
///
/// Users can implement custom transfer listeners and provide it via the `transferListeners` argument of the corresponding operation input struct.
public protocol TransferListener {
    /// This method is invoked exactly once per transfer, right after the operation has started.
    func onTransferInitiated(input: TransferInput, snapshot: TransferProgressSnapshot)

    /// This method is invoked when some number of bytes are submitted or received. It is called at least once for a successful transfer.
    func onBytesTransferred(input: TransferInput, snapshot: TransferProgressSnapshot)

    /// This method is invoked when the transfer has completed successfully. It is called exactly once for a successful transfer.
    func onTransferComplete(input: TransferInput, output: TransferOutput, snapshot: TransferProgressSnapshot)

    /// This method is invoked when the transfer has failed. It is called exactly once for a failed transfer.
    func onTransferFailed(input: TransferInput, snapshot: TransferProgressSnapshot)
}
