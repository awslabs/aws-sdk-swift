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

// A simple parser that throws a specific error
func parseProfile(line: String) throws -> String {
    // Fails immediately if the line doesn't end with "]"
    guard line.hasSuffix("]") else {
        throw ProfileParsingError.incompleteProfile(line: line)
    }
    
    // Additional parsing logic would go here...
    return "Parsed successfully: \(line)"
}

final class edgeCasesTests: XCTestCase {
    let edgeCase1 = Bundle.module.path(forResource: "edge_case_test_1", ofType: nil)
    let edgeCase2 = Bundle.module.path(forResource: "edge_case_test_2", ofType: nil)

    // Test for an invalid line format
    func testParseLine_UnknownLineTypeTests_throwsError() async throws {

        // Assert that the call throws an error and capture the thrown error
        do {
            _ = try await TestSubject.constructor(edgeCase2, nil)
            XCTFail("Reading edge case file should have failed")
        } catch {
            // Assert that the thrown error is of the correct type
            XCTAssertEqual(error as? ProfileParsingError, .incompleteProfile(line: "[profile test"))
        }
    }
    
    func testProfileParsing_withValidLine_succeeds() async throws {
//        let reader = try await TestSubject.constructor(edgeCase1, nil)
//        let namedSection = reader?.section(for: "test")
//        let result = try parseProfile(line: namedSection)
//        
//        XCTAssertEqual(result, "Parsed successfully: \(namedSection!)")
    }
}
