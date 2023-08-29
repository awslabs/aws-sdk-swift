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
        XCTAssertNoThrow(try ECSCredentialsProvider(relativeURI: "subfolder/test.txt", absoluteURI: "invalid absolute uri"))
    }

    func testGetCredentialsWithAbsoluteURI() async throws {
        XCTAssertNoThrow(try ECSCredentialsProvider(relativeURI: nil, absoluteURI: "http://www.example.com/subfolder/test.txt"))
    }

    func testGetCredentialsWithInvalidAbsoluteURI() async throws {
        XCTAssertThrowsError(try ECSCredentialsProvider(relativeURI: nil, absoluteURI: "test"))
    }

    func testGetCredentialsWithMissingURI() async throws {
        XCTAssertThrowsError(try ECSCredentialsProvider(relativeURI: nil, absoluteURI: nil))
    }

    func testGetCredentialsWithRelativeURIEnv() async throws {
        // relative uri is preferred over absolute uri so we shouldn't get thrown an error
        setenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI", "subfolder/test.txt", 1)
        unsetenv("AWS_CONTAINER_CREDENTIALS_FULL_URI")
        XCTAssertNoThrow(try ECSCredentialsProvider())
    }

    func testGetCredentialsWithAbsoluteURIEnv() async throws {
        unsetenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", "http://www.example.com/subfolder/test.txt", 1)
        XCTAssertNoThrow(try ECSCredentialsProvider())
    }

    func testGetCredentialsWithInvalidAbsoluteURIEnv() async throws {
        unsetenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        setenv("AWS_CONTAINER_CREDENTIALS_FULL_URI", "test", 1)
        XCTAssertThrowsError(try ECSCredentialsProvider())
    }

    func testGetCredentialsWithMissingURIEnv() async throws {
        unsetenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        unsetenv("AWS_CONTAINER_CREDENTIALS_FULL_URI")
        XCTAssertThrowsError(try ECSCredentialsProvider())
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
