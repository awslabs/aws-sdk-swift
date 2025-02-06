//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSServiceExtensions

class UploadDirectoryTests: S3TMTestCase {
    /*
         The following file structure under Resources/UploadDirectoryTestsResources/ is used by multiple tests below.

         |- source/
            |- nested/
                |- nested2/
                    |- d.txt
                |- b.txt
            |- a.txt
            |- symlinkToOutsideSourceDir
            |- symlinkToSourceDir
         |- outsideSource/
            |- c.txt
            |- e.txt
            |- symlinkToOutsideSourceDir
     */

    // MARK: - getDirectlyNestedURLs tests.

    /*
         Expected results for getDirectlyNestedURLs on source/ :
         - source/nested/
         - source/a.txt
         - source/symlinkToOutsideSourceDir
         - source/symlinkToSourceDir
     */

    func testGetDirectlyNestedURLsWithDirectoryURL() throws {
        let bundleURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source")
        let fetchedURLs = try UploadDirectoryTests.tm.getDirectlyNestedURLs(in: bundleURL, isSymlink: false)
        // .standardizedFileURL for "nested" just adds a trailing slash at the end.
        // For some reason FileManager:contentsOfDirectory returns trailing slash for directory URL when accessed via
        //  concrete directory URL. The next test case that uses symlink URL doesn't need .standardizedFileURL call.
        let expectedURLs: Set<URL> = [
            URL(string: bundleURL.absoluteString.appendingPathComponent("nested"))!.standardizedFileURL,
            URL(string: bundleURL.absoluteString.appendingPathComponent("a.txt"))!,
            URL(string: bundleURL.absoluteString.appendingPathComponent("symlinkToOutsideSourceDir"))!,
            URL(string: bundleURL.absoluteString.appendingPathComponent("symlinkToSourceDir"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    func testGetDirectlyNestedURLsWithSymlinkURLThatPointsToDirectory() throws {
        let bundleURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source/symlinkToSourceDir")
        let fetchedURLs = try UploadDirectoryTests.tm.getDirectlyNestedURLs(in: bundleURL, isSymlink: true)
        let expectedURLs: Set<URL> = [
            URL(string: bundleURL.absoluteString.appendingPathComponent("nested"))!,
            URL(string: bundleURL.absoluteString.appendingPathComponent("a.txt"))!,
            URL(string: bundleURL.absoluteString.appendingPathComponent("symlinkToOutsideSourceDir"))!,
            URL(string: bundleURL.absoluteString.appendingPathComponent("symlinkToSourceDir"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    // MARK: - getNestedFileURLs tests.

    /*
         Expected results for getNestedFileURLs on source/ :
         - source/nested/nested2/d.txt
         - source/nested/b.txt
         - source/a.txt
         - source/symlinkToOutsideSourceDir/c.txt
         - source/symlinkToOutsideSourceDir/e.txt

         Using above directory structure with getNestedFileURLs tests:
         - Top-level regular file
         - Top-level directory
         - Nested regular file
         - Nested directory
         - Symlink to directory outside of source
         - Symlink that causes infinite loop
     */
    func testGetNestedFileURLs() {
        
    }

    // MARK: - getResolvedObjectKey tests.

    /*
        Using:
        - source/nested/nested2/d.txt (file URL)
        - source/ (directory URL)
     */

    // getResolvedObjectKey success cases.

    func testGetResolvedObjectKeyDefaultS3DelimiterNilPrefix() throws {
        let (fileURL, dirURL) = try getResolvedObjectKeyTestURLs()
        let resolvedKey = try getResolvedObjectKeyTestHelper(fileURL: fileURL, dirURL: dirURL)
        let expectedKey = "nested/nested2/d.txt"
        XCTAssertEqual(resolvedKey, expectedKey)
    }

    func testGetResolvedObjectKeyCustomS3DelimiterNilPrefix() throws {
        let (fileURL, dirURL) = try getResolvedObjectKeyTestURLs()
        let resolvedKey = try getResolvedObjectKeyTestHelper(fileURL: fileURL, dirURL: dirURL, s3Delimiter: "-")
        let expectedKey = "nested-nested2-d.txt"
        XCTAssertEqual(resolvedKey, expectedKey)
    }

    func testGetResolvedObjectKeyDefaultS3DelimiterWithPrefix() throws {
        let (fileURL, dirURL) = try getResolvedObjectKeyTestURLs()
        let resolvedKey = try getResolvedObjectKeyTestHelper(fileURL: fileURL, dirURL: dirURL, s3Prefix: "pre")
        let expectedKey = "pre/nested/nested2/d.txt"
        XCTAssertEqual(resolvedKey, expectedKey)
    }

    func testGetResolvedObjectKeyCustomS3DelimiterWithPrefix() throws {
        let (fileURL, dirURL) = try getResolvedObjectKeyTestURLs()
        let resolvedKey = try getResolvedObjectKeyTestHelper(
            fileURL: fileURL,
            dirURL: dirURL,
            s3Delimiter: "-",
            s3Prefix: "pre"
        )
        let expectedKey = "pre-nested-nested2-d.txt"
        XCTAssertEqual(resolvedKey, expectedKey)
    }

    // getResolvedObjectKey error cases.

    func testGetResolvedObjectKeyThrowsInvalidFileNameError() throws {
        let (fileURL, dirURL) = try getResolvedObjectKeyTestURLs()
        do {
            _ = try getResolvedObjectKeyTestHelper(fileURL: fileURL, dirURL: dirURL, s3Delimiter: ".")
            XCTFail("Expected S3TMUploadDirectoryError.InvalidFileName error.")
        } catch S3TMUploadDirectoryError.InvalidFileName {
            // Caught expected error; no-op.
        }
    }

    // getResolvedObjectKey tests' helpers.

    private func getResolvedObjectKeyTestURLs() throws -> (fileURL: URL, dirURL: URL) {
        let bundleURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources")
        return (
            fileURL: bundleURL.appendingPathComponent("source/nested/nested2/d.txt"),
            dirURL: bundleURL.appendingPathComponent("source")
        )
    }

    private func getResolvedObjectKeyTestHelper(
        fileURL: URL,
        dirURL: URL,
        s3Delimiter: String = UploadDirectoryTests.tm.defaultPathSeparator(),
        s3Prefix: String? = nil
    ) throws -> String {
        let input = try UploadDirectoryInput(
            bucket: "dummy",
            source: dirURL,
            s3Prefix: s3Prefix,
            s3Delimiter: s3Delimiter
        )
        return try UploadDirectoryTests.tm.getResolvedObjectKey(of: fileURL, inDir: dirURL, input: input)
    }

    private enum UploadDirectoryTestError: Error {
        case DuplicateFileURLsReturned
    }
}
