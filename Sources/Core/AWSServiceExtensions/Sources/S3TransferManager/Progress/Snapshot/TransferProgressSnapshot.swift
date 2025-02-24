//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The parent protocol of `SingleObjectTransferProgressSnapshot` and `DirectoryTransferProgressSnapshot`.
public protocol TransferProgressSnapshot {
    /// Total number of bytes transferred so far.
    var transferredBytes: Int { get }
    /// Total size of the transfer. Known beforehand for upload; unknown for download until completion.
    var totalBytes: Int? { get }
}
