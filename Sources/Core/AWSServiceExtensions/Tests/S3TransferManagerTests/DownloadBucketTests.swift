//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import enum AWSS3.S3ClientTypes
import class Foundation.FileManager
@testable import AWSServiceExtensions

class DownloadBucketTests: S3TMTestCase {
    // MARK: - createDestinationFiles test.

    /*
        Create test directory with UUID in temp (notated with "p" below).
        Mappings used in the test:
        [
            "key1.txt" : URL with path p + key1.txt,
            "dir1/key2.txt" : URL with path p + dir1/key2.txt,
            "dir1/../key1.txt" : URL with path p + dir1/../key1.txt,
        ]

        Depending on the order of mappings, either one of the semantically identical mappings must be skipped.
        As a result, only two files should be created (key1.txt & key2.txt).
     */

    func testCreateDestinationFiles() throws {
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        let testDir = FileManager.default.temporaryDirectory.appendingPathComponent(uuid, isDirectory: true)
        let keyToURLInput: [String: URL] = [
            "key1.txt": URL(string: testDir.absoluteString.appendingPathComponent("key1.txt"))!,
            "dir1/key2.txt": URL(string: testDir.absoluteString.appendingPathComponent("dir1/key2.txt"))!,
            "dir1/../key1.txt": URL(string: testDir.absoluteString.appendingPathComponent("dir1/../key1.txt"))!
        ]
        let actualKeyToCreatedURLsMap = try DownloadBucketTests.tm.createDestinationFiles(keyToResolvedURLMapping: keyToURLInput)
        XCTAssertEqual(actualKeyToCreatedURLsMap.count, 2)
        try FileManager.default.removeItem(at: testDir)
    }

    // MARK: - getFileURLsResolvedFromObjectKeys tests.

    func testResolveFileURLsFromObjectKeysWithCustomFilter() {
        let objects = s3ObjectsForFileURLsResolvedFromObjectKeysTests()
        let destination = URL(string: "dest/")!
        let objectKeyToResolvedURL = DownloadBucketTests.tm.getFileURLsResolvedFromObjectKeys(
            objects: objects,
            destination: destination,
            s3Prefix: nil,
            s3Delimiter: "/",
            filter: { object in return object.key!.hasPrefix("dir1") }
        )
        let expectedMap: [String: URL] = [
            "a.txt": URL(string: "dest/a.txt")!,
            "dir3/d.txt": URL(string: "dest/dir3/d.txt")!
        ]
        XCTAssertEqual(objectKeyToResolvedURL, expectedMap)
    }

    func testResolveFileURLsFromObjectKeysWithS3Prefix() {
        let prefix = "pre/"
        let objects = s3ObjectsForFileURLsResolvedFromObjectKeysTests(
            prefix: prefix
        )
        let destination = URL(string: "dest/")!
        let objectKeyToResolvedURL = DownloadBucketTests.tm.getFileURLsResolvedFromObjectKeys(
            objects: objects,
            destination: destination,
            s3Prefix: prefix,
            s3Delimiter: "/",
            filter: { object in return false }
        )
        let expectedMap: [String: URL] = [
            "pre/a.txt": URL(string: "dest/a.txt")!,
            "pre/dir1/b.txt": URL(string: "dest/dir1/b.txt")!,
            "pre/dir1/dir2/c.txt": URL(string: "dest/dir1/dir2/c.txt")!,
            "pre/dir3/d.txt": URL(string: "dest/dir3/d.txt")!,
        ]
        XCTAssertEqual(objectKeyToResolvedURL, expectedMap)
    }

    func testResolveFileURLsFromObjectKeysWithCustomS3Delimiter() {
        let objects = s3ObjectsForFileURLsResolvedFromObjectKeysTests(
            delimiter: "-"
        )
        let destination = URL(string: "dest/")!
        let objectKeyToResolvedURL = DownloadBucketTests.tm.getFileURLsResolvedFromObjectKeys(
            objects: objects,
            destination: destination,
            s3Prefix: nil,
            s3Delimiter: "-",
            filter: { object in return false }
        )
        let expectedMap: [String: URL] = [
            "a.txt": URL(string: "dest/a.txt")!,
            "dir1-b.txt": URL(string: "dest/dir1/b.txt")!,
            "dir1-dir2-c.txt": URL(string: "dest/dir1/dir2/c.txt")!,
            "dir3-d.txt": URL(string: "dest/dir3/d.txt")!,
        ]
        XCTAssertEqual(objectKeyToResolvedURL, expectedMap)
    }

    /*
         Helper function for gteFileURLsResolvedFromObjectKeys tests.

         List of used keys:
         - simulatedDirectory/
         - dir1/dir2/../../../escapedFile.txt
         - a.txt
         - dir1/b.txt
         - dir1/dir2/c.txt
         - dir3/d.txt
     */
    private func s3ObjectsForFileURLsResolvedFromObjectKeysTests(
        delimiter d: String = "/",
        prefix: String = ""
    ) -> [S3ClientTypes.Object] {
        return [
            .init(key: prefix + "simulatedDirectory\(d)"), // File skipped bc it ends with "/"
            .init(key: prefix + "dir1\(d)dir2\(d)..\(d)..\(d)..\(d)escapedFile.txt"), // File skipped bc it escapes dest.
            .init(key: prefix + "a.txt"),
            .init(key: prefix + "dir1\(d)b.txt"),
            .init(key: prefix + "dir1\(d)dir2\(d)c.txt"),
            .init(key: prefix + "dir3\(d)d.txt")
        ]
    }

    // MARK: - validateOrCreateDestinationDirectory tests.

    func testValidateOrCreateDestinationDirectoryWithExistingDirectoryURL() throws {
        let destinationURL = URL(string: Bundle.module.resourceURL!.absoluteString.appendingPathComponent(
            "Resources/DownloadDirectoryTestsResources/destination"
        ))!
        try DownloadBucketTests.tm.validateOrCreateDestinationDirectory(input: DownloadBucketInput(
            bucket: "dummy",
            destination: destinationURL
        ))
    }

    func testValidateOrCreateDestinationDirectoryWithExistingFileURL() throws {
        let destinationURL = URL(string: Bundle.module.resourceURL!.absoluteString.appendingPathComponent(
            "Resources/DownloadBucketTestsResources/file.txt"
        ))!
        do {
            try DownloadBucketTests.tm.validateOrCreateDestinationDirectory(input: DownloadBucketInput(
                bucket: "dummy",
                destination: destinationURL
            ))
            XCTFail("Expected error S3TMDownloadBucketError.ProvidedDestinationIsNotADirectory to be thrown.")
        } catch S3TMDownloadBucketError.ProvidedDestinationIsNotADirectory {
            // Success; caught expected error. No-op.
        }
    }

    func testValidateOrCreateDestinationDirectoryCreatesDirectory() throws {
        let tempDir = FileManager.default.temporaryDirectory
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        let destinationURL = URL(string: tempDir.absoluteString.appendingPathComponent("\(uuid)/dir2/dir3"))!
        try DownloadBucketTests.tm.validateOrCreateDestinationDirectory(input: DownloadBucketInput(
            bucket: "dummy",
            destination: destinationURL
        ))
        XCTAssertTrue(FileManager.default.fileExists(atPath: destinationURL.path))
        XCTAssertTrue(try destinationURL.resourceValues(forKeys: [.isDirectoryKey]).isDirectory ?? false)
        try FileManager.default.removeItem(at: tempDir.appendingPathComponent("\(uuid)/"))
    }

    // MARK: - filePathEscapesDestination tests.

    func testFilePathEscapesDestinationFalse1() {
        let filePath = "a.txt"
        XCTAssertFalse(DownloadBucketTests.tm.filePathEscapesDestination(filePath: filePath))
    }

    func testFilePathEscapesDestinationFalse2() {
        let filePath = "dir1/../dir2/../a.txt"
        XCTAssertFalse(DownloadBucketTests.tm.filePathEscapesDestination(filePath: filePath))
    }

    func testFilePathEscapesDestinationFalse3() {
        let filePath = "dir1/dir2/../../dir3/a.txt"
        XCTAssertFalse(DownloadBucketTests.tm.filePathEscapesDestination(filePath: filePath))
    }

    func testFilePathEscapesDestinationTrue1() {
        let filePath = "../a.txt"
        XCTAssertTrue(DownloadBucketTests.tm.filePathEscapesDestination(filePath: filePath))
    }

    func testFilePathEscapesDestinationTrue2() {
        let filePath = "dir1/../../a.txt"
        XCTAssertTrue(DownloadBucketTests.tm.filePathEscapesDestination(filePath: filePath))
    }

    func testFilePathEscapesDestinationTrue3() {
        let filePath = "dir1/dir2/../dir3/../../../a.txt"
        XCTAssertTrue(DownloadBucketTests.tm.filePathEscapesDestination(filePath: filePath))
    }

    // MARK: - createFile tests.

    func testCreateFileWithTopLevelFile() throws {
        let tempDir = FileManager.default.temporaryDirectory
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        let fileURL = URL(string: tempDir.absoluteString.appendingPathComponent("\(uuid).txt"))!
        try DownloadBucketTests.tm.createFile(at: fileURL)
        XCTAssertTrue(FileManager.default.fileExists(atPath: fileURL.path))
        XCTAssertTrue(try fileURL.resourceValues(forKeys: [.isRegularFileKey]).isRegularFile ?? false)
        try FileManager.default.removeItem(at: fileURL)
    }

    func testCreateFileWithNestedFileCreatesIntermediateDirectories() throws {
        let tempDir = FileManager.default.temporaryDirectory
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        let fileURL = URL(string: tempDir.absoluteString.appendingPathComponent("\(uuid)/dir1/dir2/dir3/file.txt"))!
        try DownloadBucketTests.tm.createFile(at: fileURL)
        XCTAssertTrue(FileManager.default.fileExists(atPath: fileURL.path))
        XCTAssertTrue(try fileURL.resourceValues(forKeys: [.isRegularFileKey]).isRegularFile ?? false)
        try FileManager.default.removeItem(at: tempDir.appendingPathComponent("\(uuid)/"))
    }
}
