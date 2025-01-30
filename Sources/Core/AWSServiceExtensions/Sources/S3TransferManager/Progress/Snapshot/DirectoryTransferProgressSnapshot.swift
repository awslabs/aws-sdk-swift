//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The transfer progress snapshot for directory operations; UploadDirectory and DownloadBucket.
public struct DirectoryTransferProgressSnapshot: TransferProgressSnapshot {
    /// Total number of bytes transferred so far.
    public let transferredBytes: Int
    /// Total size of transfer. Known beforehand for upload; unknown for download until completion.
    public let totalBytes: Int?
    /// Total number of files successfully transferred so far.
    public let transferredFiles: Int
    // UploadDirectory and DownloadBucket use batch-processing; so it can't know the total number of files
    //  included in the give operation until it finishes. Hence, this will just be total number of fils that have been
    //  _attempted_ to be transferred at the time of inquiry. E.g., failed transfers + successful transfers.
    /// Total number of files of the transfer so far, including number of failed transfers.
    public let totalFiles: Int?
}
