//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The synthetic output type for the UploadDirectory operation of AWS S3 Transfer Manager.
///
/// It contains self-explanatory `objectsUploaded` and `objectsFailed` integer counts.
public struct UploadDirectoryOutput: TransferOutput {
    public let objectsUploaded: Int
    public let objectsFailed: Int

    init(objectsUploaded: Int, objectsFailed: Int) {
        self.objectsUploaded = objectsUploaded
        self.objectsFailed = objectsFailed
    }
}
