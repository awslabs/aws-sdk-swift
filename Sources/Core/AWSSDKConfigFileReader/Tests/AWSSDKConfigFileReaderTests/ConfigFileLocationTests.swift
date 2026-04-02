//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Foundation
@_spi(FileBasedConfig) import AWSSDKConfigFileReader
@_spi(FileBasedConfig) import AWSSDKCommon

private struct LocationTests: Decodable {
    let tests: [LocationTest]
}

private struct LocationTest: Decodable {
    let name: String
    let environment: [String: String]
    let platform: String
    let profile: String
    let configLocation: String
    let credentialsLocation: String
}

final class ConfigFileLocationTests: XCTestCase {
    
    // MARK: - Helpers

    private func writeTempFile(content: String) throws -> URL {
        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
        try content.write(to: url, atomically: true, encoding: .utf8)
        return url
    }

    private func withEnv(_ key: String, value: String?, block: () async throws -> Void) async throws {
        let existing = ProcessInfo.processInfo.environment[key]
        setenv(key, value ?? "", 1)
        defer {
            if let existing {
                setenv(key, existing, 1)
            } else {
                unsetenv(key)
            }
        }
        try await block()
    }

    // MARK: - AWS_CONFIG_FILE override

    func test_awsConfigFileEnvVar_overridesDefaultConfigLocation() async throws {
        let configURL = try writeTempFile(content: "[profile foo]\nregion = us-east-1\n")

        try await withEnv("AWS_CONFIG_FILE", value: configURL.path) {
            let result = try await ConfigFileReader.makeAsync(configFilePath: nil, credentialsFilePath: nil)
            XCTAssertEqual(result?.section(for: "foo")?.string(for: "region"), "us-east-1")
        }
    }

    func test_awsConfigFileEnvVar_doesNotAffectCredentialsLocation() async throws {
        let configURL = try writeTempFile(content: "[profile foo]\nregion = us-east-1\n")
        let credsURL = try writeTempFile(content: "[foo]\naws_access_key_id = KEY1\n")

        try await withEnv("AWS_CONFIG_FILE", value: configURL.path) {
            let result = try await ConfigFileReader.makeAsync(
                configFilePath: nil,
                credentialsFilePath: credsURL.path
            )
            XCTAssertEqual(result?.section(for: "foo")?.string(for: "region"), "us-east-1")
            XCTAssertEqual(result?.section(for: "foo")?.string(for: "aws_access_key_id"), "KEY1")
        }
    }

    // MARK: - AWS_SHARED_CREDENTIALS_FILE override

    func test_awsSharedCredentialsFileEnvVar_overridesDefaultCredentialsLocation() async throws {
        let credsURL = try writeTempFile(content: "[foo]\naws_access_key_id = KEY1\n")

        try await withEnv("AWS_SHARED_CREDENTIALS_FILE", value: credsURL.path) {
            let result = try await ConfigFileReader.makeAsync(configFilePath: nil, credentialsFilePath: nil)
            XCTAssertEqual(result?.section(for: "foo")?.string(for: "aws_access_key_id"), "KEY1")
        }
    }

    func test_awsSharedCredentialsFileEnvVar_doesNotAffectConfigLocation() async throws {
        let configURL = try writeTempFile(content: "[profile foo]\nregion = us-east-1\n")
        let credsURL = try writeTempFile(content: "[foo]\naws_access_key_id = KEY1\n")

        try await withEnv("AWS_SHARED_CREDENTIALS_FILE", value: credsURL.path) {
            let result = try await ConfigFileReader.makeAsync(
                configFilePath: configURL.path,
                credentialsFilePath: nil
            )
            XCTAssertEqual(result?.section(for: "foo")?.string(for: "region"), "us-east-1")
            XCTAssertEqual(result?.section(for: "foo")?.string(for: "aws_access_key_id"), "KEY1")
        }
    }

    // MARK: - Both overrides together

    func test_bothEnvVars_overrideBothLocations() async throws {
        let configURL = try writeTempFile(content: "[profile foo]\nregion = eu-west-1\n")
        let credsURL = try writeTempFile(content: "[foo]\naws_access_key_id = KEY2\n")

        try await withEnv("AWS_CONFIG_FILE", value: configURL.path) {
            try await withEnv("AWS_SHARED_CREDENTIALS_FILE", value: credsURL.path) {
                let result = try await ConfigFileReader.makeAsync(configFilePath: nil, credentialsFilePath: nil)
                XCTAssertEqual(result?.section(for: "foo")?.string(for: "region"), "eu-west-1")
                XCTAssertEqual(result?.section(for: "foo")?.string(for: "aws_access_key_id"), "KEY2")
            }
        }
    }

    // MARK: - Missing files

    func test_missingConfigFile_returnsNilGracefully() async throws {
        let result = try await ConfigFileReader.makeAsync(
            configFilePath: "/nonexistent/path/config",
            credentialsFilePath: "/nonexistent/path/credentials"
        )
        XCTAssertNil(result?.section(for: "default"))
    }

    func test_missingCredentialsFile_stillReadsConfig() async throws {
        let configURL = try writeTempFile(content: "[profile foo]\nregion = us-west-2\n")
        let result = try await ConfigFileReader.makeAsync(
            configFilePath: configURL.path,
            credentialsFilePath: "/nonexistent/path/credentials"
        )
        XCTAssertEqual(result?.section(for: "foo")?.string(for: "region"), "us-west-2")
    }

    // MARK: - Env var takes priority over passed-in path

    func test_envVarTakesPriorityOverPassedInConfigPath() async throws {
        let envConfigURL = try writeTempFile(content: "[profile env-profile]\nregion = us-east-2\n")
        let argConfigURL = try writeTempFile(content: "[profile arg-profile]\nregion = us-west-1\n")

        try await withEnv("AWS_CONFIG_FILE", value: envConfigURL.path) {
            let result = try await ConfigFileReader.makeAsync(
                configFilePath: argConfigURL.path,
                credentialsFilePath: nil
            )
            XCTAssertNotNil(result?.section(for: "env-profile"))
            XCTAssertNil(result?.section(for: "arg-profile"))
        }
    }
    
    // MARK: - JSON-driven location tests

    func test_json_runAllLocationTestsDefinedInJSON() async throws {
        let testDataURL = Bundle.module.url(forResource: "config-file-location-tests", withExtension: "json")!
        let testData = try Data(contentsOf: testDataURL)
        let json = try JSONDecoder().decode(LocationTests.self, from: testData)

        for test in json.tests {
            // Skip Windows-only tests — expandingTildeInPath handles home on macOS
            guard test.platform == "linux" || test.platform == "macos" else { continue }
            guard test.environment["AWS_CONFIG_FILE"] != nil ||
                  test.environment["AWS_SHARED_CREDENTIALS_FILE"] != nil else { continue }

            let testDir = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString)
            try FileManager.default.createDirectory(at: testDir, withIntermediateDirectories: true)
            defer { try? FileManager.default.removeItem(at: testDir) }

            // Write config file
            let configPath = testDir.appendingPathComponent(test.configLocation)
            try FileManager.default.createDirectory(
                at: configPath.deletingLastPathComponent(),
                withIntermediateDirectories: true
            )
            try "[profile \(test.profile)]\nregion = \(test.profile)\n"
                .write(to: configPath, atomically: true, encoding: .utf8)

            // Write credentials file
            let credsPath = testDir.appendingPathComponent(test.credentialsLocation)
            try FileManager.default.createDirectory(
                at: credsPath.deletingLastPathComponent(),
                withIntermediateDirectories: true
            )
            try "[\(test.profile)]\nregion = \(test.profile)\n"
                .write(to: credsPath, atomically: true, encoding: .utf8)

            // Apply env vars
            var envVarsToClean: [String] = []
            for (key, value) in test.environment where value != "ignored" {
                setenv(key, testDir.path + "/" + value, 1)
                envVarsToClean.append(key)
            }
            defer { envVarsToClean.forEach { unsetenv($0) } }

            let result = try await ConfigFileReader.makeAsync(configFilePath: nil, credentialsFilePath: nil)
            XCTAssertNotNil(
                result?.section(for: test.profile),
                "Test \"\(test.name)\" — profile \"\(test.profile)\" not found"
            )
        }
    }
}
