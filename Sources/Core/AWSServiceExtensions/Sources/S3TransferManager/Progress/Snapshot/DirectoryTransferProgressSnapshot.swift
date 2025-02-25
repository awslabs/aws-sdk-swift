//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The transfer progress snapshot for directory operations; `uploadDirectory` and `downloadBucket`.
public struct DirectoryTransferProgressSnapshot: TransferProgressSnapshot {
    /// Total number of files successfully transferred so far.
    public let transferredFiles: Int
    // `uploadDirectory` and `downloadBucket` use batch-processing; so it can't know the total number of files
    //  included in the give operation until it finishes. Hence, this will just be total number of fils that have been
    //  _attempted_ to be transferred at the time of inquiry. E.g., failed transfers + successful transfers.
    /// Total number of files processed by the transfer so far, including number of failed transfers.
    public let totalFiles: Int?

    public init(transferredFiles: Int, totalFiles: Int? = nil) {
        self.transferredFiles = transferredFiles
        self.totalFiles = totalFiles
    }
}
