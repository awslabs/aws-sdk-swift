//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.OutputStream

/// The synthetic input type for AWS S3 Transfer Manager's DownloadObject operation.
///
/// This is a class instead of struct to allow modification to its `getObjectInput` member during S3TM operation.
public class DownloadObjectInput {
    let outputStream: OutputStream
    /// This is a var instead of a let because S3TM needs to be able to modify it as needed during the operation.
    var getObjectInput: GetObjectInput
    let transferListeners: [TransferListener]

    /// Creates the input type for single object download, used by AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///   - outputStream: Where the S3 transfer manager should write the retrieved S3 object to.
    ///   - getObjectInput: An instance of AWSS3.GetObjectInput struct.
    ///   - transferListeners: An array of TransferListeners. The transfer progress of DownloadObject operation will be published to each transfer listener provided here.
    public init(
        outputStream: OutputStream,
        getObjectInput: GetObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.outputStream = outputStream
        self.getObjectInput = getObjectInput
        self.transferListeners = transferListeners
    }
}
