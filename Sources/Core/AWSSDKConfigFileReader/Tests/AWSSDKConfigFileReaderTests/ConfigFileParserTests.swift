//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@_spi(FileBasedConfig) import AWSSDKCommon
//@_spi(FileBasedConfig) import ConfigFileReader

struct ParserTests: Decodable {

    struct Test: Decodable {

        struct Input: Decodable {
            let configFile: String?
            let credentialsFile: String?
        }

        struct Output: Decodable {

            enum Value: Decodable, Equatable {
                case string(String)
                case subproperty([String: String])

                init(from decoder: any Decoder) throws {
                    do {
                        let container = try decoder.singleValueContainer()
                        let string = try container.decode(String.self)
                        self = .string(string)
                    } catch {
                        let container = try decoder.singleValueContainer()
                        let dict = try container.decode([String: String].self)
                        self = .subproperty(dict)
                    }
                }
            }

            let profiles: [String: [String: Value]]?
            let ssoSessions: [String: [String: Value]]?
            let errorContaining: String?
        }

        let name: String
        let input: Input
        let output: Output
    }

    let description: String
    let tests: [Test]
}

class ConfigFileParserTests: XCTestCase {

    func test_json_runAllTestsDefinedInJSON() async throws {

        // Read the JSON test definitions into memory using the Decodable types above
        let testDataFileURL = Bundle.module.url(forResource: "config-file-parser-tests", withExtension: "json")!
        let testData = try Data(contentsOf: testDataFileURL)
        let allTests = try JSONDecoder().decode(ParserTests.self, from: testData)

        // Run each test
        for test in allTests.tests{

            // If config file contents were given, write them to a file on disk for use during the test.
            // If no config file contents were given, the file will not exist.
            let configFileURL = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
            if let configFileContents = test.input.configFile {
                let configData = Data(configFileContents.utf8)
                try configData.write(to: configFileURL)
            }

            // Do the same for credentials file as was done for config.
            let credentialsFileURL = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
            if let credentialsFileContents = test.input.credentialsFile {
                let credentialsData = Data(credentialsFileContents.utf8)
                try credentialsData.write(to: credentialsFileURL)
            }

            // Read the config/credential files, and store the result in a Swift Result for future use.
            let result: Result<FileBasedConfigurationSectionProviding?, Error>
            do {
                let success = try await TestSubject.constructor(configFileURL.path, credentialsFileURL.path)
                result = .success(success)
            } catch {
                result = .failure(error)
            }

            // If an error was expected, don't try to match the message.  Just make sure something was thrown.
            if let expectedErrorMessage = test.output.errorContaining {
                do {
                    _ = try result.get()
                    XCTFail("Test \"\(test.name)\" should have thrown \"\(expectedErrorMessage)\" but didn't")
                } catch {
                    // No action, this test was expected to throw
                }
            }

            // Make sure that any expected profiles are in the actual result, and that they match the expectation.
            if let expectedProfiles = test.output.profiles {
                do {
                    let actualSections = try result.get()
                    for (profileName, profileValue) in expectedProfiles {
                        guard let actualProfile = actualSections?.section(for: profileName, type: .profile) else {
                            XCTFail("Test \"\(test.name)\" Expected profile \"\(profileName)\" not in actual")
                            continue
                        }
                        if compare(testName: test.name, profileName: profileName, isSSO: false, expectedProfile: profileValue, actualProfile: actualProfile) {
                            // Profiles match, no error
                        } else {
                            XCTFail("Test \"\(test.name)\" profile named \"\(profileName)\" didn't match")
                        }
                    }
                } catch {
                    XCTFail("Test \"\(test.name)\" should have succeeded, but threw \"\(error.localizedDescription)\" instead")
                }
            }

            // Make sure any expected SSO sessions are in the actual result, and that they match the expectation.
            if let expectedSSOSessions = test.output.ssoSessions {
                do {
                    let actualSections = try result.get()
                    for (ssoSessionName, ssoSessionValue) in expectedSSOSessions {
                        guard let actualSSOSession = actualSections?.section(for: ssoSessionName, type: .ssoSession) else {
                            XCTFail("Test \"\(test.name)\" Expected sso-session \"\(ssoSessionName)\" not in actual")
                            continue
                        }
                        if compare(testName: test.name, profileName: ssoSessionName, isSSO: true, expectedProfile: ssoSessionValue, actualProfile: actualSSOSession) {
                            // Profiles match, no error
                        } else {
                            XCTFail("Test \"\(test.name)\" sso-session named \"\(ssoSessionName)\" didn't match")
                        }
                    }
                } catch {
                    XCTFail("Test \"\(test.name)\" should have succeeded, but threw \"\(error.localizedDescription)\" instead")
                }
            }
        }
    }

    private func compare(
        testName: String,
        profileName: String,
        isSSO: Bool,
        expectedProfile: [String: ParserTests.Test.Output.Value],
        actualProfile: any FileBasedConfigurationSection
    ) -> Bool {
        let elementName = isSSO ? "SSO session" : "profile"
        for (expectedPropertyName, expectedPropertyValue) in expectedProfile {
            let key = FileBasedConfigurationKey(rawValue: expectedPropertyName)
            switch expectedPropertyValue {
            case .string(let expectedString):
                guard let actualString = actualProfile.string(for: key) else {
                    XCTFail("Test \"\(testName)\" \(elementName) \"\(profileName)\": expected property \"\(expectedPropertyName)\" not present in actual")
                    return false
                }
                if actualString != expectedString {
                    XCTFail("Test \"\(testName)\" \(elementName) \"\(profileName)\": property \"\(expectedPropertyName)\" does not match")
                    return false
                }
            case .subproperty(let expectedSubproperty):
                guard let actualSubproperty = actualProfile.subproperties(for: key) else {
                    XCTFail("Test \"\(testName)\" \(elementName) \"\(profileName)\": expected subproperties \"\(expectedPropertyName)\" not present in actual")
                    return false
                }
                for (expectedSubpropertyName, expectedSubpropertyValue) in expectedSubproperty {
                    let subpropertyKey = FileBasedConfigurationKey(rawValue: expectedSubpropertyName)
                    guard let actualSubpropertyValue = actualSubproperty.value(for: subpropertyKey) else {
                        XCTFail("Test \"\(testName)\" \(elementName) \"\(profileName)\": expected subproperties \"\(expectedPropertyName)\" not present in actual")
                        return false
                    }
                    if expectedSubpropertyValue != actualSubpropertyValue {
                        XCTFail("Test \"\(testName)\" \(elementName) \"\(profileName)\": property \"\(expectedPropertyName)\" subproperty \"\(expectedSubpropertyName)\" does not match")
                        return false
                    }
                }
            }
        }
        return true
    }
}
