//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import XCTest
@testable import AWSClientRuntime

class LanguageMetadataTests: XCTestCase {
    func testHappyPath() {
        let sut = LanguageMetadata(version: "5.0")

        XCTAssertEqual("lang/swift/5.0", sut.description)
    }
    
    func testHappyPathWithSingleExtra() {
        let sut = LanguageMetadata(version: "5.1", extras: ["test1": "4.3"])

        XCTAssertEqual("lang/swift/5.1 md/test1/4.3", sut.description)
    }

    func testHappyPathWithMultipleExtras() {
        let sut = LanguageMetadata(version: "5.2", extras: ["test1": "4.4",
                                                            "test2": "9.0.1"])

        let option1 = "lang/swift/5.2 md/test1/4.4 md/test2/9.0.1" == sut.description
        let option2 = "lang/swift/5.2 md/test2/9.0.1 md/test1/4.4" == sut.description
        XCTAssert(option1 || option2)
    }

    func testHappyPathWithMultipleExtrasSanitize() {
        let sut = LanguageMetadata(version: "4👍.2", extras: ["test🍺3": "4.1",
                                                            "test🍙4": "9.0.🍘2"])

        let option1 = "lang/swift/4.2 md/test3/4.1 md/test4/9.0.2" == sut.description
        let option2 = "lang/swift/4.2 md/test4/9.0.2 md/test3/4.1" == sut.description
        XCTAssert(option1 || option2)
    }
}
