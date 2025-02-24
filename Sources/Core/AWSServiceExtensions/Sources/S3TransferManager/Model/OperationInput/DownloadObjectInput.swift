//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.OutputStream
import struct Foundation.UUID

/// The synthetic input type for the `downloadObject` operation of `S3TransferManager`.
public struct DownloadObjectInput: TransferInput {
    public let operationID: String

    public let outputStream: OutputStream
    public let getObjectInput: GetObjectInput
    public let transferListeners: [TransferListener]

    /// Initializes `DownloadObjectInput` with provided parameters.
    ///
    /// - Parameters:
    ///   - outputStream: The destination of the downloaded S3 object.
    ///   - getObjectInput: An instance of the `GetObjectInput` struct.
    ///   - transferListeners: An array of `TransferListener`. The transfer progress of the operation will be published to each transfer listener provided here via hooks. Default value is an empty array.
    public init(
        outputStream: OutputStream,
        getObjectInput: GetObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.operationID = UUID().uuidString
        self.outputStream = outputStream
        self.getObjectInput = getObjectInput
        self.transferListeners = transferListeners
    }

    // Internal initializer used by the `downloadBucket` operation to provide specific operation IDs for
    //  "child" requests. Allows grouping requests together by the operation IDs.
    internal init(
        operationID: String,
        outputStream: OutputStream,
        getObjectInput: GetObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.operationID = operationID
        self.outputStream = outputStream
        self.getObjectInput = getObjectInput
        self.transferListeners = transferListeners
    }

    // MARK: - Internal helper functions for converting / transforming input(s).

    func copyGetObjectInputWithPartNumberOrRange(
        partNumber: Int? = nil,
        range: String? = nil
    ) -> GetObjectInput {
        return GetObjectInput(
            bucket: getObjectInput.bucket,
            checksumMode: getObjectInput.checksumMode,
            expectedBucketOwner: getObjectInput.expectedBucketOwner,
            ifMatch: getObjectInput.ifMatch,
            ifModifiedSince: getObjectInput.ifModifiedSince,
            ifNoneMatch: getObjectInput.ifNoneMatch,
            ifUnmodifiedSince: getObjectInput.ifUnmodifiedSince,
            key: getObjectInput.key,
            partNumber: partNumber ?? getObjectInput.partNumber,
            range: range ?? getObjectInput.range,
            requestPayer: getObjectInput.requestPayer,
            responseCacheControl: getObjectInput.responseCacheControl,
            responseContentDisposition: getObjectInput.responseContentDisposition,
            responseContentEncoding: getObjectInput.responseContentEncoding,
            responseContentLanguage: getObjectInput.responseContentLanguage,
            responseContentType: getObjectInput.responseContentType,
            responseExpires: getObjectInput.responseExpires,
            sseCustomerAlgorithm: getObjectInput.sseCustomerAlgorithm,
            sseCustomerKey: getObjectInput.sseCustomerKey,
            sseCustomerKeyMD5: getObjectInput.sseCustomerKeyMD5,
            versionId: getObjectInput.versionId
        )
    }
}
