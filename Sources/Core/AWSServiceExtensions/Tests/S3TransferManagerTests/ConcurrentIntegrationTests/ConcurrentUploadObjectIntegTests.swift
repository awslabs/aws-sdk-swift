//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions
import SmithyStreams

class ConcurrentUploadObjectIntegTests: XCTestCase {
    var tm: S3TransferManager!
    var s3: S3Client!
    var bucketName: String!
    var fileURLs: [Int: URL] = [:]
    var temporaryFilesDirectoryURL: URL!

    let region = "us-west-2"
    let bucketNamePrefix = "s3tm-concurrent-upload-object-integ-test-"
    let fileNamePrefix = "s3tm-concurrent-upload-object-integ-test-file-"

    // Change the two values below to modify test behavior.
    // The test concurrently uploads `numFiles` amount of files, each sized at `fileSize` bytes.
    let fileSize = 100 * 1024 * 1024
    let numFiles = 100

    override func setUp() async throws {
        s3 = try S3Client(region: region)
        tm = try await S3TransferManager(config: S3TransferManagerConfig(s3Client: s3))
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()

        // Create a test S3 bucket to upload the objects to.
        bucketName = bucketNamePrefix + uuid
        _ = try await s3.createBucket(input: CreateBucketInput(
            bucket: bucketName,
            createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
            )
        ))

        // Create temporary directory to store the temporary files.
        temporaryFilesDirectoryURL = FileManager.default.temporaryDirectory.appending(
            path: "concurrentUploadObjectIntegTest-\(uuid)"
        )
        try FileManager.default.createDirectory(
            at: temporaryFilesDirectoryURL,
            withIntermediateDirectories: true
        )

        // Create sparse files in temporary directory.
        for fileNum in 1...numFiles {
            let fileName = "\(fileNamePrefix)\(fileNum).dat"
            let fileURL = temporaryFilesDirectoryURL.appending(path: fileName)

            FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
            guard let fileHandle = try? FileHandle(forWritingTo: fileURL) else {
                XCTFail("Could not create file handle for \(fileName).")
                fatalError()
            }

            // Seek to last byte and write a single 1-byte.
            fileHandle.seek(toFileOffset: UInt64(fileSize - 1))
            fileHandle.write(Data([1]))
            fileHandle.closeFile()

            // Save URL.
            fileURLs[fileNum] = fileURL
        }
    }

    override func tearDown() async throws {
        // Delete the temporary test directory and all generated files in it.
        try FileManager.default.removeItem(at: temporaryFilesDirectoryURL)

        // Clear out and delete the bucket.
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

    func testConcurrentUploadObjectCalls() async throws {
        // Call uploadObject on all generated files, and wait for all tasks to finish.
        try await withThrowingTaskGroup(of: Void.self) { group in
            for fileNum in 1...numFiles {
                group.addTask {
                    _ = try await self.tm.uploadObject(input: UploadObjectInput(putObjectInput: PutObjectInput(
                        body: .stream(FileStream(fileHandle: FileHandle(
                            forReadingFrom: self.fileURLs[fileNum]!
                        ))),
                        bucket: self.bucketName,
                        key: "\(self.fileNamePrefix)\(fileNum).dat"
                    ))).value
                }
            }
            try await group.waitForAll()
        }

        // Validate all files are fully uploaded as expected.
        try await validateUploads()
    }

    // Helper function to validate uploads.
    private func validateUploads() async throws {
        for fileNum in 1...numFiles {
            let fileInfo = try await s3.headObject(input: HeadObjectInput(
                bucket: bucketName,
                key: "\(fileNamePrefix)\(fileNum).dat"
            ))
            let expectedObjectSize = fileSize
            XCTAssertEqual(fileInfo.contentLength, expectedObjectSize)
        }
    }
}
