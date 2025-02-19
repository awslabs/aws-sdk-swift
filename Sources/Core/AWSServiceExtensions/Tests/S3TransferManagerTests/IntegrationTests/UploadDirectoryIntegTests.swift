//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions

class UploadDirectoryIntegTests: XCTestCase {
    static var tm: S3TransferManager! // The shared transfer manager for tests.
    static var s3: S3Client! // The shared S3 client for tests.
    static let region = "us-west-2"
    // The source directory URL used by tests.
    static let sourceURL = Bundle.module.resourceURL!.appendingPathComponent(
        "Resources/UploadDirectoryTestsResources/source"
    )

    // This setUp runs just once for the test class, before tests start execution.
    // Instantiates shared S3TM and S3 client objects.
    override class func setUp() {
        // Create a shared transfer manager instance.
        let tmSetupExpectation = XCTestExpectation(description: "S3 Transfer Manager setup complete")
        Task {
            do {
                s3 = try S3Client(region: region)
                tm = try await S3TransferManager(config: S3TransferManagerConfig(
                    s3Client: S3Client(region: region)
                ))
                tmSetupExpectation.fulfill()
            } catch {
                fatalError("Failed to set up S3 Transfer Manager: \(error)")
            }
        }
        _ = XCTWaiter().wait(for: [tmSetupExpectation], timeout: 10)
    }

    // Instance variables that point to same things as static variables.
    // Added for convenience, so you don't have to do UploadObjectIntegTests.tm every time to access static vars.
    var tm: S3TransferManager!
    var s3: S3Client!
    var sourceURL: URL!

    // The bucket name used by a given test.
    private let bucketName = "s3tm-upload-directory-integ-test-" + UUID().uuidString.split(
        separator: "-"
    ).first!.lowercased()

    // Create bucket before each test.
    override func setUp() async throws {
        tm = Self.tm
        s3 = Self.s3
        sourceURL = Self.sourceURL
        _ = try await s3.createBucket(input: CreateBucketInput(
            bucket: bucketName,
            createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
            )
        ))
    }

    // Clear out and delete bucket after each test.
    override func tearDown() async throws {
        _ = try await emptyBucket()
        _ = try await deleteBucket(bucketName: bucketName)

        // Helper functions for deleting the bucket.

        func listBucketKeys() async throws -> Set<String> {
            let input = ListObjectsV2Input(bucket: bucketName)
            let output = try await s3.listObjectsV2(input: input)
            return Set(output.contents?.compactMap { $0.key } ?? [])
        }
        func emptyBucket() async throws {
            let keys = try await listBucketKeys()
            for key in keys {
                let deleteInput = DeleteObjectInput(bucket: bucketName, key: key)
                _ = try await s3.deleteObject(input: deleteInput)
            }
        }
        func deleteBucket(bucketName: String) async throws {
            let input = DeleteBucketInput(bucket: bucketName)
            _ = try await s3.deleteBucket(input: input)
        }
    }

    // MARK: - uploadDirectory tests.

    /*
         The following file structure under Resources/UploadDirectoryTestsResources/ is used by the tests below.

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

    func testUploadDirectory() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL
            ),
            expectedObjectKeys: [
                "a.txt"
            ]
        )
    }

    func testUploadDirectory_Recursive() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL,
                recursive: true
            ),
            expectedObjectKeys: [
                "a.txt",
                "nested/b.txt",
                "nested/nested2/d.txt"
            ]
        )
    }

    func testUploadDirectory_FollowSymlink() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL,
                followSymbolicLinks: true
            ),
            expectedObjectKeys: [
                "a.txt",
                "symlinkToFileF"
            ]
        )
    }

    func testUploadDirectory_RecursiveAndFollowSymlink() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL,
                followSymbolicLinks: true,
                recursive: true
            ),
            expectedObjectKeys: [
                "a.txt",
                "nested/b.txt",
                "symlinkToOutsideSourceDir/c.txt",
                "nested/nested2/d.txt",
                "symlinkToOutsideSourceDir/e.txt",
                "symlinkToFileF"
            ]
        )
    }

    func testUploadDirectory_RecursiveAndFollowSymlink_CustomDelimiter() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL,
                followSymbolicLinks: true,
                recursive: true,
                s3Delimiter: "-"
            ),
            expectedObjectKeys: [
                "a.txt",
                "nested-b.txt",
                "symlinkToOutsideSourceDir-c.txt",
                "nested-nested2-d.txt",
                "symlinkToOutsideSourceDir-e.txt",
                "symlinkToFileF"
            ]
        )
    }

    func testUploadDirectory_RecursiveAndFollowSymlink_CustomPrefix() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL,
                followSymbolicLinks: true,
                recursive: true,
                s3Prefix: "pre"
            ),
            expectedObjectKeys: [
                "pre/a.txt",
                "pre/nested/b.txt",
                "pre/symlinkToOutsideSourceDir/c.txt",
                "pre/nested/nested2/d.txt",
                "pre/symlinkToOutsideSourceDir/e.txt",
                "pre/symlinkToFileF"
            ]
        )
    }

    func testUploadDirectory_RecursiveAndFollowSymlink_CustomDelimiterAndPrefix() async throws {
        try await runUploadDirectoryTest(
            input: UploadDirectoryInput(
                bucket: bucketName,
                source: sourceURL,
                followSymbolicLinks: true,
                recursive: true,
                s3Prefix: "pre",
                s3Delimiter: "-"
            ),
            expectedObjectKeys: [
                "pre-a.txt",
                "pre-nested-b.txt",
                "pre-symlinkToOutsideSourceDir-c.txt",
                "pre-nested-nested2-d.txt",
                "pre-symlinkToOutsideSourceDir-e.txt",
                "pre-symlinkToFileF"
            ]
        )
    }

    // MARK: - Helper functions.

    // Helper function for running tests.
    private func runUploadDirectoryTest(
        input: UploadDirectoryInput,
        expectedObjectKeys: Set<String>
    ) async throws {
        // Create task & await to get output.
        let uploadDirectoryTask = try tm.uploadDirectory(input: input)
        let uploadDirectoryOutput = try await uploadDirectoryTask.value
        // Assert on successfully uploaded objects count in the output.
        let expectedNumberOfUploadedObjects = expectedObjectKeys.count
        XCTAssertEqual(uploadDirectoryOutput.objectsUploaded, expectedNumberOfUploadedObjects)
        // Check S3 bucket contents to validate successful upload.
        try await validateDirectoryUpload(expectedObjectKeys: expectedObjectKeys)
    }

    // Confirms successful directory upload by checking object keys present in the bucket.
    private func validateDirectoryUpload(expectedObjectKeys: Set<String>) async throws {
        let listObjectsV2Output = try await s3.listObjectsV2(input: ListObjectsV2Input(bucket: bucketName))
        // Assert number of returned objects is as expected.
        XCTAssertEqual(listObjectsV2Output.keyCount, expectedObjectKeys.count)
        // Assert returned keys match up with expected keys.
        let actualObjectKeys = Set(listObjectsV2Output.contents!.map { $0.key })
        XCTAssertEqual(actualObjectKeys, expectedObjectKeys)
    }
}
