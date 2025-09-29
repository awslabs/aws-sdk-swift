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

// Custom error for parsing profile lines
enum ProfileParsingError: Error, Equatable {
    case incompleteProfile(line: String)
    case invalidFormat(line: String)
}

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
    let edgeCases = Bundle.module.path(forResource: "edge_cases_tests", ofType: nil)
    
    // Test for an invalid line format
    func testParseLine_UnknownLineTypeTests_throwsError() async throws {
        let reader = try await TestSubject.constructor(edgeCases, nil)
        let namedSection = reader?.section(for: "test")
        
        // Assert that the call throws an error and capture the thrown error
        XCTAssertThrowsError(try parseProfile(line: namedSection)) { thrownError in
            // Assert that the thrown error is of the correct type
            XCTAssertEqual(thrownError as? ProfileParsingError, .incompleteProfile(line: namedSection))
            }
    }
    
    func testProfileParsing_withValidLine_succeeds() async throws {
        let reader = try await TestSubject.constructor(edgeCases, nil)
        let namedSection = reader?.section(for: "test")
        let result = try parseProfile(line: namedSection)
        
        XCTAssertEqual(result, "Parsed successfully: \(namedSection!)")
    }
}
