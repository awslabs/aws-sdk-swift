//
//  File.swift
//  ConfigFileReader
//
//  Created by Felix, Anthony on 9/10/25.
//

import XCTest
import Foundation
@_spi(FileBasedConfig) import AWSSDKConfigFileReader
@_spi(FileBasedConfig) import AWSSDKCommon

final class FileValidatorTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "file_based_config_tests", ofType: nil)
    
    // The FileManager instance to use for file operations.
    let fileManager = FileManager.default
    
    func testFileExistsAtPath() {
        // Act: Check for the existence of the file.
        let exists = fileManager.fileExists(atPath: configPath!)
        
        // Assert: Verify that the file exists.
        XCTAssertTrue(exists, "The file should exist at the temporary path.")
    }
    
    func testFileDoesNotExist() {
        // Arrange: Create a path for a file that is not created.
        let invalidUrl = fileManager.temporaryDirectory.appendingPathComponent("non_existent_file.txt")
        
        // Act: Check for the existence of the non-existent file.
        let exists = fileManager.fileExists(atPath: invalidUrl.path)
        
        // Assert: Verify that the file does not exist.
        XCTAssertFalse(exists, "The file should not exist at this path.")
    }
}
