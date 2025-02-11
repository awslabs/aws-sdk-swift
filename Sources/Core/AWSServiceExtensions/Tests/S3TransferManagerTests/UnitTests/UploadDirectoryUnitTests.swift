//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSServiceExtensions

class UploadDirectoryUnitTests: S3TMUnitTestCase {
    /*
         The following file structure under Resources/UploadDirectoryTestsResources/ is used by multiple tests below.

         |- source/
            |- nested/
                |- nested2/
                    |- d.txt
                |- b.txt
            |- a.txt
            |- symlinkToFileF
            |- symlinkToOutsideSourceDir
            |- symlinkToSourceDir
         |- outsideSource/
            |- c.txt
            |- e.txt
            |- symlinkToOutsideSourceDir
         |- f.txt
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
        let sourceURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source")
        let fetchedURLs = try UploadDirectoryUnitTests.tm.getDirectlyNestedURLs(in: sourceURL, isSymlink: false)
        let expectedURLs: Set<URL> = [
            // .standardizedFileURL here just adds a trailing slash.
            URL(string: sourceURL.absoluteString.appendingPathComponent("nested"))!.standardizedFileURL,
            URL(string: sourceURL.absoluteString.appendingPathComponent("a.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToOutsideSourceDir"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToSourceDir"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToFileF"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    func testGetDirectlyNestedURLsWithSymlinkURLThatPointsToSourceDir() throws {
        let sourceURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source/symlinkToSourceDir")
        let fetchedURLs = try UploadDirectoryUnitTests.tm.getDirectlyNestedURLs(in: sourceURL, isSymlink: true)
        let expectedURLs: Set<URL> = [
            // .standardizedFileURL not needed for "nested" because sourceURL is symlink to a directory.
            //  which makes returned URL not have trailing slash.
            URL(string: sourceURL.absoluteString.appendingPathComponent("nested"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("a.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToOutsideSourceDir"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToSourceDir"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToFileF"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    // MARK: - getNestedFileURLs tests.

    /*
         Expected results for getNestedFileURLs on source/ with recursive & followSymbolicLinks set to true :
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
         - Symlink to file outside of source
         - Symlinks that causes infinite loops
     */
    func testGetNestedFileURLsRecursiveAndFollowSymlinks() throws {
        let sourceURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source")
        let fetchedURLs = try UploadDirectoryUnitTests.tm.getNestedFileURLs(in: sourceURL, recursive: true, followSymbolicLinks: true)
        let expectedURLs: Set<URL> = [
            URL(string: sourceURL.absoluteString.appendingPathComponent("nested/nested2/d.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("nested/b.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("a.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToOutsideSourceDir/c.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToOutsideSourceDir/e.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToFileF"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    /*
         Expected results for getNestedFileURLs on source/ with only recursive set to true :
         - source/nested/nested2/d.txt
         - source/nested/b.txt
         - source/a.txt
     */
    func testGetNestedFileURLsRecursiveOnly() throws {
        let sourceURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source")
        let fetchedURLs = try UploadDirectoryUnitTests.tm.getNestedFileURLs(in: sourceURL, recursive: true, followSymbolicLinks: false)
        let expectedURLs: Set<URL> = [
            URL(string: sourceURL.absoluteString.appendingPathComponent("nested/nested2/d.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("nested/b.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("a.txt"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    /*
         Expected results for getNestedFileURLs on source/ with only followSymbolicLinks set to true :
         - source/a.txt
         - source/symlinkToFileD
     */
    func testGetNestedFileURLsFollowSymlinksOnly() throws {
        let sourceURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source")
        let fetchedURLs = try UploadDirectoryUnitTests.tm.getNestedFileURLs(in: sourceURL, recursive: false, followSymbolicLinks: true)
        let expectedURLs: Set<URL> = [
            URL(string: sourceURL.absoluteString.appendingPathComponent("a.txt"))!,
            URL(string: sourceURL.absoluteString.appendingPathComponent("symlinkToFileF"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    /*
         Expected results for getNestedFileURLs on source/ with neither option set to true :
         - source/a.txt
     */
    func testGetNestedFileURLsNeitherOptionsSet() throws {
        let sourceURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources/source")
        let fetchedURLs = try UploadDirectoryUnitTests.tm.getNestedFileURLs(in: sourceURL, recursive: false, followSymbolicLinks: false)
        let expectedURLs: Set<URL> = [
            URL(string: sourceURL.absoluteString.appendingPathComponent("a.txt"))!
        ]
        // Ensure no duplicate URL was returned.
        guard fetchedURLs.count == Set(fetchedURLs).count else {
            throw UploadDirectoryTestError.DuplicateFileURLsReturned
        }
        XCTAssertEqual(Set(fetchedURLs), expectedURLs)
    }

    // MARK: - getResolvedObjectKey tests.

    /*
        getResolvedObjectKey tests use 2 URLs below:
        - File URL      :   source/nested/nested2/d.txt
        - Directory URL :   source/
     */

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

    func testGetResolvedObjectKeyThrowsInvalidFileNameError() throws {
        let (fileURL, dirURL) = try getResolvedObjectKeyTestURLs()
        do {
            _ = try getResolvedObjectKeyTestHelper(fileURL: fileURL, dirURL: dirURL, s3Delimiter: ".")
            XCTFail("Expected S3TMUploadDirectoryError.InvalidFileName error.")
        } catch S3TMUploadDirectoryError.InvalidFileName {
            // Caught expected error; no-op.
        }
    }

    // Helpers for getResolvedObjectKey tests.

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
        s3Delimiter: String = UploadDirectoryUnitTests.tm.defaultPathSeparator(),
        s3Prefix: String? = nil
    ) throws -> String {
        let input = try UploadDirectoryInput(
            bucket: "dummy",
            source: dirURL,
            s3Prefix: s3Prefix,
            s3Delimiter: s3Delimiter
        )
        return try UploadDirectoryUnitTests.tm.getResolvedObjectKey(of: fileURL, inDir: dirURL, input: input)
    }

    private enum UploadDirectoryTestError: Error {
        case DuplicateFileURLsReturned
    }
}
