//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct AWSSDKIdentity.ECSAWSCredentialIdentityResolver
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
}

private class MockURLProtocol: URLProtocol {
    static var expectedURL: URL?
    static var expectedHeaders: [String: String] = [:]
    static var unexpectedHeaders: [String: String] = [:]
    static var responseJSON: [String: Any] = [
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
