//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

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

    // Helper function to convert PutObjectInput to CreateMultipartUploadInput.
    // Used if the upload size is above MPU threshold and upload needs to be done using MPU.
    private func getCreateMultipartUploadInput() -> CreateMultipartUploadInput {
        // The members of CreateMultipartUploadInput is a subset of PutObjectInput's members.
        return CreateMultipartUploadInput(
            acl: putObjectInput.acl,
            bucket: putObjectInput.bucket,
            bucketKeyEnabled: putObjectInput.bucketKeyEnabled,
            cacheControl: putObjectInput.cacheControl,
            checksumAlgorithm: putObjectInput.checksumAlgorithm,
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
}
