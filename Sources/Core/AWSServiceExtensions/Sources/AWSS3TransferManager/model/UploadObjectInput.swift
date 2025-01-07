//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3

public struct UploadObjectInput {
    let putObjectInput: PutObjectInput
    let createMultipartUploadInput: CreateMultipartUploadInput

    let transferListener: TransferListener?

    // Initialiazer takes in PutObjectInput and constructs CreateMultipartUploadInput.
    // Which input type is actually used is determined at runtime
    public init(
        putObjectInput: PutObjectInput,
        transferListener: TransferListener? = nil
    ) {
        self.putObjectInput = putObjectInput
        self.createMultipartUploadInput = CreateMultipartUploadInput(
            // Copy over relevant values from putObjectInput to
            // createMultipartUploadInput
        )
    }
}
