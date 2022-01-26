//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSClientRuntime

class FrameworkMetadataTests: XCTestCase {
    func testWithNoMetadata() {
        let sut = FrameworkMetadata(name: "aws-amplify", version: "2.0.0")
        
        XCTAssertEqual("lib/aws-amplify/2.0.0", sut.description)        
    }

    func testNameIsSanitized() {
        let sut = FrameworkMetadata(name: "aws-🐶woof", version: "1.2🐈.3")
        
        XCTAssertEqual("lib/aws-woof/1.2.3", sut.description)
    }
    
    func testWithSingleMetadata() {
        let extras = ["test": "1.0"]

        let sut = FrameworkMetadata(name: "aws-amplify", version: "2.0.0", extras: extras)
        
        XCTAssertEqual("lib/aws-amplify/2.0.0 md/test/1.0", sut.description)
    }
    
    func testWithMultipleMetadata() {
        let extras = ["test1": "1.0",
                      "test2": "SomethingOtherThanANumber"]

        let sut = FrameworkMetadata(name: "aws-amplify", version: "2.0.0", extras: extras)
        
        let option1 = "lib/aws-amplify/2.0.0 md/test1/1.0 md/test2/SomethingOtherThanANumber" == sut.description
        let option2 = "lib/aws-amplify/2.0.0 md/test2/SomethingOtherThanANumber md/test1/1.0" == sut.description
        XCTAssert(option1 || option2)
    }

    func testMetadataIsSanitized() {
        let extras = ["tes🍷t3": "1.2.🙉🙈🙊7"]

        let sut = FrameworkMetadata(name: "aws-nextProduct", version: "2.0.0", extras: extras)
        
        XCTAssertEqual("lib/aws-nextProduct/2.0.0 md/test3/1.2.7", sut.description)
    }
}
