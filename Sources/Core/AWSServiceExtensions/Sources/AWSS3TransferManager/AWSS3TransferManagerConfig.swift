//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import SmithyChecksumsAPI

public class AWSS3TransferManagerConfig {
    var s3ClientInstance: S3Client
    var targetPartSizeBytes: UInt64
    var multipartUploadThresholdBytes: UInt64
    var checksumValidationEnabled: Bool
    var checksumAlgorithm: SmithyChecksumsAPI.ChecksumAlgorithm
    var multipartDownloadType: MultipartyDownloadType
    
    /// Creates the config object for the AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///    - s3ClientInstance: The S3 client instance to use. If not provided, a default client is created for use.
    ///    - targetPartSizeBytes: The part size used by multipart operations. The last part can be shorter. Default value is 8MB.
    ///    - multipartUploadThresholdBytes:The threshold at which multipart operations get used instead of single put/get object operations. Default value is 16MB.
    ///    - checksumValidationEnabled: Specifies whether checksum should be validated in download operations. Default value is true.
    ///    - checksumAlgorithm: Specifies the checksum algorithm to use for upload operations. Default algorithm is CRC32.
    ///    - multipartDownloadTypes: Specifies the behavior of getObject for multipart download operations. Default value is `.part`, which configures getObject to use part numbers for multipart download. The other option is `.range`, which uses the actual byte range of the S3 object to download. If what you want to download was uploaded without using MPU (therefore there's no part number available), then you must use `.range`.
    public init(
        s3ClientInstance: S3Client?,
        targetPartSizeBytes: UInt64 = 8_000_000,
        multipartUploadThresholdBytes: UInt64 = 16_000_000,
        checksumValidationEnabled: Bool = true,
        checksumAlgorithm: SmithyChecksumsAPI.ChecksumAlgorithm = .crc32,
        multipartDownloadType: MultipartyDownloadType = .part
    ) async throws {
        if let s3ClientInstance {
            self.s3ClientInstance = s3ClientInstance
        } else {
            self.s3ClientInstance = try await S3Client()
        }
        self.targetPartSizeBytes = targetPartSizeBytes
        self.multipartUploadThresholdBytes = multipartUploadThresholdBytes
        self.checksumValidationEnabled = checksumValidationEnabled
        self.checksumAlgorithm = checksumAlgorithm
        self.multipartDownloadType = multipartDownloadType
    }
}

public enum MultipartyDownloadType {
    case range // Range HTTP header w/ getObject
    case part // partNumber HTTP query parameter w/ getObject
}
