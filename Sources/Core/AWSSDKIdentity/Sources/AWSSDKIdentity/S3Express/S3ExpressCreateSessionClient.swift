//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.DefaultClientConfiguration

public protocol S3ExpressCreateSessionClient {
    func createSession(
        clientConfig: DefaultClientConfiguration,
        bucket: String
    ) async throws -> S3ExpressIdentity
}
