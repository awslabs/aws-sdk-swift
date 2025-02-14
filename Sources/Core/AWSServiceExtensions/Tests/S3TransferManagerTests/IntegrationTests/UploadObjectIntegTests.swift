//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions
import Smithy
import SmithyStreams

class UploadObjectIntegTests: XCTestCase {
    static var tm: S3TransferManager! // The shared transfer manager for tests.
    static var s3: S3Client! // The shared S3 client for tests.
    static let region = "us-west-2"
    static let bucketName = "s3tm-upload-object-integ-test-" + UUID().uuidString.split(separator: "-").first!.lowercased()

    // This setUp runs just once for the test class, before tests start execution.
    override class func setUp() {
        // Create a shared transfer manager instance.
        let tmSetupExpectation = XCTestExpectation(description: "S3 Transfer Manager setup complete")
        Task {
            do {
                tm = try await S3TransferManager(config: S3TransferManagerConfig(
                    s3Client: S3Client(region: region)
                ))
                tmSetupExpectation.fulfill()
            } catch {
                XCTFail("Failed to set up S3 Transfer Manager: \(error)")
            }
        }

        // Create a shared S3 test bucket.
        let bucketSetupExpectation = XCTestExpectation(description: "S3 test bucket setup complete")
        Task {
            do {
                s3 = try S3Client(region: region)
                _ = try await s3.createBucket(input: CreateBucketInput(
                    bucket: bucketName,
                    createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                        locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
                    )
                ))
                bucketSetupExpectation.fulfill()
            } catch {
                XCTFail("Failed to setup S3 bucket: \(error)")
            }
        }

        _ = XCTWaiter().wait(for: [tmSetupExpectation, bucketSetupExpectation], timeout: 60)
    }

    // This tearDown runs just once for the test class, after all tests finish execution.
    override class func tearDown() {
        // Delete all objects in the bucket & delete the bucket.
        let bucketTearDownExpectation = XCTestExpectation(description: "S3 test bucket teardown complete")
        Task {
            do {
                _ = try await emptyBucket()
                _ = try await deleteBucket(bucketName: bucketName)
            } catch {
                XCTFail("Failed to teardown S3 bucket: \(error)")
            }
        }

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

        _ = XCTWaiter().wait(for: [bucketTearDownExpectation], timeout: 60)
    }

    // Instance variables that point to same things as static variables.
    // Added for convenience, so you don't have to do UploadObjectIntegTests.tm every time to access static vars.
    var tm: S3TransferManager!
    var s3: S3Client!
    var bucketName: String!

    override func setUp() {
        tm = Self.tm
        s3 = Self.s3
        bucketName = Self.bucketName
    }

    // MARK: - uploadObject tests with files (FileStream payload).

    /*
        - Object size <= single part size (8MB default)
            - 4MB
            - 8MB
        - single part size (8MB default) < Object size < MPU threshold (16MB default)
            - 12MB
        - Object size >= MPU threshold (16MB default)
            - 16 MB
            - 50 MB
            - 100 MB
            - 500 MB
            - 5 GB
            - 50 GB
            - 1 TB
            - 5 TB

        Size <= 50MB will upload file, then donwload object, and verify actual data contents.
        Size > 50MB will upload file, get uploaded object size using headObject, and verify uploaded object size.
     */

    func testUploadObject4MBFile() async throws {
        try await runPatternedDataFileTest(withSize: .mb4)
    }

    func testUploadObject8MBFile() async throws {
        try await runPatternedDataFileTest(withSize: .mb8)
    }

    func testUploadObject12MBFile() async throws {
        try await runPatternedDataFileTest(withSize: .mb12)
    }

    func testUploadObject16MBFile() async throws {
        try await runPatternedDataFileTest(withSize: .mb16)
    }

    func testUploadObject50MBFile() async throws {
        try await runPatternedDataFileTest(withSize: .mb50)
    }

    func testUploadObject100MBFile() async throws {
        try await runSparseDataFileTest(withSize: .mb100)
    }

    func testUploadObject500MBFile() async throws {
        try await runSparseDataFileTest(withSize: .mb500)
    }

    func testUploadObject5GBFile() async throws {
        try skip5GBAndUpIfNotConfiguredToRun()
        try await runSparseDataFileTest(withSize: .gb5)
    }

    func testUploadObject50GBFile() async throws {
        try skip5GBAndUpIfNotConfiguredToRun()
        try await runSparseDataFileTest(withSize: .gb50)
    }

    func testUploadObject1TBFile() async throws {
        try skip5GBAndUpIfNotConfiguredToRun()
        try await runSparseDataFileTest(withSize: .tb1)
    }

    func testUploadObject5TBFile() async throws {
        try skip5GBAndUpIfNotConfiguredToRun()
        try await runSparseDataFileTest(withSize: .tb5)
    }

    // MARK: - uploadObject tests with in-memory Data (Data payload)

    /*
         - Object size <= single part size (8MB default)
             - 4MB
             - 8MB
         - single part size (8MB default) < Object size < MPU threshold (16MB default)
             - 12MB
         - Object size >= MPU threshold (16MB default)
             - 16 MB
             - 50 MB

        No large upload tests bc these tests us in-memory Data payload.
        All tests upload data, then donwload object, and verify actual data contents.
     */

    func testUploadObjectWith4MBInMemoryData() async throws {
        try await runPatternedInMemoryDataTest(withSize: .mb4)
    }

    func testUploadObjectWith8MBInMemoryData() async throws {
        try await runPatternedInMemoryDataTest(withSize: .mb8)
    }

    func testUploadObjectWith12MBInMemoryData() async throws {
        try await runPatternedInMemoryDataTest(withSize: .mb12)
    }

    func testUploadObjectWith16MBInMemoryData() async throws {
        try await runPatternedInMemoryDataTest(withSize: .mb16)
    }

    func testUploadObjectWith50MBInMemoryData() async throws {
        try await runPatternedInMemoryDataTest(withSize: .mb50)
    }

    // MARK: - Helper functions for tests.

    /*
        Generates patterned data file for sizes <= 50MB.
        Generates sparse data file for sizes > 50MB.
     */
    private func createTestFile(size: TestFileSize) -> URL {
        if size.shouldUsePatternedData {
            return createPatternedDataTestFile(size: size)
        } else {
            return createSparseTestFile(size: size)
        }
    }

    // 8-byte patterned data, used for creating & validating patterned data files.
    let dataPattern: [UInt8] = [0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22]

    // Used to generate pattnered in-memory data.
    private func createPatternedInMemoryData(size: TestFileSize) -> Data {
        let patterned8ByteData = Data(dataPattern)
        var remainingSize = size.bytes
        var inMemoryData = Data(capacity: size.bytes)

        while remainingSize > 0 {
            inMemoryData.append(patterned8ByteData)
            remainingSize -= patterned8ByteData.count
        }

        return inMemoryData
    }

    // Used to generate patterned data file.
    private func createPatternedDataTestFile(size: TestFileSize) -> URL {
        let fileName = size.fileName
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)

        FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        guard let fileHandle = try? FileHandle(forWritingTo: fileURL) else {
            XCTFail("Could not create file handle for \(fileName).")
            fatalError()
        }

        let patterned8ByteData = Data(dataPattern)
        let mbSize = 1024 * 1024 // 1MB.
        var remainingSize = size.bytes

        // Write 1MB to file until we reach desired size.
        while remainingSize > 0 {
            var mb1Chunk = Data()
            // Write 8 patterned bytes to temporary chunk until it's 1 MB in size.
            while mb1Chunk.count < mbSize {
                mb1Chunk.append(patterned8ByteData)
            }
            // Write 1MB to file & update remaining size.
            fileHandle.write(mb1Chunk)
            remainingSize -= mbSize
        }

        fileHandle.closeFile()
        return fileURL
    }

    // Used to generate sparse data file.
    // Writing a single 1-byte at the end of desired length makes file have desired size very efficiently.
    // All bytes that come before the 1-byte at the end becomes 0-bytes.
    private func createSparseTestFile(size: TestFileSize) -> URL {
        let fileName = size.fileName
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)

        FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        guard let fileHandle = try? FileHandle(forWritingTo: fileURL) else {
            XCTFail("Could not create file handle for \(fileName).")
            fatalError()
        }

        // Seek to size - 1 and write a single 1-byte
        fileHandle.seek(toFileOffset: UInt64(size.bytes) - 1)
        fileHandle.write(Data([1]))
        fileHandle.closeFile()

        return fileURL
    }

    // Validates uploaded object contents using getObject.
    private func validatePatternResponse(in output: GetObjectOutput, size: TestFileSize) async throws -> Bool {
        guard size.shouldUsePatternedData else { return true } // Skip verification for sparse files.

        let body = try await output.body?.readData()!

        let patterned8ByteData = Data(dataPattern)
        let mbSize = 1024 * 1024 // 1MB.
        var remainingSize = size.bytes

        // Build expected data using same logic used to create payload for uplaod.
        var expectedBody = Data()
        while remainingSize > 0 {
            var mb1Chunk = Data()
            while mb1Chunk.count < mbSize {
                mb1Chunk.append(patterned8ByteData)
            }
            expectedBody.append(mb1Chunk)
            remainingSize -= mbSize
        }

        return body == expectedBody
    }

    // Validates sparse data file upload by checking its size using headObject.
    private func validateUploadedObject(size: TestFileSize) async throws -> Bool {
        let objectSize = try await s3.headObject(input: HeadObjectInput(
            bucket: bucketName,
            key: size.s3ObjectKey + "-from-file"
        )).contentLength!
        return objectSize == size.bytes
    }

    private func deleteTestFile(at url: URL) {
        try? FileManager.default.removeItem(at: url)
    }

    // Test runner for in-memory data payload.
    private func runPatternedInMemoryDataTest(withSize size: TestFileSize) async throws {
        try await runUploadObjectWithInMemoryData(withSize: size)

        // GetObject on the object.
        let getObjectOutput = try await s3.getObject(input: GetObjectInput(
            bucket: bucketName,
            key: size.s3ObjectKey + "-from-in-memory-data"
        ))

        // Validate fetched body.
        let validated = try await validatePatternResponse(in: getObjectOutput, size: size)
        XCTAssertTrue(validated)
    }

    // Test runner for file payload with patterned data.
    private func runPatternedDataFileTest(withSize size: TestFileSize) async throws {
        try await runUploadObjectWithFile(withSize: size)

        // GetObject on the object.
        let getObjectOutput = try await s3.getObject(input: GetObjectInput(
            bucket: bucketName,
            key: size.s3ObjectKey + "-from-file"
        ))

        // Validate fetched body.
        let validated = try await validatePatternResponse(in: getObjectOutput, size: size)
        XCTAssertTrue(validated)
    }

    // Test runner for file payload with sparse data.
    private func runSparseDataFileTest(withSize size: TestFileSize) async throws {
        try await runUploadObjectWithFile(withSize: size)

        // Verify uploaded object has expected size.
        let validated = try await validateUploadedObject(size: size)
        XCTAssertTrue(validated)
    }

    private func runUploadObjectWithInMemoryData(withSize size: TestFileSize) async throws {
        // Create patterned in-memory data to upload.
        let inMemoryData = createPatternedInMemoryData(size: size)

        // UploadObject with data that was just created.
        let uploadObjectTask = try tm.uploadObject(input: UploadObjectInput(
            putObjectInput: PutObjectInput(
                body: ByteStream.data(inMemoryData),
                bucket: bucketName,
                key: size.s3ObjectKey + "-from-in-memory-data"
            )
        ))
        _ = try await uploadObjectTask.value
    }

    private func runUploadObjectWithFile(withSize size: TestFileSize) async throws {
        // Create file and get its URL.
        let testFileURL = createTestFile(size: size)

        // Delete the local file before returning.
        defer { deleteTestFile(at: testFileURL) }

        // UploadObject with file that was just created.
        let uploadObjectTask = try tm.uploadObject(input: UploadObjectInput(
            putObjectInput: PutObjectInput(
                body: ByteStream.stream(FileStream(fileHandle: FileHandle(forReadingFrom: testFileURL))),
                bucket: bucketName,
                key: size.s3ObjectKey + "-from-file"
            )
        ))
        _ = try await uploadObjectTask.value
    }

    private func skip5GBAndUpIfNotConfiguredToRun() throws {
        guard ProcessInfo.processInfo.environment["RUN_LARGE_S3TM_UPLOAD_OBJECT_TESTS"] == "YES" else {
            // Creates a "skip" result, not a failure.
            throw XCTSkip(
                "Skipping large upload (>= 5GB) test. Set RUN_LARGE_S3TM_UPLOAD_OBJECT_TESTS env var to \"YES\" to run."
            )
        }
    }
}

private enum TestFileSize {
    case mb4, mb8, mb12, mb16, mb50, mb100, mb500, gb5, gb50, tb1, tb5

    var bytes: Int {
        switch self {
            case .mb4: return 4 * 1024 * 1024
            case .mb8: return 8 * 1024 * 1024
            case .mb12: return 12 * 1024 * 1024
            case .mb16: return 16 * 1024 * 1024
            case .mb50: return 50 * 1024 * 1024
            case .mb100: return 100 * 1024 * 1024
            case .mb500: return 500 * 1024 * 1024
            case .gb5: return 5 * 1024 * 1024 * 1024
            case .gb50: return 50 * 1024 * 1024 * 1024
            case .tb1: return 1024 * 1024 * 1024 * 1024
            case .tb5: return 5 * 1024 * 1024 * 1024 * 1024
        }
    }

    var shouldUsePatternedData: Bool {
        switch self {
            case .mb4, .mb8, .mb12, .mb16, .mb50: return true
            default: return false
        }
    }

    var description: String {
        switch self {
            case .mb4: return "4MB"
            case .mb8: return "8MB"
            case .mb12: return "12MB"
            case .mb16: return "16MB"
            case .mb50: return "50MB"
            case .mb100: return "100MB"
            case .mb500: return "500MB"
            case .gb5: return "5GB"
            case .gb50: return "50GB"
            case .tb1: return "1TB"
            case .tb5: return "5TB"
        }
    }

    var s3ObjectKey: String {
        return self.description
    }

    var fileName: String {
        return "test_file_\(self.description).dat"
    }
}
