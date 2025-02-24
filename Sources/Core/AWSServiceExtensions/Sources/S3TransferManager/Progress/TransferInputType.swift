//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// An enum that provides type-safe access to specific transfer operation inputs.
///
/// Instead of using explicit type casting with `as?`, this enum allows pattern matching
/// to safely access concrete input types (like `UploadObjectInput` or `DownloadObjectInput`)
/// through its associated values:
///
/// ```swift
/// switch TransferInputType(from: input) {
/// case .uploadObject(let uploadInput):
///     // uploadInput is typed as UploadObjectInput
/// case .downloadObject(let downloadInput):
///     // downloadInput is typed as DownloadObjectInput
/// }
/// ```
public enum TransferInputType {
    case uploadObject(UploadObjectInput)
    case downloadObject(DownloadObjectInput)
    case uploadDirectory(UploadDirectoryInput)
    case downloadBucket(DownloadBucketInput)

    public init(from input: any TransferInput) {
        if let uploadInput = input as? UploadObjectInput {
            self = .uploadObject(uploadInput)
        } else if let downloadInput = input as? DownloadObjectInput {
            self = .downloadObject(downloadInput)
        } else if let uploadDirInput = input as? UploadDirectoryInput {
            self = .uploadDirectory(uploadDirInput)
        } else if let downloadBucketInput = input as? DownloadBucketInput {
            self = .downloadBucket(downloadBucketInput)
        } else {
            fatalError("Unexpected TransferInput type: \(type(of: input))")
        }
    }
}
