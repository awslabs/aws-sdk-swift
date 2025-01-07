//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

/// The Transfer Manager for AWS S3. S3TM for short.
/// The S3TM is an out-of-the-box solution for performant uploads & downloads for both single and multiple files (directory / bucket).
///
/// The AWS S3 Transfer Manager (S3TM) supports the following features:
///  - Upload a single object to S3
///  - Download a single object from S3
///  - Upload a local directory to S3
///  - Download everything in a S3 bucket into a local directory
///  - Track transfer progress for all the operations above
///
/// For uploads, S3TM uses S3's multipart upload & Swift concurrency if object is above the threshold specified in config.
/// For downloads, S3TM uses range GET or part GET as specified in config & uses Swift concurrency for fast downloads.
/// For directory uploads, whether to upload everything in the directory recursively or not is configurable.
public class S3TransferManager {
    let config: AWSS3TransferManagerConfig

    public init(
        config: AWSS3TransferManagerConfig?
    ) async throws {
        if let config {
            self.config = config
        } else {
            self.config = try await AWSS3TransferManagerConfig()
        }
    }

    /* The operations below return immediately after task creation. */
    /* The returned task can be optionally waited on or cancelled using built-in Task API. */

    // Supports a local file or a stream with a known content length
    public func uploadObject(input: UploadObjectInput) throws -> Task<UploadObjectOutput, Error> {
        // WIP
    }

//    public func downloadObject(input: DownloadObjectInput) throws -> Task<DownloadObjectOutput, Error> {}
//
//    public func uploadDirectory(input: UploadDirectoryInput) throws -> Task<UploadDirectoryOutput, Error> {}
//
//    public func downloadBucket(input: DownloadBucketInput) throws -> Task<DownloadBucketOutput, Error> {}
}
