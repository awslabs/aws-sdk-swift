//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Parent protocol of all synthetic input types for S3 Transfer Manager.
public protocol TransferInput {
    var operationType: OperationType { get }
}
