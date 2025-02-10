//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

/// The config object for the S3 Transfer Manager.
public class S3TransferManagerConfig {
    let s3Client: S3Client
    let targetPartSizeBytes: Int
    let multipartUploadThresholdBytes: Int
    let checksumValidationEnabled: Bool
    let checksumAlgorithm: S3ClientTypes.ChecksumAlgorithm
    let multipartDownloadType: MultipartDownloadType

    /// Creates the config object for the S3 Transfer Manager.
    ///
    /// - Parameters:
    ///    - s3Client: The S3 client instance to use for the transfer manager. If not provided, a default client is created for use.
    ///    - targetPartSizeBytes: The part size used by multipart operations. The last part can be shorter. Default value is 8MB.
    ///    - multipartUploadThresholdBytes:The threshold at which multipart operations get used instead of single putObject for uploadObject operation. Default value is 16MB.
    ///    - checksumValidationEnabled: Specifies whether checksum should be validated for the DownloadBucket operation. Checksum of each downloaded object is validated only if part GET was used for downloads. Your checksum behavior configuration on the S3 client influences this behavior as well. To turn off response checksum validation, you must set both `checksumValidationEnabled`(this config)  and `responseChecksumValidation` (config on S3 client) to `false`. Default value is `true`.
    ///    - checksumAlgorithm: Specifies the checksum algorithm to use for the UploadDirectory operation. Default algorithm is CRC32.
    ///    - multipartDownloadType: Specifies the behavior of multipart download operations. Default value is `.part`, which configures individual getObject calls to use part numbers for multipart download. The other option is `.range`, which uses the byte range of the S3 object for multipart download. If what you want to download was uploaded without using multipart upload (therefore there's no part number available), then you must use `.range`.
    public init(
        s3Client: S3Client? = nil,
        targetPartSizeBytes: Int = 8_000_000,
        multipartUploadThresholdBytes: Int = 16_000_000,
        checksumValidationEnabled: Bool = true,
        checksumAlgorithm: S3ClientTypes.ChecksumAlgorithm = .crc32,
        multipartDownloadType: MultipartDownloadType = .part
    ) async throws {
        // If no client was provided, initialize a default client.
        if let s3Client {
            self.s3Client = s3Client
        } else {
            self.s3Client = try await S3Client()
        }
        self.targetPartSizeBytes = targetPartSizeBytes
        self.multipartUploadThresholdBytes = multipartUploadThresholdBytes
        self.checksumValidationEnabled = checksumValidationEnabled
        self.checksumAlgorithm = checksumAlgorithm
        self.multipartDownloadType = multipartDownloadType
    }
}

/// The multipart download type enum. This is a config option in `S3TransferManagerConfig`.
public enum MultipartDownloadType {
    case range // Range HTTP header w/ getObject
    case part // partNumber HTTP query parameter w/ getObject
}
