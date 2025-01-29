//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.SwiftLogger

public class LoggingTransferListener: TransferListener {
    private let logger = SwiftLogger(label: "LoggingTransferListener")

    public func onTransferInitiated(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        logger.debug("\(input.operationType.rawValue) transfer initiated.")
    }

    public func onBytesTransferred(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        logger.debug(
            "\(input.operationType.rawValue) transfer processed more bytes; current total: \(snapshot.transferredBytes)"
        )
    }

    public func onTransferComplete(
        input: any TransferInput,
        output: any TransferOutput,
        snapshot: any TransferProgressSnapshot
    ) {
        logger.debug("\(input.operationType.rawValue) transfer complete. Total bytes transferred: \(snapshot.totalBytes!)")
    }

    public func onTransferFailed(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        logger.debug("\(input.operationType.rawValue) transfer failed.")
    }
}
