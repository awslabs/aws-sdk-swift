//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
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
}
