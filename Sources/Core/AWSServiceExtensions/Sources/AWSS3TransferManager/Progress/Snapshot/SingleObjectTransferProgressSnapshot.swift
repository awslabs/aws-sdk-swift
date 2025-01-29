//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The transfer progress snapshot for single object operations; UploadObject and DownloadObject.
public struct SingleObjectTransferProgressSnapshot: TransferProgressSnapshot {
    /// Total number of bytes transferred so far.
    public let transferredBytes: Int
    /// Total size of transfer. Known beforehand for upload; unknown for download until completion.
    public let totalBytes: Int?
}
