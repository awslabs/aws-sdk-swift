//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

/// The synthetic output type for the UploadObject operation of S3 Transfer Manager.
///
/// This type contains the member intersection of `PutObjectOutput` and `CompleteMultipartUploadOutput`.
public struct UploadObjectOutput: TransferOutput {
    /// Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key Management Service (KMS) keys (SSE-KMS).
    public let bucketKeyEnabled: Swift.Bool?
    /// The base64-encoded, 32-bit CRC-32 checksum of the object. This will only be present if it was uploaded with the object. When you use an API operation on an object that was uploaded using multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a calculation based on the checksum values of each individual part. For more information about how checksums are calculated with multipart uploads, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums) in the Amazon S3 User Guide.
    public let checksumCRC32: Swift.String?
    /// The base64-encoded, 32-bit CRC-32C checksum of the object. This will only be present if it was uploaded with the object. When you use an API operation on an object that was uploaded using multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a calculation based on the checksum values of each individual part. For more information about how checksums are calculated with multipart uploads, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums) in the Amazon S3 User Guide.
    public let checksumCRC32C: Swift.String?
    /// The base64-encoded, 160-bit SHA-1 digest of the object. This will only be present if it was uploaded with the object. When you use the API operation on an object that was uploaded using multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a calculation based on the checksum values of each individual part. For more information about how checksums are calculated with multipart uploads, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums) in the Amazon S3 User Guide.
    public let checksumSHA1: Swift.String?
    /// The base64-encoded, 256-bit SHA-256 digest of the object. This will only be present if it was uploaded with the object. When you use an API operation on an object that was uploaded using multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a calculation based on the checksum values of each individual part. For more information about how checksums are calculated with multipart uploads, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums) in the Amazon S3 User Guide.
    public let checksumSHA256: Swift.String?
    /// This header specifies the checksum type of the object, which determines how part-level checksums are combined to create an object-level checksum for multipart objects. For PutObject uploads, the checksum type is always FULL_OBJECT. You can use this header as a data integrity check to verify that the checksum type that is received is the same checksum that was specified. For more information, see [Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let checksumType: S3ClientTypes.ChecksumType?
    /// Entity tag that identifies the newly created object's data. Objects with different object data will have different entity tags. The entity tag is an opaque string. The entity tag may or may not be an MD5 digest of the object data. If the entity tag is not an MD5 digest of the object data, it will contain one or more nonhexadecimal characters and/or will consist of less than 32 or more than 32 hexadecimal digits. For more information about how the entity tag is calculated, see [Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let eTag: Swift.String?
    /// If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL-encoded. This functionality is not supported for directory buckets.
    public let expiration: Swift.String?
    /// If present, indicates that the requester was successfully charged for the request. This functionality is not supported for directory buckets.
    public let requestCharged: S3ClientTypes.RequestCharged?
    /// The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).
    public let serverSideEncryption: S3ClientTypes.ServerSideEncryption?
    /// If present, indicates the ID of the KMS key that was used for object encryption.
    public let ssekmsKeyId: Swift.String?
    /// Version ID of the newly created object, in case the bucket has versioning turned on. This functionality is not supported for directory buckets.
    public let versionId: Swift.String?

    /// Creates `UploadObjectOutput` using `PutObjectOutput`.
    ///
    /// - Parameters:
    ///   - putObjectOutput: An instance of `PutObjectOutput`.
    init(putObjectOutput out: PutObjectOutput) {
        self.bucketKeyEnabled = out.bucketKeyEnabled
        self.checksumCRC32 = out.checksumCRC32
        self.checksumCRC32C = out.checksumCRC32C
        self.checksumSHA1 = out.checksumSHA1
        self.checksumSHA256 = out.checksumSHA256
        self.checksumType = out.checksumType
        self.eTag = out.eTag
        self.expiration = out.expiration
        self.requestCharged = out.requestCharged
        self.serverSideEncryption = out.serverSideEncryption
        self.ssekmsKeyId = out.ssekmsKeyId
        self.versionId = out.versionId
    }

    /// Creates `UploadObjectOutput` using `CompleteMultipartUploadOutput`.
    ///
    /// - Parameters:
    ///   - completeMultipartUploadOutput: An instance of `CompleteMultipartUploadOutput`.
    init(completeMultipartUploadOutput out: CompleteMultipartUploadOutput) {
        self.bucketKeyEnabled = out.bucketKeyEnabled
        self.checksumCRC32 = out.checksumCRC32
        self.checksumCRC32C = out.checksumCRC32C
        self.checksumSHA1 = out.checksumSHA1
        self.checksumSHA256 = out.checksumSHA256
        self.checksumType = out.checksumType
        self.eTag = out.eTag
        self.expiration = out.expiration
        self.requestCharged = out.requestCharged
        self.serverSideEncryption = out.serverSideEncryption
        self.ssekmsKeyId = out.ssekmsKeyId
        self.versionId = out.versionId
    }
}
