//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Foundation
import XCTest

@_spi(FileBasedConfig) @testable import AWSClientRuntime

class ECSCredentialsProviderTests: XCTestCase {
    func testGetCredentialsWithRelativeURI() async throws {
        // relative uri is preferred over absolute uri so we shouldn't get thrown an error
        let mockEnvironment = MockEnvironment(relativeURI: "subfolder/test.txt", absoluteURI: "invalid absolute uri")
        let ecsCredentialsProvider = try ECSCredentialsProvider(environment: mockEnvironment)
        print(ecsCredentialsProvider)
        print(try await ecsCredentialsProvider.getCredentials())
    }

    func testGetCredentialsWithAbsoluteURI() async throws {
        let mockEnvironment = MockEnvironment(relativeURI: nil, absoluteURI: "http://www.example.com/subfolder/test.txt")
        let ecsCredentialsProvider = try ECSCredentialsProvider(environment: mockEnvironment)
    }

    func testGetCredentialsWithInvalidAbsoluteURI() async throws {
        let mockEnvironment = MockEnvironment(relativeURI: nil, absoluteURI: "test")
        XCTAssertThrowsError(try ECSCredentialsProvider(environment: mockEnvironment))
    }

    func testGetCredentialsWithMissingURI() async throws {
        let mockEnvironment = MockEnvironment(relativeURI: nil, absoluteURI: nil)
        XCTAssertThrowsError(try ECSCredentialsProvider(environment: mockEnvironment))
    }
}

protocol EnvironmentProvider {
    func environmentVariable(key: String) -> String?
}

class MockEnvironment: Environment, EnvironmentProvider {
    let relativeURI: String?
    let absoluteURI: String?

    init(
        relativeURI: String? = nil,
        absoluteURI: String? = nil
    ) {
        self.relativeURI = relativeURI
        self.absoluteURI = absoluteURI
    }

    func environmentVariable(key: String) -> String? {
        switch key {
        case "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI":
            return self.relativeURI
        case "AWS_CONTAINER_CREDENTIALS_FULL_URI":
            return self.absoluteURI
        default:
            return nil
        }
    }
}
