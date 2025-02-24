//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import enum Smithy.ByteStream
import struct Foundation.UUID

/// The synthetic input type for the `uploadObject` operation of `S3TransferManager`.
public struct UploadObjectInput: TransferInput {
    public let operationID: String

    public let putObjectInput: PutObjectInput
    public let transferListeners: [TransferListener]

    /// Initializes `UploadObjectInput` with provided parameters.
    ///
    /// - Parameters:
    ///   - putObjectInput: An instance of the `PutObjectInput`.
    ///   - transferListeners: An array of `TransferListener`. The transfer progress of the operation will be published to each transfer listener provided here via hooks. Default value is an empty array.
    public init(
        putObjectInput: PutObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.operationID = UUID().uuidString
        self.putObjectInput = putObjectInput
        self.transferListeners = transferListeners
    }

    // Internal initializer used by the `uploadDirectory` operation to provide specific operation IDs for
    //  "child" requests. Allows grouping requests together by the operation IDs.
    internal init(
        operationID: String,
        putObjectInput: PutObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.operationID = operationID
        self.putObjectInput = putObjectInput
        self.transferListeners = transferListeners
    }

    // MARK: - Internal helper functions for converting / transforming input(s).

    func getCreateMultipartUploadInput() -> CreateMultipartUploadInput {
        return CreateMultipartUploadInput(
            acl: putObjectInput.acl,
            bucket: putObjectInput.bucket,
            bucketKeyEnabled: putObjectInput.bucketKeyEnabled,
            cacheControl: putObjectInput.cacheControl,
            // Determine `checksumAlgorithm` by what's provided in `self.putObjectInput`.
            checksumAlgorithm: resolveChecksumAlgorithmForCreateMPUInput(putObjectInput),
            // Determine `checksumType` by what's provided in `self.putObjectInput`.
            checksumType: resolveChecksumType(putObjectInput),
            contentDisposition: putObjectInput.contentDisposition,
            contentEncoding: putObjectInput.contentEncoding,
            contentLanguage: putObjectInput.contentLanguage,
            contentType: putObjectInput.contentType,
            expectedBucketOwner: putObjectInput.expectedBucketOwner,
            expires: putObjectInput.expires,
            grantFullControl: putObjectInput.grantFullControl,
            grantRead: putObjectInput.grantRead,
            grantReadACP: putObjectInput.grantReadACP,
            grantWriteACP: putObjectInput.grantWriteACP,
            key: putObjectInput.key,
            metadata: putObjectInput.metadata,
            objectLockLegalHoldStatus: putObjectInput.objectLockLegalHoldStatus,
            objectLockMode: putObjectInput.objectLockMode,
            objectLockRetainUntilDate: putObjectInput.objectLockRetainUntilDate,
            requestPayer: putObjectInput.requestPayer,
            serverSideEncryption: putObjectInput.serverSideEncryption,
            sseCustomerAlgorithm: putObjectInput.sseCustomerAlgorithm,
            sseCustomerKey: putObjectInput.sseCustomerKey,
            sseCustomerKeyMD5: putObjectInput.sseCustomerKeyMD5,
            ssekmsEncryptionContext: putObjectInput.ssekmsEncryptionContext,
            ssekmsKeyId: putObjectInput.ssekmsKeyId,
            storageClass: putObjectInput.storageClass,
            tagging: putObjectInput.tagging,
            websiteRedirectLocation: putObjectInput.websiteRedirectLocation
        )
    }

    func getUploadPartInput(
        body: Smithy.ByteStream,
        partNumber: Int,
        uploadID: String
    ) -> UploadPartInput {
        return UploadPartInput(
            body: body,
            bucket: putObjectInput.bucket,
            // Determine checksum algorithm to use by what's provided in `self.putObjectInput`.
            checksumAlgorithm: resolveChecksumAlgorithmForCreateMPUInput(putObjectInput),
            checksumCRC32: putObjectInput.checksumCRC32,
            checksumCRC32C: putObjectInput.checksumCRC32C,
            checksumSHA1: putObjectInput.checksumSHA1,
            checksumSHA256: putObjectInput.checksumSHA256,
            contentLength: putObjectInput.contentLength,
            contentMD5: putObjectInput.contentMD5,
            expectedBucketOwner: putObjectInput.expectedBucketOwner,
            key: putObjectInput.key,
            partNumber: partNumber,
            requestPayer: putObjectInput.requestPayer,
            sseCustomerAlgorithm: putObjectInput.sseCustomerAlgorithm,
            sseCustomerKey: putObjectInput.sseCustomerKey,
            sseCustomerKeyMD5: putObjectInput.sseCustomerKeyMD5,
            uploadId: uploadID
        )
    }

    func getCompleteMultipartUploadInput(
        multipartUpload: S3ClientTypes.CompletedMultipartUpload,
        uploadID: String,
        mpuObjectSize: Int
    ) -> CompleteMultipartUploadInput {
        return CompleteMultipartUploadInput(
            bucket: putObjectInput.bucket,
            checksumCRC32: putObjectInput.checksumCRC32,
            checksumCRC32C: putObjectInput.checksumCRC32C,
            checksumSHA1: putObjectInput.checksumSHA1,
            checksumSHA256: putObjectInput.checksumSHA256,
            // Determine `checksumType` by what's provided in `self.putObjectInput`.
            checksumType: resolveChecksumType(putObjectInput),
            expectedBucketOwner: putObjectInput.expectedBucketOwner,
            ifMatch: putObjectInput.ifMatch,
            ifNoneMatch: putObjectInput.ifNoneMatch,
            key: putObjectInput.key,
            mpuObjectSize: mpuObjectSize,
            multipartUpload: multipartUpload,
            requestPayer: putObjectInput.requestPayer,
            sseCustomerAlgorithm: putObjectInput.sseCustomerAlgorithm,
            sseCustomerKey: putObjectInput.sseCustomerKey,
            sseCustomerKeyMD5: putObjectInput.sseCustomerKeyMD5,
            uploadId: uploadID
        )
    }

    func getAbortMultipartUploadInput(
        uploadID: String
    ) -> AbortMultipartUploadInput {
        return AbortMultipartUploadInput(
            bucket: putObjectInput.bucket,
            expectedBucketOwner: putObjectInput.expectedBucketOwner,
            key: putObjectInput.key,
            requestPayer: putObjectInput.requestPayer,
            uploadId: uploadID
        )
    }

    private func resolveChecksumAlgorithmForCreateMPUInput(
        _ putObjectInput: PutObjectInput
    ) -> S3ClientTypes.ChecksumAlgorithm {
        // If algorithm was configurd on the `PutObjectInput`, just return that.
        if let algo = putObjectInput.checksumAlgorithm {
            return algo
        }
        // Otherwise, check if any checksum value was provided; return matching algorithm if present.
        // Follow the algorithm priority in `smithy-swift/Sources/SmithyChecksums/ChecksumAlgorithm.swift`.
        if putObjectInput.checksumCRC32C != nil {
            return .crc32c
        }
        if putObjectInput.checksumCRC32 != nil {
            return .crc32
        }
        if putObjectInput.checksumSHA1 != nil {
            return .sha1
        }
        if putObjectInput.checksumSHA256 != nil {
            return .sha256
        }
        // If no checksum hash nor checksum algorithm was configured, return CRC32.
        // It's the default algorithm for Swift SDK.
        return .crc32
    }

    /*
        `CreateMultipartUploadInput` & `CompleteMultipartUploadInput` have the `checksumType` input member.
        `PutObjectInput` doesn't have that member.
        So, for create / complete MPU inputs, must determine the value of `checksumType` based on whether the full object checksum was manually provided by the user in `PutObjectInput` or not.
     */
    private func resolveChecksumType(
        _ input: PutObjectInput
    ) -> S3ClientTypes.ChecksumType? {
        let providedChecksum = input.checksumCRC32 ?? input.checksumCRC32C ?? input.checksumSHA1 ?? input.checksumSHA256 ?? input.checksumCRC64NVME
        if providedChecksum != nil {
            return .fullObject
        } else {
            return .composite
        }
    }
}
