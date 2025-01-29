//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The synthetic output type for the DownloadBucket operation of AWS S3 Transfer Manager.
///
/// It contains self-explanatory `objectsDownloaded` and `objectsFailed` integer counts.
public struct DownloadBucketOutput: TransferOutput {
    public let objectsDownloaded: Int
    public let objectsFailed: Int

    init(objectsDownloaded: Int, objectsFailed: Int) {
        self.objectsDownloaded = objectsDownloaded
        self.objectsFailed = objectsFailed
    }
}
