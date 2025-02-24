//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The parent protocol of all synthetic input types used with `S3TransferManager`.
public protocol TransferInput {
    /// The UUID for the operation; used by `TransferListener` to disambiguate operation calls.
    var operationID: String { get }
}
