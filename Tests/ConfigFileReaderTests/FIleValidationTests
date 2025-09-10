//
//  File.swift
//  ConfigFileReader
//
//  Created by Felix, Anthony on 9/10/25.
//

import XCTest
import Foundation
@_spi(FileBasedConfig) import ConfigFileReader
@_spi(FileBasedConfig) import AWSSDKCommon

final class FileValidatorTests: XCTestCase {
    // A property to hold the URL of a temporary file.
    var tempFileUrl: URL!
    
    // The FileManager instance to use for file operations.
    let fileManager = FileManager.default

    // This method is called before each test function is executed.
    override func setUpWithError() throws {
        super.setUpWithError()
        
        // Arrange: Create a temporary file and write some data to it.
        tempFileUrl = fileManager.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let fileContents = "This is a test file for validation."
        try fileContents.write(to: tempFileUrl, atomically: true, encoding: .utf8)
    }

    // This method is called after each test function has finished.
    override func tearDownWithError() throws {
        // Clean up: Remove the temporary file created in `setUpWithError`.
        try fileManager.removeItem(at: tempFileUrl)
        super.tearDownWithError()
    }
    
    func testFileExistsAtPath() {
        // Act: Check for the existence of the temporary file.
        let exists = fileManager.fileExists(atPath: tempFileUrl.path)
        
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
    
    func testFileContentsMatchExpectedValue() throws {
        // Act: Read the contents of the file.
        let fileData = try Data(contentsOf: tempFileUrl)
        let fileContents = String(data: fileData, encoding: .utf8)
        
        // Assert: Check that the file contents match the original string.
        XCTAssertEqual(fileContents, "This is a test file for validation.", "The file contents should match the expected string.")
    }
}
