//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The transfer progress snapshot protocol.
public protocol TransferProgressSnapshot {
    /// Total number of bytes transferred so far.
    var transferredBytes: Int { get }
    /// Total size of transfer. Known beforehand for upload; unknown for download until completion.
    var totalBytes: Int? { get }
}
