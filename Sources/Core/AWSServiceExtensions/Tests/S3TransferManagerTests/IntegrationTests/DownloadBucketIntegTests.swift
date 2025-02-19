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

    // MARK: - downloadBucket tests.

    /*
         The following file structure under Resources/DownloadBucketIntegTestsResources/ is used by the tests below.

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

    /* FIXME: - TEMPORARY NOTES
        Test steps:
            - Each test case needs its own temporary destination directory.
            - Each test case uses shared TM instance to download bucket to its temp dest dir.
            - Then, each test case can pass expected path strings to validation helper function
                that checks all expected files have been fetched successfully.

        instance tearDown()
            - Delete all files in the temporary dest dir.

        Tests:
            - 1 downloads from regular bucket with default setting; dest should match source structure
            - 1 downloads from custom bucket with the same custom setting; dest should match source structure
            - 1 downloads from custom bucket with default setting; dest should be flat list of files
     */

    func testDownloadBucket_BucketWithRegularKeys_DefaultSetting() async throws {
        // WIP
    }

    func testDownloadBucket_BucketWithCustomKeys_MatchingCustomSetting() async throws {
        // WIP
    }

    func testDownloadBucket_BucketWithCustomKeys_DefaultSetting() async throws {
        // WIP
    }

    // MARK: - Helper functions.

    private func validateBucketDownload(paths: [String]) {
        // WIP
    }
}
