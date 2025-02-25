//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.SwiftLogger

public struct LoggingTransferListener: TransferListener {
    private let logger = SwiftLogger(label: "LoggingTransferListener")

    public init() {}

    public func onTransferInitiated(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        let messagePrefix = "Transfer started."
        var message: String = ""
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            let objectKey = uploadObjectInput.putObjectInput.key!
            let bucket = uploadObjectInput.putObjectInput.bucket!
            message = "\(messagePrefix) Resolved object key: \"\(objectKey)\". Destination bucket: \"\(bucket)\"."
        case .downloadObject(let downloadObjectInput):
            let objectKey = downloadObjectInput.getObjectInput.key!
            let bucket = downloadObjectInput.getObjectInput.bucket!
            message = "\(messagePrefix) Object key: \"\(objectKey)\". Source bucket: \"\(bucket)\"."
        case .uploadDirectory(let uploadDirectoryInput):
            let source = uploadDirectoryInput.source.path
            let bucket = uploadDirectoryInput.bucket
            message = "\(messagePrefix) Source directory path: \"\(source)\". Destination bucket: \"\(bucket)\"."
        case .downloadBucket(let downloadBucketInput):
            let bucket = downloadBucketInput.bucket
            let destination = downloadBucketInput.destination.path
            message = "\(messagePrefix) Source bucket: \"\(bucket)\". Destination directory path: \"\(destination)\"."
        }
        logS3TMOperation(input: input, message: message)
    }

    public func onBytesTransferred(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        var message: String = ""
        switch transferInputType {
        case .uploadObject:
            message = getProgressBarString(snapshot: snapshot)
        case .downloadObject:
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            message = "Downloaded more bytes. Running total: \(singleObjectSnapshot.transferredBytes)"
        case .uploadDirectory:
            return // Intentionally no-op. `uploadObject` handles lower-level byte transfer logs above.
        case .downloadBucket:
            return // Intentionally no-op. `downloadObject` handles lower-level byte transfer logs above.
        }
        logS3TMOperation(input: input, message: message)
    }

    public func onTransferComplete(
        input: any TransferInput,
        output: any TransferOutput,
        snapshot: any TransferProgressSnapshot
    ) {
        let messagePrefix = "Transfer completed successfully."
        var message: String = "onTransferComplete message"
        switch snapshot {
        case let snapshot as SingleObjectTransferProgressSnapshot:
            message = "\(messagePrefix) Total number of transferred bytes: \(snapshot.transferredBytes)"
        case let snapshot as DirectoryTransferProgressSnapshot:
            message = "\(messagePrefix) Total number of transferred files: \(snapshot.transferredFiles)"
        default:
            () // Unreachable case; added to quiet compiler.
        }
        logS3TMOperation(input: input, message: message)
    }

    public func onTransferFailed(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let message: String = "Transfer failed."
        logS3TMOperation(input: input, message: message)
    }

    // Helper function that constructs progress bar string.
    private func getProgressBarString(snapshot: TransferProgressSnapshot) -> String {
        let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
        // Example progress bar string: |==========          | 50.0%
        let barWidth = 20
        let ratio = Double(singleObjectSnapshot.transferredBytes) / Double(singleObjectSnapshot.totalBytes!)
        // (X / 20) = (transferredBytes / totalBytes) where X is the number of "=" we want.
        let filledCount = Int(ratio * Double(barWidth))
        let emptyCount = barWidth - filledCount

        let filledSection = String(repeating: "=", count: filledCount)
        let emptySection = String(repeating: " ", count: emptyCount)
        let percentage = String(format: "%.1f", ratio * 100)
        return "|\(filledSection)\(emptySection)| \(percentage)%"
    }

    // Helper function that logs provided message with operation name & operation ID prefix.
    private func logS3TMOperation(input: any TransferInput, message: String) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            logger.info("[UploadObject ID: \(uploadObjectInput.operationID)] \(message)")
        case .downloadObject(let downloadObjectInput):
            logger.info("[DownloadObject ID: \(downloadObjectInput.operationID)] \(message)")
        case .uploadDirectory(let uploadDirectoryInput):
            logger.info("[UploadDirectory ID: \(uploadDirectoryInput.operationID)] \(message)")
        case .downloadBucket(let downloadBucketInput):
            logger.info("[DownloadBucket ID: \(downloadBucketInput.operationID)] \(message)")
        }
    }
}
