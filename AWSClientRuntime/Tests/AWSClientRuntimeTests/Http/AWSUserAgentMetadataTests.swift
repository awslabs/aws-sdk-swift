//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
@testable import AWSClientRuntime

class AWSUseragentMetadataTests: XCTestCase {
    let sdkMetadata = SDKMetadata(name: "swift", version: "0.0.1")
    let apiMetadata = APIMetadata(serviceId: "meow", version: "1.1")
    let osMetadata = OSMetadata(family: .iOS, version: "13.1")
    let languageMetadata = LanguageMetadata(version: "5.0")
    let executionEnvMetadata = ExecutionEnvMetadata(name: "e123")
    let frameworkMetadata = FrameworkMetadata(name: "aws-amplify", version: "2.0.1")

    func testHappyPathMinimum() {
        let sut = AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                       apiMetadata: apiMetadata,
                                       osMetadata: osMetadata,
                                       languageMetadata: languageMetadata)

        XCTAssertEqual("aws-sdk-swift/0.0.1 api/meow/1.1 os/iOS/13.1 lang/swift/5.0", sut.xAmzUserAgent)
    }

    func testWithLanguageMetadataExtras() {
        let languageMetadataWithExtras = LanguageMetadata(version: "5.0", extras: ["test1": "1.2.3"])
        let sut = AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                       apiMetadata: apiMetadata,
                                       osMetadata: osMetadata,
                                       languageMetadata: languageMetadataWithExtras)

        XCTAssertEqual("aws-sdk-swift/0.0.1 api/meow/1.1 os/iOS/13.1 lang/swift/5.0 md/test1/1.2.3", sut.xAmzUserAgent)
    }
    
    func testWithExecutionEnv() {
        let sut = AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                       apiMetadata: apiMetadata,
                                       osMetadata: osMetadata,
                                       languageMetadata: languageMetadata,
                                       executionEnvMetadata: executionEnvMetadata)

        XCTAssertEqual("aws-sdk-swift/0.0.1 api/meow/1.1 os/iOS/13.1 lang/swift/5.0 exec-env/e123", sut.xAmzUserAgent)
    }

    func testWithLanguageMetadataExtrasAndExecutionEnv() {
        let languageMetadataWithExtras = LanguageMetadata(version: "5.0", extras: ["test1": "1.2.3"])
        let sut = AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                       apiMetadata: apiMetadata,
                                       osMetadata: osMetadata,
                                       languageMetadata: languageMetadataWithExtras,
                                       executionEnvMetadata: executionEnvMetadata)

        XCTAssertEqual("aws-sdk-swift/0.0.1 api/meow/1.1 os/iOS/13.1 lang/swift/5.0 md/test1/1.2.3 exec-env/e123", sut.xAmzUserAgent)
    }

    func testWithLanguageMetadataExtrasAndExecutionEnvWithFramework() {
        let languageMetadataWithExtras = LanguageMetadata(version: "5.0", extras: ["test1": "1.2.3"])
        let sut = AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                       apiMetadata: apiMetadata,
                                       osMetadata: osMetadata,
                                       languageMetadata: languageMetadataWithExtras,
                                       executionEnvMetadata: executionEnvMetadata,
                                       frameworkMetadata: frameworkMetadata)

        XCTAssertEqual("aws-sdk-swift/0.0.1 api/meow/1.1 os/iOS/13.1 lang/swift/5.0 md/test1/1.2.3 exec-env/e123 lib/aws-amplify/2.0.1", sut.xAmzUserAgent)
    }

    func testWithLanguageMetadataExtrasAndExecutionEnvWithFrameworkExtras() {
        let languageMetadataWithExtras = LanguageMetadata(version: "5.0", extras: ["test1": "1.2.3"])
        let frameworkMetadataWithExtras = FrameworkMetadata(name: "aws-amplify", version: "2.0.1", extras: ["f1" : "c1"])

        let sut = AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                       apiMetadata: apiMetadata,
                                       osMetadata: osMetadata,
                                       languageMetadata: languageMetadataWithExtras,
                                       executionEnvMetadata: executionEnvMetadata,
                                       frameworkMetadata: frameworkMetadataWithExtras)

        XCTAssertEqual("aws-sdk-swift/0.0.1 api/meow/1.1 os/iOS/13.1 lang/swift/5.0 md/test1/1.2.3 exec-env/e123 lib/aws-amplify/2.0.1 md/f1/c1", sut.xAmzUserAgent)
    }

    func testUserAgent() {
        let ua = AWSUserAgentMetadata.fromEnv(apiMetadata: APIMetadata(serviceId: "Test Service", version: "1.2.3"))
        XCTAssert(ua.userAgent == "aws-sdk-swift/1.2.3")
    }
    
    func testXAmzUserAgent() {
        let currentOS = ClientRuntime.currentOS
        let apiMeta = APIMetadata(serviceId: "Test Service", version: "1.2.3")
        let sdkMeta = SDKMetadata(name: "swift", version: apiMeta.version)
        let osMeta = OSMetadata(family: currentOS, version: "11.4")
        let langMeta = LanguageMetadata(version: "9.9")
        let awsUserAgent = AWSUserAgentMetadata(sdkMetadata: sdkMeta,
                                      apiMetadata: apiMeta,
                                      osMetadata: osMeta,
                                      languageMetadata: langMeta)
        var expected: String = ""
        switch currentOS {
        case .linux:
            expected = "aws-sdk-swift/1.2.3 api/test-service/1.2.3 os/linux/11.4 lang/swift/9.9"
        case .macOS:
            expected = "aws-sdk-swift/1.2.3 api/test-service/1.2.3 os/macOS/11.4 lang/swift/9.9"
        case .iOS:
            expected = "aws-sdk-swift/1.2.3 api/test-service/1.2.3 os/iOS/11.4 lang/swift/9.9"
        case .unknown:
            expected = "aws-sdk-swift/1.2.3 api/test-service/1.2.3 os/unknown/11.4 lang/swift/9.9"
        default:
            XCTFail("Unexpected OS")
        }
        XCTAssert(awsUserAgent.xAmzUserAgent == expected, awsUserAgent.xAmzUserAgent)
    }
}
