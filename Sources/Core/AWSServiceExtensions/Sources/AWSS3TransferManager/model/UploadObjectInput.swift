//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import enum Smithy.ByteStream

/// The synthetic input type for AWS S3 Transfer Manager's UploadObject operation.
public struct UploadObjectInput {
    let putObjectInput: PutObjectInput
    let transferListeners: [TransferListener]

    /// Creates the input type for single object upload, used by AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///   - putObjectInput: An instance of AWSS3.PutObjectInput struct.
    ///   - transferListeners: An array of TransferListeners. The transfer progress of UploadObject operation will be published to each transfer listener provided here.
    public init(
        putObjectInput: PutObjectInput,
        transferListeners: [TransferListener] = []
    ) {
        self.putObjectInput = putObjectInput
        self.transferListeners = transferListeners
    }

    // Helper function to construct CreateMultipartUploadInput from PutObjectInput.
    func getCreateMultipartUploadInput() -> CreateMultipartUploadInput {
        return CreateMultipartUploadInput(
            acl: putObjectInput.acl,
            bucket: putObjectInput.bucket,
            bucketKeyEnabled: putObjectInput.bucketKeyEnabled,
            cacheControl: putObjectInput.cacheControl,
            checksumAlgorithm: resolveChecksumAlgorithmForCreateMPUInput(putObjectInput),
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

    // Helper function to construct UploadPartInput from PutObjectInput.
    func getUploadPartInput(
        body: Smithy.ByteStream,
        partNumber: Int,
        uploadID: String
    ) -> UploadPartInput {
        return UploadPartInput(
            body: body,
            bucket: putObjectInput.bucket,
            checksumAlgorithm: putObjectInput.checksumAlgorithm,
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

    // Helper function to construct CompleteMultipartUploadInput from PutObjectInput.
    func getCompleteMultipartUploadInput(
        multipartUpload: S3ClientTypes.CompletedMultipartUpload,
        uploadID: String,
        mpuObjectSize: String
    ) -> CompleteMultipartUploadInput {
        return CompleteMultipartUploadInput(
            bucket: putObjectInput.bucket,
            checksumCRC32: putObjectInput.checksumCRC32,
            checksumCRC32C: putObjectInput.checksumCRC32C,
            checksumSHA1: putObjectInput.checksumSHA1,
            checksumSHA256: putObjectInput.checksumSHA256,
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

    // Helper function to construct AbortMultipartUploadInput from PutObjectInput.
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
        // If algorithm was configurd on PutObjectInput, just return that.
        if let algo = putObjectInput.checksumAlgorithm {
            return algo
        }
        // Otherwise, check for any checksum value provided; return algorithm if configured.
        // Follow the algorithm priority in smithy-swift/Sources/SmithyChecksums/ChecksumAlgorithm.swift.
        if let crc32cChecksum = putObjectInput.checksumCRC32C {
            return .crc32c
        }
        if let crc32Checksum = putObjectInput.checksumCRC32 {
            return .crc32
        }
        if let sha1Checksum = putObjectInput.checksumSHA1 {
            return .sha1
        }
        if let sha256Checksum = putObjectInput.checksumSHA256 {
            return .sha256
        }
        // If no checksum nor checksum algorithm was configured, return CRC32.
        // It's the default algorithm for Swift SDK.
        return .crc32
    }

    private func resolveChecksumType(
        _ input: PutObjectInput
    ) -> S3ClientTypes.ChecksumType? {
        let checksum = input.checksumCRC32 ?? input.checksumCRC32C ?? input.checksumSHA1 ?? input.checksumSHA256 ?? input.checksumCRC64NVME
        if let checksum {
            return .fullObject
        } else {
            return .composite
        }
    }
}
