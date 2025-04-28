//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSClientRuntime
import AWSS3
import ClientRuntime

struct Swift6CompatibilityValidator {
    private let s3Client: S3Client

    init(region: String = "us-west-2") throws {
        self.s3Client = try S3Client(region: region)
    }
}
