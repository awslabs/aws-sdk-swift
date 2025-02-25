//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The transfer progress snapshot for single object operations; `uploadObject` and `downloadObject`.
public struct SingleObjectTransferProgressSnapshot: TransferProgressSnapshot {
    /// Total number of bytes transferred so far.
    public let transferredBytes: Int
    /// Total size of the transfer. Known beforehand for upload; unknown for download until completion.
    public let totalBytes: Int?

    public init(transferredBytes: Int, totalBytes: Int? = nil) {
        self.transferredBytes = transferredBytes
        self.totalBytes = totalBytes
    }
}
