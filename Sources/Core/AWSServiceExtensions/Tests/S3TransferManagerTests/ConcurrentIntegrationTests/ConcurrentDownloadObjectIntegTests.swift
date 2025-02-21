//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions

class ConcurrentDownloadObjectIntegTests: XCTestCase {
    /*
        In setUp:
            Confirm that all objects exist in the bucket before finishing setUp.
        In test:
            Call downloadObject 100 times in quick succession using a task group.
            Await all results.
            Validate downloads by checking all 100 expected paths contain a file in the temporary download destination directory. Assert on the size of each file as well.
     */

    var tm: S3TransferManager!
    var s3: S3Client!
    var temporary100FilesDirectoryURL: URL!
    var objectData: Data!
    var fileURLs: [Int: URL] = [:]

    let region = "us-west-2"
    let bucketName = "s3tm-concurrent-download-object-integ-test-persistent"
    let fileNamePrefix = "s3tm-concurrent-download-object-integ-test-file-"

    override func setUp() async throws {
        s3 = try S3Client(region: region)
        let tmConfig = try await S3TransferManagerConfig(s3Client: s3)
        tm = S3TransferManager(config: tmConfig)

        // Create the temporary download destination directory.
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        temporary100FilesDirectoryURL = FileManager.default.temporaryDirectory.appending(
            path: "concurrentDownloadObjectIntegTest-\(uuid)"
        )
        try FileManager.default.createDirectory(
            at: temporary100FilesDirectoryURL,
            withIntermediateDirectories: true
        )

        // Create & save URLs for temporary download destination files.
        for fileNum in 1...100 {
            fileURLs[fileNum] = temporary100FilesDirectoryURL.appending(
                path: "\(fileNamePrefix)\(fileNum)"
            )
        }

        // Setup the persistent bucket with hundred 100MB files if bucket doesn't exist.
        do {
            _ = try await s3.headBucket(input: HeadBucketInput(bucket: bucketName))
        } catch {
            _ = try await s3.createBucket(input: CreateBucketInput(
                bucket: bucketName,
                createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                    locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
                )
            ))

            // Create 100MB Data in-memory.
            let patternedByteData = Data([0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22])
            var remainingSize = 100 * 1024 * 1024
            objectData = Data(capacity: remainingSize)
            while remainingSize > 0 {
                objectData.append(patternedByteData)
                remainingSize -= patternedByteData.count
            }

            // Upload the 100MB to the persistent bucket 100 times, using serial number suffix.
            // Uses serial execution of single PutObject's.
            for fileNum in 1...100 {
                _ = try await s3.putObject(input: PutObjectInput(
                    body: .data(objectData),
                    bucket: bucketName,
                    key: "\(fileNamePrefix)\(fileNum)"
                ))
            }

            // Confirm all 100 objects are present in S3 bucket with expected size.
            for fileNum in 1...100 {
                let headObjectOutput = try await s3.headObject(input: HeadObjectInput(
                    bucket: bucketName,
                    key: "\(fileNamePrefix)\(fileNum)"
                ))
                XCTAssertEqual(headObjectOutput.contentLength, 100 * 1024 * 1024) // 100MB.
            }
        }
    }

    override func tearDown() async throws {
        // Delete temporary download destination directory & all downloaded files in it.
        try FileManager.default.removeItem(at: temporary100FilesDirectoryURL)
    }

    func testConcurrentDownloadObjectCalls_100x100MBFiles() async throws {
        // Call downloadObject 100 times on hundred 100MB S3 objects, and wait for all tasks to finish.
        try await withThrowingTaskGroup(of: Void.self) { group in
            for fileNum in 1...100 {
                group.addTask {
                    _ = try await self.tm.downloadObject(input: DownloadObjectInput(
                        outputStream: OutputStream(url: self.fileURLs[fileNum]!, append: true)!,
                        getObjectInput: GetObjectInput(
                            bucket: self.bucketName,
                            key: "\(self.fileNamePrefix)\(fileNum)"
                        )
                    )).value
                }
            }
            try await group.waitForAll()
        }

        // Validate all hundred 100MB files have been downloaded successfully.
        try await validateDownloads()
    }

    // Helper function to validate downloads.
    private func validateDownloads() async throws {
        // Check all 100 expected downloaded files exist.
        for fileNum in 1...100 {
            let fileURL = temporary100FilesDirectoryURL.appending(
                path: "\(fileNamePrefix)\(fileNum)"
            )
            // Assert on existence.
            XCTAssertTrue(
                FileManager.default.fileExists(
                    atPath: fileURL.path()
                )
            )
            // Assert on size.
            XCTAssertEqual(
                try fileURL.resourceValues(forKeys: [.fileSizeKey]).fileSize,
                100 * 1024 * 1024 // 100MB.
            )
        }
    }
}
