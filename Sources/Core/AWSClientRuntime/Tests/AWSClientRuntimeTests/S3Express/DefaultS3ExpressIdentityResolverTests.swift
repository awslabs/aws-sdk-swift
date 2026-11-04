//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
@_spi(ClientConfigWrapper) import ClientRuntime
import AWSSDKIdentity
import Smithy
import SmithyHTTPAPI
import SmithyHTTPAuthAPI
import SmithyIdentity
import SmithyRetries
import SmithyRetriesAPI

final class DefaultS3ExpressIdentityResolverTests: XCTestCase {
    private let bucket = "mybucket--use1-az4--x-s3"
    private let credsA = AWSCredentialIdentity(accessKey: "AKID_A", secret: "SECRET_A")
    private let credsB = AWSCredentialIdentity(accessKey: "AKID_B", secret: "SECRET_B")

    func test_differentBaseCredentials_sameBucket_getDistinctSessions() async throws {
        let subject = DefaultS3ExpressIdentityResolver()
        let client = MockCreateSessionClient()
        let configA = MockClientConfig(awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(credsA))
        // A copy of config A with B's credentials, sharing the same resolver as a struct copy would.
        var configB = configA
        configB.awsCredentialIdentityResolver = StaticAWSCredentialIdentityResolver(credsB)

        let identityA = try await subject.getIdentity(identityProperties: properties(configA, client))
        let identityB = try await subject.getIdentity(identityProperties: properties(configB, client))

        XCTAssertEqual(identityA.accessKeyID, "SESSION_FOR_AKID_A")
        XCTAssertEqual(identityB.accessKeyID, "SESSION_FOR_AKID_B")
        XCTAssertEqual(client.calls, ["AKID_A", "AKID_B"])
    }

    func test_sameAccessKeyDifferentSecret_doesNotShare() async throws {
        let subject = DefaultS3ExpressIdentityResolver()
        let client = MockCreateSessionClient()
        let wrongSecret = AWSCredentialIdentity(accessKey: "AKID_A", secret: "WRONG_SECRET")
        let configA = MockClientConfig(awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(credsA))
        let configWrong = MockClientConfig(awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(wrongSecret))

        _ = try await subject.getIdentity(identityProperties: properties(configA, client))
        _ = try await subject.getIdentity(identityProperties: properties(configWrong, client))

        XCTAssertEqual(client.calls, ["AKID_A", "AKID_A"])
        XCTAssertEqual(client.secrets, ["SECRET_A", "WRONG_SECRET"])
    }

    func test_sameBaseCredentials_reuseCachedSession() async throws {
        let subject = DefaultS3ExpressIdentityResolver()
        let client = MockCreateSessionClient()
        let config1 = MockClientConfig(awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(credsA))
        let config2 = MockClientConfig(awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(credsA))

        let identity1 = try await subject.getIdentity(identityProperties: properties(config1, client))
        let identity2 = try await subject.getIdentity(identityProperties: properties(config2, client))

        XCTAssertEqual(identity1.accessKeyID, "SESSION_FOR_AKID_A")
        XCTAssertEqual(identity2.accessKeyID, "SESSION_FOR_AKID_A")
        XCTAssertEqual(client.calls, ["AKID_A"])
    }

    func test_createSessionUsesPinnedCredentials() async throws {
        let subject = DefaultS3ExpressIdentityResolver()
        let client = MockCreateSessionClient()
        let switching = SwitchingCredentialResolver(first: credsA, later: credsB)
        let config = MockClientConfig(awsCredentialIdentityResolver: switching)

        let identity = try await subject.getIdentity(identityProperties: properties(config, client))

        // The base resolver has now switched to B, but the config given to CreateSession
        // must still resolve to A, the credentials the cache entry is keyed on.
        XCTAssertEqual(identity.accessKeyID, "SESSION_FOR_AKID_A")
        let received = try XCTUnwrap(client.configs.first)
        let resolved = try await received.awsCredentialIdentityResolver.getIdentity(identityProperties: nil)
        XCTAssertEqual(resolved.accessKey, "AKID_A")
        XCTAssertEqual(switching.callCount, 1)
    }

    func test_missingClientConfig_throws() async throws {
        let subject = DefaultS3ExpressIdentityResolver()
        var props = Attributes()
        props.set(key: AWSIdentityPropertyKeys.bucket, value: bucket)
        props.set(key: AWSIdentityPropertyKeys.s3ExpressClient, value: MockCreateSessionClient())

        do {
            _ = try await subject.getIdentity(identityProperties: props)
            XCTFail("Expected clientConfigNotProvided error")
        } catch S3ExpressClientError.clientConfigNotProvided {
            // expected
        }
    }

    // MARK: - Helpers

    private func properties(_ config: MockClientConfig, _ client: MockCreateSessionClient) -> Attributes {
        // ClientConfigurationWrapper.init is internal to ClientRuntime, so obtain a wrapper through a Context.
        // The key name matches the one in smithy-swift's Context+Config.swift.
        let context = ContextBuilder().withClientConfig(value: config).build()
        let wrapperKey = AttributeKey<ClientConfigurationWrapper>(name: "SmithySwiftClientConfigWrapper")
        var props = Attributes()
        props.set(key: AWSIdentityPropertyKeys.bucket, value: bucket)
        props.set(key: AWSIdentityPropertyKeys.s3ExpressClient, value: client)
        if let wrapper = context.get(key: wrapperKey) {
            props.set(key: IdentityPropertyKeys.clientConfigWrapper, value: wrapper)
        }
        return props
    }
}

private final class MockCreateSessionClient: S3ExpressCreateSessionClient, @unchecked Sendable {
    private let lock = NSLock()
    private var _calls: [String] = []
    private var _secrets: [String] = []
    private var _configs: [any DefaultHttpClientConfiguration] = []

    var calls: [String] { lock.withLock { _calls } }
    var secrets: [String] { lock.withLock { _secrets } }
    var configs: [any DefaultHttpClientConfiguration] { lock.withLock { _configs } }

    func createSession(clientConfig: DefaultClientConfiguration, bucket: String) async throws -> S3ExpressIdentity {
        guard let httpConfig = clientConfig as? any DefaultHttpClientConfiguration else {
            throw S3ExpressClientError.clientConfigNotProvided
        }
        let creds = try await httpConfig.awsCredentialIdentityResolver.getIdentity(identityProperties: nil)
        lock.withLock {
            _calls.append(creds.accessKey)
            _secrets.append(creds.secret)
            _configs.append(httpConfig)
        }
        return S3ExpressIdentity(
            accessKeyID: "SESSION_FOR_\(creds.accessKey)",
            secretAccessKey: "SESSION_SECRET",
            sessionToken: "SESSION_TOKEN",
            expiration: Date().addingTimeInterval(3600)
        )
    }
}

private final class SwitchingCredentialResolver: AWSCredentialIdentityResolver, @unchecked Sendable {
    private let lock = NSLock()
    private let first: AWSCredentialIdentity
    private let later: AWSCredentialIdentity
    private var _callCount = 0

    init(first: AWSCredentialIdentity, later: AWSCredentialIdentity) {
        self.first = first
        self.later = later
    }

    var callCount: Int { lock.withLock { _callCount } }

    func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        lock.withLock {
            _callCount += 1
            return _callCount == 1 ? first : later
        }
    }
}

private struct UnusedHTTPClient: HTTPClient {
    func send(request: HTTPRequest) async throws -> HTTPResponse {
        throw ClientError.unknownError("not used")
    }
}

private struct UnusedAuthSchemeResolver: AuthSchemeResolver {
    func resolveAuthScheme(params: AuthSchemeResolverParameters) throws -> [AuthOption] { [] }

    func constructParameters(context: Context) throws -> AuthSchemeResolverParameters {
        throw ClientError.unknownError("not used")
    }
}

private struct MockClientConfig: DefaultClientConfiguration, DefaultHttpClientConfiguration {
    var retryStrategyOptions = RetryStrategyOptions(backoffStrategy: ExponentialBackoffStrategy())
    var logger: LogAgent = SwiftLogger(label: "MockClientConfig")
    var clientLogMode: ClientLogMode = .none
    var endpoint: String?
    var idempotencyTokenGenerator: IdempotencyTokenGenerator = DefaultIdempotencyTokenGenerator()
    var telemetryProvider: TelemetryProvider = DefaultTelemetry.provider
    var httpClientEngine: HTTPClient = UnusedHTTPClient()
    var httpClientConfiguration = HttpClientConfiguration()
    var partitionID: String?
    var authSchemes: [AuthScheme]?
    var authSchemePreference: [String]?
    var authSchemeResolver: AuthSchemeResolver = UnusedAuthSchemeResolver()
    var bearerTokenIdentityResolver: any BearerTokenIdentityResolver = StaticBearerTokenIdentityResolver(
        token: BearerTokenIdentity(token: "")
    )
    var awsCredentialIdentityResolver: any AWSCredentialIdentityResolver
    var region: String? = "us-east-1"
    var signingRegion: String? = "us-east-1"

    init(awsCredentialIdentityResolver: any AWSCredentialIdentityResolver) {
        self.awsCredentialIdentityResolver = awsCredentialIdentityResolver
    }

    init() async throws {
        self.init(
            awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(
                AWSCredentialIdentity(accessKey: "", secret: "")
            )
        )
    }

    mutating func addInterceptorProvider(_ provider: InterceptorProvider) {}

    mutating func addInterceptorProvider(_ provider: HttpInterceptorProvider) {}
}
