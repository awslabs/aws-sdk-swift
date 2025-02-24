//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.SwiftLogger

public struct LoggingTransferListener: TransferListener {
    private let logger = SwiftLogger(label: "LoggingTransferListener")

    public func onTransferInitiated(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
    }

    public func onBytesTransferred(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
    }

    public func onTransferComplete(
        input: any TransferInput,
        output: any TransferOutput,
        snapshot: any TransferProgressSnapshot
    ) {
    }

    public func onTransferFailed(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
    }
}
