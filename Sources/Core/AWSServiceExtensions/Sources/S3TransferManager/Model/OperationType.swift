//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The operation type value, used to easily identify which operation a type-erased `TransferInput` or `TransferOutput` instance belong to.
/// Used by `TransferListener`.
public enum OperationType {
    case uploadObject
    case downloadObject
    case uploadDirectory
    case downloadBucket

    public var rawValue: String {
        switch self {
        case .uploadObject: return "UploadObject"
        case .downloadObject: return "DownloadObject"
        case .uploadDirectory: return "UploadDirectory"
        case .downloadBucket: return "DownloadBucket"
        }
    }
}
