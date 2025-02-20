//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions

class DownloadBucketIntegTests: XCTestCase {
    static var tm: S3TransferManager!
    static var s3: S3Client!
    static let region = "us-west-2"
    static let bucketWithRegularKeys = "s3tm-download-bucket-integ-test-regular-keys-persistent"
    static let bucketWithCustomKeys = "s3tm-download-bucket-integ-test-custom-keys-persistent"
    // The source directory URL used in setup to populate persistent S3 buckets.
    static let sourceURL = Bundle.module.resourceURL!.appendingPathComponent(
        "Resources/DownloadBucketIntegTestsResources/source"
    )

    /*
         The following file structure under Resources/DownloadBucketIntegTestsResources/ is used by the setup below.

         |- source/
            |- nested/
                |- nested2/
                    |- nested3_1/
                        |- b.txt
                    |- nested3_2/
                        |- c.txt
                        |- d.txt
            |- a.txt
     */

    // This setUp runs just once for the test class, before tests start execution.
    // Creates a bucket with regular keys (default delimiter "/" and no prefix) and
    //  a bucket with custom keys (delimiter "-" and prefix "pre").
    // No-op if buckets already exist.
    override class func setUp() {
        let bucketSetupWithRegularKeysExpectation = XCTestExpectation(
            description: "S3 test bucket setup complete with regular keys"
        )
        let bucketSetupWithCustomKeysExpectation = XCTestExpectation(
            description: "S3 test bucket setup complete with custom keys"
        )

        Task {
            s3 = try S3Client(region: region)
            let tmConfig = try await S3TransferManagerConfig(s3Client: s3)
            tm = try await S3TransferManager(config: tmConfig)

            // Setup bucket with regular keys.
            do {
                _ = try await s3.headBucket(input: HeadBucketInput(bucket: bucketWithRegularKeys))
                bucketSetupWithRegularKeysExpectation.fulfill()
            } catch {
                do {
                    // Create bucket.
                    _ = try await s3.createBucket(input: CreateBucketInput(
                        bucket: bucketWithRegularKeys,
                        createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                            locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
                        )
                    ))
                    // Upload test source directory.
                    _ = try await tm.uploadDirectory(input: UploadDirectoryInput(
                        bucket: bucketWithRegularKeys,
                        source: sourceURL,
                        recursive: true
                    )).value
                    // Assert bucket content is as expected.
                    let expectedKeys: Set = [
                        "a.txt",
                        "nested/nested2/nested3_1/b.txt",
                        "nested/nested2/nested3_2/c.txt",
                        "nested/nested2/nested3_2/d.txt",
                    ]
                    let actualKeys = Set(try await s3.listObjectsV2(
                        input: ListObjectsV2Input(bucket: bucketWithRegularKeys)
                    ).contents!.map { $0.key })
                    XCTAssertEqual(actualKeys, expectedKeys)
                    bucketSetupWithRegularKeysExpectation.fulfill()
                } catch {
                    fatalError("Failed to setup S3 bucket with regular keys.")
                }
            }

            // Setup bucket with custom keys.
            do {
                _ = try await s3.headBucket(input: HeadBucketInput(bucket: bucketWithCustomKeys))
                bucketSetupWithCustomKeysExpectation.fulfill()
            } catch {
                do {
                    // Create bucket.
                    _ = try await s3.createBucket(input: CreateBucketInput(
                        bucket: bucketWithCustomKeys,
                        createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                            locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
                        )
                    ))
                    // Upload test source directory.
                    _ = try await tm.uploadDirectory(input: UploadDirectoryInput(
                        bucket: bucketWithCustomKeys,
                        source: sourceURL,
                        recursive: true,
                        s3Prefix: "pre",
                        s3Delimiter: "-"
                    )).value
                    // Assert bucket content is as expected.
                    let expectedKeys: Set = [
                        "pre-a.txt",
                        "pre-nested-nested2-nested3_1-b.txt",
                        "pre-nested-nested2-nested3_2-c.txt",
                        "pre-nested-nested2-nested3_2-d.txt",
                    ]
                    let actualKeys = Set(try await s3.listObjectsV2(
                        input: ListObjectsV2Input(bucket: bucketWithCustomKeys)
                    ).contents!.map { $0.key })
                    XCTAssertEqual(actualKeys, expectedKeys)
                    bucketSetupWithCustomKeysExpectation.fulfill()
                } catch {
                    fatalError("Failed to setup S3 bucket with custom keys.")
                }
            }
        }

        _ = XCTWaiter().wait(
            for: [bucketSetupWithRegularKeysExpectation, bucketSetupWithCustomKeysExpectation],
            timeout: 60
        )
    }

    // Instance variables that point to same things as static variables.
    // Added for convenience, so you don't have to do UploadObjectIntegTests.tm every time to access static vars.
    var tm: S3TransferManager!
    var s3: S3Client!
    var bucketWithRegularKeys: String!
    var bucketWithCustomKeys: String!

    // The temporary download destination for each test case.
    var temporaryDestinationDirectoryURL: URL!

    override func setUp() async throws {
        tm = Self.tm
        s3 = Self.s3
        bucketWithRegularKeys = Self.bucketWithRegularKeys
        bucketWithCustomKeys = Self.bucketWithCustomKeys

        // Create the temporary destination directory URL, unique to each test case.
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        temporaryDestinationDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(
            "downloadBucketIntegTestTemporaryDestination-" + uuid
        )
        try FileManager.default.createDirectory(
            at: temporaryDestinationDirectoryURL,
            withIntermediateDirectories: false
        )
    }

    override func tearDown() async throws {
        // Delete all files in the temporary destination directory of the test case.
        try FileManager.default.removeItem(at: temporaryDestinationDirectoryURL)
    }

    // MARK: - downloadBucket tests.

    func testDownloadBucket_BucketWithRegularKeys_DefaultSetting() async throws {
        _ = try await tm.downloadBucket(input: DownloadBucketInput(
            bucket: bucketWithRegularKeys,
            destination: temporaryDestinationDirectoryURL
        )).value
        try validateBucketDownload(expectedFileURLs: [
            temporaryDestinationDirectoryURL.appendingPathComponent("a.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("nested/nested2/nested3_1/b.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("nested/nested2/nested3_2/c.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("nested/nested2/nested3_2/d.txt")
        ])
    }

    func testDownloadBucket_BucketWithCustomKeys_MatchingCustomSetting() async throws {
        _ = try await tm.downloadBucket(input: DownloadBucketInput(
            bucket: bucketWithCustomKeys,
            destination: temporaryDestinationDirectoryURL,
            s3Prefix: "pre",
            s3Delimiter: "-"
        )).value
        try validateBucketDownload(expectedFileURLs: [
            // Original file structure is expected since matching operation settings to custom key values
            //  allows preprocessing retrieved key values to original structure.
            temporaryDestinationDirectoryURL.appendingPathComponent("a.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("nested/nested2/nested3_1/b.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("nested/nested2/nested3_2/c.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("nested/nested2/nested3_2/d.txt")
        ])
    }

    func testDownloadBucket_BucketWithCustomKeys_DefaultSetting() async throws {
        _ = try await tm.downloadBucket(input: DownloadBucketInput(
            bucket: bucketWithCustomKeys,
            destination: temporaryDestinationDirectoryURL
        )).value
        try validateBucketDownload(expectedFileURLs: [
            // Flat list of files is expected since we didn't match operation settings to custom key values.
            temporaryDestinationDirectoryURL.appendingPathComponent("pre-a.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("pre-nested-nested2-nested3_1-b.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("pre-nested-nested2-nested3_2-c.txt"),
            temporaryDestinationDirectoryURL.appendingPathComponent("pre-nested-nested2-nested3_2-d.txt")
        ])
    }

    // MARK: - Helper functions.

    // Assert on count of & absolute strings of file URLs.
    private func validateBucketDownload(expectedFileURLs: [URL]) throws {
        let actualFileURLs = try getNestedFileURLs()
        XCTAssertEqual(actualFileURLs.count, expectedFileURLs.count)
        let actualFileURLAbsoluteStrings: Set = Set(actualFileURLs.map {
            // standardizedFileURL method required to turn private/var/ into var/ equivalent.
            $0.standardizedFileURL.absoluteString
        })
        let expectedFileURLAbsoluteStrings: Set = Set(expectedFileURLs.map {
            $0.absoluteString
        })
        XCTAssertEqual(actualFileURLAbsoluteStrings, expectedFileURLAbsoluteStrings)
    }

    // Fetch all file URLs nested under temporary destination directory.
    // Gauranteed to have only regular files and regular directories, so we can just use the built-in enumerator.
    private func getNestedFileURLs() throws -> [URL] {
        var nestedFileURLs: [URL] = []
        let enumerator = FileManager.default.enumerator(
            at: temporaryDestinationDirectoryURL,
            includingPropertiesForKeys: [.isRegularFileKey]
        )
        for case let fileURL as URL in enumerator! {
            let resourceValues = try fileURL.resourceValues(forKeys: [.isRegularFileKey])
            if resourceValues.isRegularFile == true {
                nestedFileURLs.append(fileURL)
            }
        }
        return nestedFileURLs
    }
}
