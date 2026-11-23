//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import struct AWSSDKIdentity.ECSAWSCredentialIdentityResolver
import Foundation
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

class ECSAWSCredentialIdentityResolverTests: XCTestCase {
    private var session: URLSession!

    override func setUp() {
        super.setUp()

        // Unset the environment variables before each test
        unsetenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        unsetenv("AWS_CONTAINER_CREDENTIALS_FULL_URI")
        unsetenv("AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE")
        unsetenv("AWS_CONTAINER_AUTHORIZATION_TOKEN")

        // Clear out mocked URL protocol's values before each test.
        MockURLProtocol.expectedURL = nil
        MockURLProtocol.expectedHeaders = [:]
        MockURLProtocol.unexpectedHeaders = [:]

        // Instantiate URLSession to use.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
    }

    override func tearDown() {
        // Unset the environment variables after each test
        unsetenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        unsetenv("AWS_CONTAINER_CREDENTIALS_FULL_URI")
        unsetenv("AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE")
        unsetenv("AWS_CONTAINER_AUTHORIZATION_TOKEN")

        // Clear out mocked URL protocol's values after each test.
        MockURLProtocol.expectedURL = nil
        MockURLProtocol.expectedHeaders = [:]
        MockURLProtocol.unexpectedHeaders = [:]
        super.tearDown()
    }

    func testGetCredentialsWithRelativeURIEnv() async throws {
        MockURLProtocol.expectedURL = URL(string: "http://169.254.170.2/subfolder/test.txt")!
        setenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI", "/subfolder/test.txt", 1)
        let creds = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
        XCTAssertEqual(creds.accessKey, "access-123")
    }

    func testGetCredentialsWithAbsoluteURIEnv() async throws {
        MockURLProtocol.expectedURL = URL(string: "http://127.0.0.1/subfolder/test.txt")!
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", "http://127.0.0.1/subfolder/test.txt", 1)
        let creds = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
        XCTAssertEqual(creds.accessKey, "access-123")
    }

    func testGetCredentialsWithInvalidAbsoluteURIEnv() async throws {
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", "test", 1)
        do {
            _ = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
            XCTFail()
        } catch {
            // no-op.
        }
    }

    func testGetCredentialsWithMissingURIEnv() async throws {
        do {
            _ = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
            XCTFail()
        } catch {
            // no-op.
        }
    }

    func testGetCredentialsWithTokenFile() async throws {
        MockURLProtocol.expectedURL = URL(string: "http://127.0.0.1/subfolder/test.txt")!
        MockURLProtocol.expectedHeaders.updateValue("sample-token", forKey: "Authorization")

        // Simulating a token file
        let tokenFilePath = Bundle.module.url(forResource: "test_token", withExtension: "txt")!.path

        // Set the environment variable to point to the token file
        setenv("AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE", tokenFilePath, 1)
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", "http://127.0.0.1/subfolder/test.txt", 1)

        // Ensure the resolver correctly loads the token from the file
        let creds = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
        XCTAssertEqual(creds.accessKey, "access-123")
    }

    func testGetCredentialsWithTokenEnv() async throws {
        MockURLProtocol.expectedURL = URL(string: "http://127.0.0.1/subfolder/test.txt")!
        MockURLProtocol.expectedHeaders.updateValue("env-token", forKey: "Authorization")

        // Set the environment variable directly for the token
        setenv("AWS_CONTAINER_AUTHORIZATION_TOKEN", "env-token", 1)
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", "http://127.0.0.1/subfolder/test.txt", 1)

        // Ensure the resolver correctly loads the token from the environment
        let creds = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
        XCTAssertEqual(creds.accessKey, "access-123")
    }

    func testTokenNotResolvedWithRelativeURI() async throws {
        // Checks Authorization token is not used with relative URI
        MockURLProtocol.expectedURL = URL(string: "http://169.254.170.2/subfolder/test.txt")!
        MockURLProtocol.unexpectedHeaders.updateValue("dummy", forKey: "Authorization")
        // Set the environment variable directly for the token
        setenv("AWS_CONTAINER_AUTHORIZATION_TOKEN", "env-token", 1)
        setenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI", "/subfolder/test.txt", 1)
        // Pass the token directly to the resolver
        let creds = try await ECSAWSCredentialIdentityResolver(urlSession: session).getIdentity()
        XCTAssertEqual(creds.accessKey, "access-123")
    }

    // MARK: - Full URI host validation

    func testFullURIAllowsEKSContainerHostIPv6() async throws {
        try await assertFullURIAllowed("http://[fd00:ec2::23]/v1/credentials")
        try await assertFullURIAllowed("http://[fd00:ec2::23]:80/v1/credentials")
        try await assertFullURIAllowed("http://[FD00:EC2:0:0:0:0:0:23]/v1/credentials")
    }

    func testFullURIAllowsEKSContainerHostIPv4() async throws {
        try await assertFullURIAllowed("http://169.254.170.23/v1/credentials")
    }

    func testFullURIAllowsECSContainerHost() async throws {
        try await assertFullURIAllowed("http://169.254.170.2/credentials")
    }

    func testFullURIAllowsIPv6Loopback() async throws {
        try await assertFullURIAllowed("http://[::1]/credentials")
        try await assertFullURIAllowed("http://[0:0:0:0:0:0:0:1]:8080/credentials")
    }

    func testFullURIAllowsIPv4LoopbackCIDR() async throws {
        try await assertFullURIAllowed("http://127.0.0.2/credentials")
        try await assertFullURIAllowed("http://127.255.255.254/credentials")
        try await assertFullURIAllowed("http://127.0.0.1:8080/credentials?foo=bar%20baz")
    }

    func testFullURIAllowsAnyHostOverHTTPS() async throws {
        try await assertFullURIAllowed("https://awscredentials.amazonaws.com/credentials")
        try await assertFullURIAllowed("https://192.168.1.1/credentials")
        try await assertFullURIAllowed("HTTPS://192.168.1.1/credentials")
    }

    func testFullURIAllowsHostNameResolvingToAllowedAddresses() async throws {
        let dns = [
            "localhost": ["127.0.0.1", "::1"],
            "creds.internal": ["169.254.170.23", "fd00:ec2::23"],
            "ecs.internal": ["169.254.170.2"],
        ]
        try await assertFullURIAllowed("http://localhost/credentials", dns: dns)
        try await assertFullURIAllowed("http://localhost:8080/credentials", dns: dns)
        try await assertFullURIAllowed("http://creds.internal/credentials", dns: dns)
        try await assertFullURIAllowed("http://ecs.internal/credentials", dns: dns)
    }

    func testFullURIAllowsLocalhostWithDefaultHostResolver() async throws {
        let fullURI = "http://localhost/credentials"
        MockURLProtocol.expectedURL = URL(string: fullURI)!
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", fullURI, 1)
        let creds = try await ECSAWSCredentialIdentityResolver(urlSession: session, maxRetries: 0)
            .getIdentity(identityProperties: nil)
        XCTAssertEqual(creds.accessKey, "access-123")
    }

    func testFullURIRejectsDisallowedIPv4Hosts() async throws {
        try await assertFullURIRejected("http://192.168.1.1/endpoint")
        try await assertFullURIRejected("http://169.254.170.3/endpoint")
        try await assertFullURIRejected("http://169.254.171.23/creds")
        try await assertFullURIRejected("http://128.0.0.1/creds")
    }

    func testFullURIRejectsDisallowedIPv6Hosts() async throws {
        try await assertFullURIRejected("http://[fd00:ec2::2]/creds")
        try await assertFullURIRejected("http://[fd00:ec2::254]/creds")
        try await assertFullURIRejected("http://[::2]/creds")
        try await assertFullURIRejected("http://[::]/creds")
    }

    func testFullURIValidatesNonHTTPSSchemes() async throws {
        try await assertFullURIRejected("HTTP://169.254.170.3/creds")
        try await assertFullURIRejected("ftp://192.168.1.1/creds")
    }

    func testFullURIRejectsHostNameResolvingToDisallowedAddresses() async throws {
        let dns = [
            "awscredentials.amazonaws.com": ["52.94.0.1"],
            "localhost.example.com": ["93.184.215.14"],
            "mixed.example.com": ["127.0.0.1", "10.0.0.1"],
            "mixed6.example.com": ["::1", "fd00:ec2::2"],
            "empty.example.com": [],
        ]
        try await assertFullURIRejected("http://awscredentials.amazonaws.com/credentials", dns: dns)
        try await assertFullURIRejected("http://localhost.example.com/credentials", dns: dns)
        try await assertFullURIRejected("http://mixed.example.com/credentials", dns: dns)
        try await assertFullURIRejected("http://mixed6.example.com/credentials", dns: dns)
        try await assertFullURIRejected("http://empty.example.com/credentials", dns: dns)
    }

    func testFullURIRejectsHostNameThatFailsToResolve() async throws {
        try await assertFullURIRejected("http://localhostx/credentials")
        try await assertFullURIRejected("http://127.0.0.1.example.com/credentials")
    }

    /// Asserts the full URI is accepted. Hosts are resolved with `dns`, a fake that fails for unlisted hosts,
    /// so with the default empty `dns` this also asserts that no host name resolution is needed.
    private func assertFullURIAllowed(
        _ fullURI: String,
        dns: [String: [String]] = [:],
        file: StaticString = #filePath,
        line: UInt = #line
    ) async throws {
        MockURLProtocol.expectedURL = URL(string: fullURI)!
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", fullURI, 1)
        do {
            let creds = try await makeResolver(dns: dns).getIdentity(identityProperties: nil)
            XCTAssertEqual(creds.accessKey, "access-123", file: file, line: line)
        } catch {
            XCTFail("Expected \(fullURI) to be allowed, but got error: \(error)", file: file, line: line)
        }
    }

    private func assertFullURIRejected(
        _ fullURI: String,
        dns: [String: [String]] = [:],
        file: StaticString = #filePath,
        line: UInt = #line
    ) async throws {
        // The mock would serve credentials for this URL, so the request is only rejected by URL validation.
        MockURLProtocol.expectedURL = URL(string: fullURI)!
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", fullURI, 1)
        do {
            _ = try await makeResolver(dns: dns).getIdentity(identityProperties: nil)
            XCTFail("Expected \(fullURI) to be rejected", file: file, line: line)
        } catch {
            let message = "\(error)"
            XCTAssertTrue(
                message.contains("The IP address in resolved URL is invalid")
                    || message.contains("does not resolve exclusively to allowed IP addresses")
                    || message.contains("Failed to resolve the host in resolved URL"),
                "Expected \(fullURI) to be rejected by URL validation, but got: \(error)",
                file: file,
                line: line
            )
        }
    }

    private func makeResolver(dns: [String: [String]]) -> ECSAWSCredentialIdentityResolver {
        ECSAWSCredentialIdentityResolver(urlSession: session, maxRetries: 0) { host in
            guard let addresses = dns[host] else { throw URLError(.cannotFindHost) }
            return addresses
        }
    }
}

private class MockURLProtocol: URLProtocol {
    nonisolated(unsafe) static var expectedURL: URL?
    nonisolated(unsafe) static var expectedHeaders: [String: String] = [:]
    nonisolated(unsafe) static var unexpectedHeaders: [String: String] = [:]
    nonisolated(unsafe) static let responseJSON: [String: Any] = [
        "AccessKeyId": "access-123",
        "SecretAccessKey": "secret-123",
        "Token": "token-123",
        "Expiration": "2025-05-28T15:30:00Z",
        "AccountId": "123456789"
    ]

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let expectedURL = Self.expectedURL else {
            client?.urlProtocol(self, didFailWithError: NSError(domain: "MockError", code: 1))
            return
        }

        // Validate URL.
        guard request.url == expectedURL else {
            client?.urlProtocol(self, didFailWithError: NSError(domain: "InvalidURL", code: 404))
            return
        }

        // Validate headers.
        for (expectedHeaderField, expectedHeaderValue) in Self.expectedHeaders {
            guard request.value(forHTTPHeaderField: expectedHeaderField) == expectedHeaderValue else {
                client?.urlProtocol(self, didFailWithError: NSError(domain: "InvalidHeader", code: 403))
                return
            }
        }
        for (unexpectedHeaderField, _) in Self.unexpectedHeaders {
            guard request.value(forHTTPHeaderField: unexpectedHeaderField) == nil else {
                client?.urlProtocol(self, didFailWithError: NSError(domain: "UnexpectedHeader", code: 403))
                return
            }
        }

        // Return dummy JSON response.
        let data = try! JSONSerialization.data(withJSONObject: Self.responseJSON, options: [])
        let response = HTTPURLResponse(
            url: expectedURL,
            statusCode: 200,
            httpVersion: nil,
            headerFields: ["Content-Type": "application/json"]
        )!

        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
