//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

public struct UploadObjectOutput {
    public let putObjectOutput: PutObjectOutput?

    /// Creates the output type for snigle file upload using PutObjectInput, used by AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///   - putObjectOutput: An instance of AWSS3.PutObjectOutput struct.
    public init(putObjectOutput: PutObjectOutput) {
        self.putObjectOutput = putObjectOutput
    }

    /// Creates the output type for single file upload using CreateMultipartUploadOutput, used by AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///   - completeMultipartUploadOutput: An instance of AWSS3.CompleteMultipartUploadOutput struct.
    public init(completeMultipartUploadOutput: CompleteMultipartUploadOutput) {
        self.putObjectOutput = PutObjectOutput(
            bucketKeyEnabled: completeMultipartUploadOutput.bucketKeyEnabled,
            checksumCRC32: completeMultipartUploadOutput.checksumCRC32,
            checksumCRC32C: completeMultipartUploadOutput.checksumCRC32C,
            checksumSHA1: completeMultipartUploadOutput.checksumSHA1,
            checksumSHA256: completeMultipartUploadOutput.checksumSHA256,
            eTag: completeMultipartUploadOutput.eTag,
            expiration: completeMultipartUploadOutput.expiration,
            requestCharged: completeMultipartUploadOutput.requestCharged,
            serverSideEncryption: completeMultipartUploadOutput.serverSideEncryption,
            ssekmsKeyId: completeMultipartUploadOutput.ssekmsKeyId,
            versionId: completeMultipartUploadOutput.versionId
        )
    }
}
