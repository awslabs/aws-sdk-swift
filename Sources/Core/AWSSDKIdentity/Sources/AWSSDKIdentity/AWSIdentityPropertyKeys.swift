//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey

public enum AWSIdentityPropertyKeys {

    /// The S3 bucket associated with the credentials to be resolved.
    ///
    /// Used only in conjunction with the `awsv4-s3express` auth scheme, which generates bucket-specific credentials
    /// for use with the S3 Express service.
    public static let bucket = AttributeKey<String>(name: "AWSIdentityBucket")

    /// The region to be used for client creation.
    ///
    /// Used only in conjunction with the `awsv4-s3express` auth scheme, which generates bucket-specific credentials
    /// for use with the S3 Express service.
    public static let region = AttributeKey<String>(name: "AWSIdentityRegion")

    /// The S3 service client to be used in credential resolution.
    ///
    /// Used only in conjunction with the `awsv4-s3express` auth scheme, which generates bucket-specific credentials
    /// for use with the S3 Express service.
    public static let s3ExpressClient = AttributeKey<any S3ExpressCreateSessionClient>(name: "AWSIdentityS3Client")

    /// The list of credential feature IDs saved to a credentials object's properties.
    /// Used internally by credential resolvers to store credential feature IDs during credential resolution.
    public static let credentialFeatureIDs = AttributeKey<[String]>(name: "CredentialFeatureIDs")

    /// The list of credential feature IDs saved to operation context of internal service clients by `CredentialFeatureIDInterceptor`.
    /// Used to include feature IDs resolved so far in profile chain in service calls made by relevant credential resolvers.
    public static let manuallyConfiguredCredentialFeatureIDs = AttributeKey<[String]>(
        name: "ManuallyConfiguredCredentialFeatureIDs"
    )
}
