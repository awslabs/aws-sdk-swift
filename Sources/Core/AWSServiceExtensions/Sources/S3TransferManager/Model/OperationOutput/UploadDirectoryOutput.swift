//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The synthetic output type for the `uploadDirectory` operation of `S3TransferManager`.
public struct UploadDirectoryOutput: TransferOutput {
    /// The number of successfully uploaded files.
    public let objectsUploaded: Int
    /// The number of failed file uploads.
    public let objectsFailed: Int

    init(objectsUploaded: Int, objectsFailed: Int) {
        self.objectsUploaded = objectsUploaded
        self.objectsFailed = objectsFailed
    }
}
