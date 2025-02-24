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
        let message: String = "Operation started."
        logS3TMOperation(input: input, message: message)
    }

    public func onBytesTransferred(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            // Print the percentage progress bar based on `transferredBytes` & `totalBytes`.
        case .downloadObject(let downloadObjectInput):
            // Print number of bytes written to the output stream based on `transferredBytes`.
        case .uploadDirectory(let uploadDirectoryInput):
            () // Intentionally no-op.
        case .downloadBucket(let downloadBucketInput):
            () // Intentionally no-op.
        }
    }

    public func onTransferComplete(
        input: any TransferInput,
        output: any TransferOutput,
        snapshot: any TransferProgressSnapshot
    ) {
        let message: String = "Operation finished successfully."
        logS3TMOperation(input: input, message: message)
    }

    public func onTransferFailed(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let message: String = "Operation failed."
        logS3TMOperation(input: input, message: message)
    }

    private func logS3TMOperation(input: any TransferInput, message: String) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            logger.debug("[UploadObject \(uploadObjectInput.operationID)] \(message)")
        case .downloadObject(let downloadObjectInput):
            logger.debug("[DownloadObject \(downloadObjectInput.operationID)] \(message)")
        case .uploadDirectory(let uploadDirectoryInput):
            logger.debug("[UploadDirectory \(uploadDirectoryInput.operationID)] \(message)")
        case .downloadBucket(let downloadBucketInput):
            logger.debug("[DownloadBucket \(downloadBucketInput.operationID)] \(message)")
        }
    }
}
