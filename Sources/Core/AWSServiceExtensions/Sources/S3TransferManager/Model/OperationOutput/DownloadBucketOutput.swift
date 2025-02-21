//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The synthetic output type for the `downloadBucket` operation of `S3TransferManager`.
public struct DownloadBucketOutput: TransferOutput {
    /// The number of successfully downloaded S3 objects.
    public let objectsDownloaded: Int
    /// The number of failed S3 object downloads.
    public let objectsFailed: Int

    init(objectsDownloaded: Int, objectsFailed: Int) {
        self.objectsDownloaded = objectsDownloaded
        self.objectsFailed = objectsFailed
    }
}
