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

// Set "RUN_LARGE_S3TM_DOWNLOAD_OBJECT_TESTS" environment variable to "YES" to run > 100MB tests.
class DownloadObjectIntegTests: XCTestCase {
    static var s3: S3Client!
    static let region = "us-west-2"
    static let bucketName = "s3tm-download-object-integ-test-persistent-bucket"
    static let mpuObjectKey = "MPU-100MB"
    static let nonMPUObjectKey = "NonMPU-100MB"
    static var objectData: Data!

    // This setUp runs just once for the test class, before tests start execution.
    // Create a shared S3 test bucket, and upload 100MB with MPU & 100MB w/o MPU.
    // Skipped entirely if bucket already exists.
    override class func setUp() {
        let bucketSetupExpectation = XCTestExpectation(description: "S3 test bucket setup complete")
        // Create 100MB Data in-memory.
        let patternedByteData = Data([0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22])
        var remainingSize = 100 * 1024 * 1024
        objectData = Data(capacity: remainingSize)
        while remainingSize > 0 {
            objectData.append(patternedByteData)
            remainingSize -= patternedByteData.count
        }

        Task {
            s3 = try S3Client(region: region)
            do {
                _ = try await s3.headBucket(input: HeadBucketInput(bucket: bucketName))
                bucketSetupExpectation.fulfill() // Skip if bucket exists (headBucket didn't throw error).
                return
            } catch {
                do {
                    // If headBucket threw error; it means bucket doesnt' exist; create bucket & upload objects.
                    _ = try await s3.createBucket(input: CreateBucketInput(
                        bucket: bucketName,
                        createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                            locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
                        )
                    ))

                    // Upload once using MPU with key "MPU-100MB" by using S3TM.
                    _ = try await S3TransferManager(config: S3TransferManagerConfig(s3Client: s3)).uploadObject(input: UploadObjectInput(putObjectInput: PutObjectInput(
                        body: .data(objectData),
                        bucket: bucketName,
                        key: mpuObjectKey
                    ))).value

                    // Upload second time using single putObject with key "NonMPU-100MB".
                    _ = try await s3.putObject(input: PutObjectInput(
                        body: .data(objectData),
                        bucket: bucketName,
                        key: nonMPUObjectKey
                    ))

                    bucketSetupExpectation.fulfill()
                } catch {
                    fatalError("Failed to setup S3 bucket: \(error)")
                }
            }
        }

        _ = XCTWaiter().wait(for: [bucketSetupExpectation], timeout: 120)
    }

    // Instance variables that point to same things as static variables.
    // Added for convenience, so you don't have to do DownloadObjectIntegTests.s3 every time to access static vars.
    var s3: S3Client!
    var bucketName: String!
    var objectData: Data!
    let mpuObjectKey = "MPU-100MB"
    let nonMPUObjectKey = "NonMPU-100MB"

    override func setUp() {
        s3 = Self.s3
        bucketName = Self.bucketName
        objectData = Self.objectData
    }

    /*
        Test all relevant cases below using the `MPU-100MB` and `NonMPU-100MB` objects:

        - Case 0: Specific part number was given. Do a single part GET.
        - Case 1: Config is part GET with range given. Fallback to single range GET.
        - Case 2: Config is part GET with no range given. Do a multipart GET with MPU parts.
        - Case 3: Config is range GET with range given.
            - Case 3A: Provided range is in "bytes=<start>-<end>" format.
            - Case 3B: Provided range is in "bytes=<start>-" format.
        - Case 4: Config is range GET with no range given. Get the entire object (0 - end of entire object) concurrently.

        After download is complete, assert that returned data matches expected data.

        Note: Objects uploaded with a single PutObject has only 1 part, and using `partNumber` 1 with getObject behaves the same as if retrieving the entire object without specifying the `partNumber` in the input.
     */

    // MARK: - downloadObject tests for object originally uploaded using MPU.

    // Case 0.
    func testDownloadObject_UploadedWithMPU_SinglePartGET() async throws {
        try await runTest(
            withDownloadType: .part,
            withPartNumber: 14,
            withKey: mpuObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithMPU_SinglePartGET",
            objectDataStart: 104_000_000, // 13 parts * 8 MB part size.
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // Case 1.
    func testDownloadObject_UploadedWithMPU_SingleRangeGET() async throws {
        try await runTest(
            withDownloadType: .part,
            withRange: "bytes=10000000-40000000",
            withKey: mpuObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithMPU_SingleRangeGET",
            objectDataStart: 10_000_000,
            objectDataEnd: 40_000_000
        )
    }

    // Case 2.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithPartNumbers() async throws {
        try await runTest(
            withDownloadType: .part,
            withKey: mpuObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithMPU_MultipartGET_WithPartNumbers",
            objectDataStart: 0,
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // Case 3A.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithRangeStartAndEnd() async throws {
        try await runTest(
            withDownloadType: .range,
            withRange: "bytes=10000000-40000000",
            withKey: mpuObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithMPU_MultipartGET_WithRangeStartAndEnd",
            objectDataStart: 10_000_000,
            objectDataEnd: 40_000_000
        )
    }

    // Case 3B.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithRangeStart() async throws {
        try await runTest(
            withDownloadType: .range,
            withRange: "bytes=70000000-",
            withKey: mpuObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithMPU_MultipartGET_WithRangeStart",
            objectDataStart: 70_000_000,
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // Case 4.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithNoRangeGiven() async throws {
        try await runTest(
            withDownloadType: .range,
            withKey: mpuObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithMPU_MultipartGET_WithNoRangeGiven",
            objectDataStart: 0,
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // MARK: - downloadObject tests for object originally uploaded without using MPU.

    // Case 0 -  entire object is 1 part; partNumber 1 used for the test.
    func testDownloadObject_UploadedWithPutObject_SinglePartGET() async throws {
        try await runTest(
            withDownloadType: .part,
            withPartNumber: 1,
            withKey: nonMPUObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithPutObject_SinglePartGET",
            objectDataStart: 0,
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // Case 1.
    func testDownloadObject_UploadedWithPutObject_SingleRangeGET() async throws {
        try await runTest(
            withDownloadType: .part,
            withRange: "bytes=10000000-40000000",
            withKey: nonMPUObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithPutObject_SingleRangeGET",
            objectDataStart: 10_000_000,
            objectDataEnd: 40_000_000
        )
    }

    /* Case 2 is not applicable. Attempting to retrieve parts with partNumber > 1 results in error. */

    // Case 3A.
    func testDownloadObject_UploadedWithPutObject_MultipartGET_WithRangeStartAndEnd() async throws {
        try await runTest(
            withDownloadType: .range,
            withRange: "bytes=10000000-40000000",
            withKey: nonMPUObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithPutObject_MultipartGET_WithRangeStartAndEnd",
            objectDataStart: 10_000_000,
            objectDataEnd: 40_000_000
        )
    }

    // Case 3B.
    func testDownloadObject_UploadedWithPutObject_MultipartGET_WithRangeStart() async throws {
        try await runTest(
            withDownloadType: .range,
            withRange: "bytes=70000000-",
            withKey: nonMPUObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithPutObject_MultipartGET_WithRangeStart",
            objectDataStart: 70_000_000,
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // Case 4.
    func testDownloadObject_UploadedWithPutObject_MultipartGET_WithNoRangeGiven() async throws {
        try await runTest(
            withDownloadType: .range,
            withKey: nonMPUObjectKey,
            withFileNamePrefix: "testDownloadObject_UploadedWithPutObject_MultipartGET_WithNoRangeGiven",
            objectDataStart: 0,
            objectDataEnd: 100 * 1024 * 1024 - 1
        )
    }

    // MARK: - Large download object tests.

    func testDownloadObject_5GB_WithPartNumbers() async throws {
        try await runLargeDownloadObjectTest(testFileSize: .gb5, downloadType: .part)
    }

    func testDownloadObject_15GB_WithPartNumbers() async throws {
        try await runLargeDownloadObjectTest(testFileSize: .gb15, downloadType: .part)
    }

    func testDownloadObject_5GB_WithRange() async throws {
        try await runLargeDownloadObjectTest(testFileSize: .gb5, downloadType: .range)
    }

    func testDownloadObject_15GB_WithRange() async throws {
        try await runLargeDownloadObjectTest(testFileSize: .gb15, downloadType: .range)
    }

    // MARK: - Helper functions for 100MB tests.

    private func runTest(
        withDownloadType downloadType: MultipartDownloadType,
        withPartNumber partNumber: Int? = nil,
        withRange range: String? = nil,
        withKey key: String,
        withFileNamePrefix fileNamePrefix: String,
        objectDataStart: Int,
        objectDataEnd: Int
    ) async throws {
        // Create an outputstream with provided file name prefix in the temp directory.
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        let fileName = "\(fileNamePrefix)_\(uuid)"
        let fileURL = FileManager.default.temporaryDirectory.appending(path: fileName)
        let outputStream = OutputStream(url: fileURL, append: true)!

        // Call runDownloadObject with appropriate arugments
        try await runDownloadObject(
            withDownloadType: downloadType,
            withPartNumber: partNumber,
            withRange: range,
            withKey: key,
            withOutputStream: outputStream
        )

        // Call validateDownloadedDataAndDeleteFile with appropriate arguments
        try await validateDownloadedDataAndDeleteFile(
            fileURL: fileURL,
            objectDataStart: objectDataStart,
            objectDataEnd: objectDataEnd
        )
    }

    // Creates S3 Transfer Manager & calls DownloadObject with provided arguments.
    // At the moment of return, all retrieved data is written to the provided `OutputStream`.
    private func runDownloadObject(
        withDownloadType downloadType: MultipartDownloadType,
        withPartNumber partNumber: Int?,
        withRange range: String?,
        withKey key: String,
        withOutputStream outputStream: OutputStream
    ) async throws {
        let s3tmConfig = try await S3TransferManagerConfig(s3Client: s3, multipartDownloadType: downloadType)
        let s3tm = S3TransferManager(config: s3tmConfig)
        let getObjectInput = GetObjectInput(
            bucket: bucketName,
            key: key,
            partNumber: partNumber,
            range: range
        )
        let downloadObjectInput = DownloadObjectInput(outputStream: outputStream, getObjectInput: getObjectInput)
        _ = try await s3tm.downloadObject(input: downloadObjectInput).value
    }

    // Validates data downloaded in the provided file against specific portion of objectData.
    private func validateDownloadedDataAndDeleteFile(
        fileURL: URL,
        objectDataStart: Int,
        objectDataEnd: Int
    ) async throws {
        let fileHandle = try FileHandle(forReadingFrom: fileURL)
        let actualData = try fileHandle.readToEnd()
        let expectedData = objectData[objectDataStart...objectDataEnd]
        XCTAssertEqual(actualData, expectedData)
        try fileHandle.close()
        try FileManager.default.removeItem(at: fileURL)
    }

    // MARK: - Helper functions for > 100MB tests.

    private func runLargeDownloadObjectTest(
        testFileSize: LargeDownloadObjectTestFileSize,
        downloadType: MultipartDownloadType
    ) async throws {
        try skip5GBAndUpIfNotConfiguredToRun()
        let key = testFileSize.s3ObjectKey
        let fileSize = testFileSize.bytes
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()

        // Create and upload file to the persistent test bucket if it's not present.
        try await createAndUploadLargeObjectIfMissing(sourceFileName: "source-\(uuid)", key: key, numBytes: fileSize)

        // Create S3TM instance to use for test.
        let s3tmConfig = try await S3TransferManagerConfig(s3Client: s3, multipartDownloadType: downloadType)
        let s3tm = S3TransferManager(config: s3tmConfig)

        // Create DownloadObject input with an empty destination file.
        let destinationFileURL = FileManager.default.temporaryDirectory.appending(path: "destination-\(uuid)")
        let outputStream = OutputStream(url: destinationFileURL, append: true)!
        let getObjectInput = GetObjectInput(bucket: bucketName, key: key)

        // Call S3TM::DownloadObject & assert on witten file size.
        _ = try await s3tm.downloadObject(input: DownloadObjectInput(
            outputStream: outputStream,
            getObjectInput: getObjectInput
        )).value
        let destinationFileHandle = try FileHandle(forReadingFrom: destinationFileURL)
        let actualFileLength = try destinationFileHandle.length()
        let expectedFileLength = fileSize
        XCTAssertEqual(Int(actualFileLength), expectedFileLength)
        try FileManager.default.removeItem(at: destinationFileURL)
    }

    private func skip5GBAndUpIfNotConfiguredToRun() throws {
        guard ProcessInfo.processInfo.environment["RUN_LARGE_S3TM_DOWNLOAD_OBJECT_TESTS"] == "YES" else {
            // Creates a "skip" result, not a failure.
            throw XCTSkip(
                "Skipping large download (>= 5GB) test. Set RUN_LARGE_S3TM_DOWNLOAD_OBJECT_TESTS env var to \"YES\" to run."
            )
        }
    }

    private func createAndUploadLargeObjectIfMissing(sourceFileName: String, key: String, numBytes: Int) async throws {
        do {
            _ = try await s3.headObject(input: HeadObjectInput(bucket: bucketName, key: key))
            // No-op; object already exists.
        } catch {
            // Object doesn't exist; generate file with specified size & upload it to bucket using S3TM.
            let fileURL = try generateLargePatternedDataFile(sourceFileName: sourceFileName, numBytes: numBytes)
            let s3tmConfig = try await S3TransferManagerConfig(s3Client: s3)
            let s3tm = S3TransferManager(config: s3tmConfig)
            _ = try await s3tm.uploadObject(input: UploadObjectInput(putObjectInput: PutObjectInput(
                body: .stream(FileStream(fileHandle: FileHandle(forUpdating: fileURL))),
                bucket: bucketName,
                key: key
            ))).value
            // Delete the temporarily created local file now that upload is complete.
            try FileManager.default.removeItem(at: fileURL)
        }
    }

    private func generateLargePatternedDataFile(sourceFileName: String, numBytes: Int) throws -> URL {
        let fileName = sourceFileName
        let patternedData = Data([0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22])
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
        FileManager.default.createFile(atPath: fileURL.path, contents: nil)
        let fileHandle = try FileHandle(forUpdating: fileURL)

        let mbSize = 1024 * 1024 // 1MB.
        var remainingSize = numBytes

        // Write 1MB to file until we reach desired size.
        while remainingSize > 0 {
            var mb1Chunk = Data()
            // Write 8 patterned bytes to temporary chunk until it's 1 MB in size.
            while mb1Chunk.count < mbSize {
                mb1Chunk.append(patternedData)
            }
            // Write 1MB to file & update remaining size.
            fileHandle.write(mb1Chunk)
            remainingSize -= mbSize
        }

        fileHandle.closeFile()
        return fileURL
    }
}

private enum LargeDownloadObjectTestFileSize {
    case gb5, gb15

    var bytes: Int {
        switch self {
            case .gb5: return 5 * 1024 * 1024 * 1024
            case .gb15: return 15 * 1024 * 1024 * 1024
        }
    }

    var s3ObjectKey: String {
        switch self {
            case .gb5: return "MPU-5GB"
            case .gb15: return "MPU-15GB"
        }
    }
}
