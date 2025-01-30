//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import enum Smithy.ByteStream
import struct Foundation.Date

/// The synthetic output type for the DownloadObject operation of S3 Transfer Manager.
///
/// This type contains all output members from GetObjectOutput except `body`.
/// Retrieved object is written to the `OutputStream` provided by the user in the `DownloadObjectInput` used to call the operation.
public struct DownloadObjectOutput: TransferOutput {
    /// Indicates that a range of bytes was specified in the request.
    public let acceptRanges: Swift.String?
    /// Indicates whether the object uses an S3 Bucket Key for server-side encryption with Key Management Service (KMS) keys (SSE-KMS).
    public let bucketKeyEnabled: Swift.Bool?
    /// Specifies caching behavior along the request/reply chain.
    public let cacheControl: Swift.String?
    /// The base64-encoded, 32-bit CRC-32 checksum of the object. This will only be present if it was uploaded with the object. For more information, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let checksumCRC32: Swift.String?
    /// The base64-encoded, 32-bit CRC-32C checksum of the object. This will only be present if it was uploaded with the object. For more information, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let checksumCRC32C: Swift.String?
    /// The base64-encoded, 160-bit SHA-1 digest of the object. This will only be present if it was uploaded with the object. For more information, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let checksumSHA1: Swift.String?
    /// The base64-encoded, 256-bit SHA-256 digest of the object. This will only be present if it was uploaded with the object. For more information, see [ Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let checksumSHA256: Swift.String?
    /// This header specifies the checksum type of the object, which determines how part-level checksums are combined to create an object-level checksum for multipart objects. For PutObject uploads, the checksum type is always FULL_OBJECT. You can use this header as a data integrity check to verify that the checksum type that is received is the same checksum that was specified. For more information, see [Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide.
    public let checksumType: S3ClientTypes.ChecksumType?
    /// Specifies presentational information for the object.
    public let contentDisposition: Swift.String?
    /// Indicates what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
    public let contentEncoding: Swift.String?
    /// The language the content is in.
    public let contentLanguage: Swift.String?
    /// Size of the body in bytes.
    public let contentLength: Swift.Int?
    /// The portion of the object returned in the response.
    public let contentRange: Swift.String?
    /// A standard MIME type describing the format of the object data.
    public let contentType: Swift.String?
    /// Indicates whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.
    ///
    /// * If the current version of the object is a delete marker, Amazon S3 behaves as if the object was deleted and includes x-amz-delete-marker: true in the response.
    ///
    /// * If the specified version in the request is a delete marker, the response returns a 405 Method Not Allowed error and the Last-Modified: timestamp response header.
    public let deleteMarker: Swift.Bool?
    /// An entity tag (ETag) is an opaque identifier assigned by a web server to a specific version of a resource found at a URL.
    public let eTag: Swift.String?
    /// If the object expiration is configured (see [PutBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html)), the response includes this header. It includes the expiry-date and rule-id key-value pairs providing object expiration information. The value of the rule-id is URL-encoded. Object expiration information is not returned in directory buckets and this header returns the value "NotImplemented" in all responses for directory buckets.
    public let expiration: Swift.String?
    /// The date and time at which the object is no longer cacheable.
    public let expires: Swift.String?
    /// Date and time when the object was last modified. General purpose buckets - When you specify a versionId of the object in your request, if the specified version in the request is a delete marker, the response returns a 405 Method Not Allowed error and the Last-Modified: timestamp response header.
    public let lastModified: Foundation.Date?
    /// A map of metadata to store with the object in S3.
    public let metadata: [Swift.String: Swift.String]?
    /// This is set to the number of metadata entries not returned in the headers that are prefixed with x-amz-meta-. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers. This functionality is not supported for directory buckets.
    public let missingMeta: Swift.Int?
    /// Indicates whether this object has an active legal hold. This field is only returned if you have permission to view an object's legal hold status. This functionality is not supported for directory buckets.
    public let objectLockLegalHoldStatus: S3ClientTypes.ObjectLockLegalHoldStatus?
    /// The Object Lock mode that's currently in place for this object. This functionality is not supported for directory buckets.
    public let objectLockMode: S3ClientTypes.ObjectLockMode?
    /// The date and time when this object's Object Lock will expire. This functionality is not supported for directory buckets.
    public let objectLockRetainUntilDate: Foundation.Date?
    /// The count of parts this object has. This value is only returned if you specify partNumber in your request and the object was uploaded as a multipart upload.
    public let partsCount: Swift.Int?
    /// Amazon S3 can return this if your request involves a bucket that is either a source or destination in a replication rule. This functionality is not supported for directory buckets.
    public let replicationStatus: S3ClientTypes.ReplicationStatus?
    /// If present, indicates that the requester was successfully charged for the request. This functionality is not supported for directory buckets.
    public let requestCharged: S3ClientTypes.RequestCharged?
    /// Provides information about object restoration action and expiration time of the restored object copy. This functionality is not supported for directory buckets. Only the S3 Express One Zone storage class is supported by directory buckets to store objects.
    public let restore: Swift.String?
    /// The server-side encryption algorithm used when you store this object in Amazon S3.
    public let serverSideEncryption: S3ClientTypes.ServerSideEncryption?
    /// If server-side encryption with a customer-provided encryption key was requested, the response will include this header to confirm the encryption algorithm that's used. This functionality is not supported for directory buckets.
    public let sseCustomerAlgorithm: Swift.String?
    /// If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide the round-trip message integrity verification of the customer-provided encryption key. This functionality is not supported for directory buckets.
    public let sseCustomerKeyMD5: Swift.String?
    /// If present, indicates the ID of the KMS key that was used for object encryption.
    public let ssekmsKeyId: Swift.String?
    /// Provides storage class information of the object. Amazon S3 returns this header for all objects except for S3 Standard storage class objects. Directory buckets - Only the S3 Express One Zone storage class is supported by directory buckets to store objects.
    public let storageClass: S3ClientTypes.StorageClass?
    /// The number of tags, if any, on the object, when you have the relevant permission to read object tags. You can use [GetObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html) to retrieve the tag set associated with an object. This functionality is not supported for directory buckets.
    public let tagCount: Swift.Int?
    /// Version ID of the object. This functionality is not supported for directory buckets.
    public let versionId: Swift.String?
    /// If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata. This functionality is not supported for directory buckets.
    public let websiteRedirectLocation: Swift.String?

    init(getObjectOutput: GetObjectOutput) {
        // GetObjectOutput members.
        self.acceptRanges = getObjectOutput.acceptRanges
        self.bucketKeyEnabled = getObjectOutput.bucketKeyEnabled
        self.cacheControl = getObjectOutput.cacheControl
        self.checksumCRC32 = getObjectOutput.checksumCRC32
        self.checksumCRC32C = getObjectOutput.checksumCRC32C
        self.checksumSHA1 = getObjectOutput.checksumSHA1
        self.checksumSHA256 = getObjectOutput.checksumSHA256
        self.checksumType = getObjectOutput.checksumType
        self.contentDisposition = getObjectOutput.contentDisposition
        self.contentEncoding = getObjectOutput.contentEncoding
        self.contentLanguage = getObjectOutput.contentLanguage
        self.contentLength = getObjectOutput.contentLength
        self.contentRange = getObjectOutput.contentRange
        self.contentType = getObjectOutput.contentType
        self.deleteMarker = getObjectOutput.deleteMarker
        self.eTag = getObjectOutput.eTag
        self.expiration = getObjectOutput.expiration
        self.expires = getObjectOutput.expires
        self.lastModified = getObjectOutput.lastModified
        self.metadata = getObjectOutput.metadata
        self.missingMeta = getObjectOutput.missingMeta
        self.objectLockLegalHoldStatus = getObjectOutput.objectLockLegalHoldStatus
        self.objectLockMode = getObjectOutput.objectLockMode
        self.objectLockRetainUntilDate = getObjectOutput.objectLockRetainUntilDate
        self.partsCount = getObjectOutput.partsCount
        self.replicationStatus = getObjectOutput.replicationStatus
        self.requestCharged = getObjectOutput.requestCharged
        self.restore = getObjectOutput.restore
        self.serverSideEncryption = getObjectOutput.serverSideEncryption
        self.sseCustomerAlgorithm = getObjectOutput.sseCustomerAlgorithm
        self.sseCustomerKeyMD5 = getObjectOutput.sseCustomerKeyMD5
        self.ssekmsKeyId = getObjectOutput.ssekmsKeyId
        self.storageClass = getObjectOutput.storageClass
        self.tagCount = getObjectOutput.tagCount
        self.versionId = getObjectOutput.versionId
        self.websiteRedirectLocation = getObjectOutput.websiteRedirectLocation
    }
}
