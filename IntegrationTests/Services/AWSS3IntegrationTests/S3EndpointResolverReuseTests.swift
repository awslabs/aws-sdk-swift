//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import Foundation
import SmithyHTTPAPI
import XCTest

/// Confirms that S3 calls resolve every endpoint through the client's configured endpoint resolver,
/// including the resolution used to select the auth scheme.
final class S3EndpointResolverReuseTests: S3XCTestCase {

    func test_listObjectsV2_resolvesEndpointWithClientResolverForAuthAndEndpoint() async throws {
        var config = client.config
        let countingResolver = CountingEndpointResolver(wrapping: config.endpointResolver)
        config.endpointResolver = countingResolver
        let countingClient = S3Client(config: config)

        _ = try await countingClient.listObjectsV2(input: ListObjectsV2Input(bucket: bucketName))

        // Once to select the auth scheme, once to set the request's endpoint
        XCTAssertEqual(countingResolver.resolveCount, 2)
    }
}

private final class CountingEndpointResolver: AWSS3.EndpointResolver, @unchecked Sendable {
    private let wrapped: any AWSS3.EndpointResolver
    private let lock = NSLock()
    private var count = 0

    init(wrapping wrapped: any AWSS3.EndpointResolver) {
        self.wrapped = wrapped
    }

    var resolveCount: Int {
        lock.lock()
        defer { lock.unlock() }
        return count
    }

    func resolve(params: AWSS3.EndpointParams) throws -> SmithyHTTPAPI.Endpoint {
        lock.lock()
        count += 1
        lock.unlock()
        return try wrapped.resolve(params: params)
    }
}
