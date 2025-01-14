//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

/// The synthetic input type for AWS S3 Transfer Manager's DownloadObject operation.
public struct DownloadObjectInput {
    let getObjectInput: GetObjectInput
    let transferListeners: [TransferListener]

    /// Creates the input type for single object download, used by AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///   - getObjectInput: An instance of AWSS3.GetObjectInput struct.
    ///   - transferListeners: An array of TransferListeners. The transfer progress of DownloadObject operation will be published to each transfer listener provided here.
    public init(
        getObjectInput: GetObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.getObjectInput = getObjectInput
        self.transferListeners = transferListeners
    }
}
