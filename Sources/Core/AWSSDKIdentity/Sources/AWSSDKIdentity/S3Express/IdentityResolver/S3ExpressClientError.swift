//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum S3ExpressClientError: Error {
    case missingIdentityProperties
    case clientConfigNotProvided
    case clientNotProvided
    case bucketNotProvided
}
