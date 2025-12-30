//
//  Test.swift
//  ConfigFileReader
//
//  Created by Felix, Anthony on 9/22/25.
//

import XCTest
import Foundation
@_spi(FileBasedConfig) import ConfigFileReader
@_spi(FileBasedConfig) import AWSSDKCommon

final class edgeCasesTests: XCTestCase {
    let edgeCase1 = Bundle.module.path(forResource: "edge_case_test_1", ofType: nil)
    let edgeCase2 = Bundle.module.path(forResource: "edge_case_test_2", ofType: nil)
    let edgeCase3 = Bundle.module.path(forResource: "edge_case_test_3", ofType: nil)

    // Test for an invalid line format
//    func testParseLine_MissingClosingBracket_throwsError() async throws {
//        // Assert that the call throws an error and capture the thrown error
//        do {
//            _ = try await TestSubject.constructor(edgeCase2, nil)
//            XCTFail("Reading edge case file should have failed")
//        } catch {
//            // Assert that the thrown error is of the correct type
//            XCTAssertEqual(error as? ParsingError, .incompleteProfile(line: "[profile test"))
//        }
//    }
    
//    func testParseLine_MissingEqualSign_throwsError() async throws {
//        // Assert that the call throws an error and capture the thrown error
//        do {
//            _ = try await TestSubject.constructor(edgeCase1, nil)
//            XCTFail("Reading edge case file should have failed")
//        } catch {
//            // Assert that the thrown error is of the correct type
//            XCTAssertEqual(error as? ParsingError, .invalidFormat(line: "aws_access_key_id  ACCESS_KEY_0"))
//        }
//    }
    
//    func testParseLine_LineOrdering_throwsError() async throws {
//        // Assert that the call throws an error and capture the thrown error
//        do {
//            _ = try await TestSubject.constructor(edgeCase3, nil)
//            XCTFail("Reading edge case file should have failed")
//        } catch {
//            // Assert that the thrown error is of the correct type
//            XCTAssertEqual(error as? ParsingError, .invalidLineOrder(line: "region = us-east-1"))
//        }
//    }
}
