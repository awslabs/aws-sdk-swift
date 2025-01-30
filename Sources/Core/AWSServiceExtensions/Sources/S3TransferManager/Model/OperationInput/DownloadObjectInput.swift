//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.OutputStream

/// The synthetic input type for the DownloadObject operation of S3 Transfer Manager.
public struct DownloadObjectInput: TransferInput {
    public let operationType: OperationType = .downloadObject

    public let outputStream: OutputStream
    public let getObjectInput: GetObjectInput
    public let transferListeners: [TransferListener]

    /// Creates `DownloadObjectInput` using `GetObjectInput`.
    ///
    /// - Parameters:
    ///   - outputStream: Where the S3 transfer manager should write the retrieved S3 object to.
    ///   - getObjectInput: An instance of `GetObjectInput` struct.
    ///   - transferListeners: An array of `TransferListener`. The transfer progress of DownloadObject operation will be published to each transfer listener provided here via hooks. Default value is an empty array.
    public init(
        outputStream: OutputStream,
        getObjectInput: GetObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.outputStream = outputStream
        self.getObjectInput = getObjectInput
        self.transferListeners = transferListeners
    }

    // Helper function to get copy of `self.getObjectInput` but using provided partNumber of range.
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
