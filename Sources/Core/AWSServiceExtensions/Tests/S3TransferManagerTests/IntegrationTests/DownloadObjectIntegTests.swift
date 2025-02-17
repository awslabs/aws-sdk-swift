//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions

class DownloadObjectIntegTests: XCTestCase {
    static var s3: S3Client!
    static let region = "us-west-2"
    static let bucketName = "s3tm-download-object-integ-test-persistent-bucket"
    static var objectData: Data!

    // This setUp runs just once for the test class, before tests start execution.
    // Create a shared S3 test bucket, and upload 100MB with MPU & 100MB w/o MPU.
    // Skipped entirely if bucket already exists.
    override class func setUp() {
        let bucketSetupExpectation = XCTestExpectation(description: "S3 test bucket setup complete")
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

                    // Create 100MB Data in-memory.
                    let patternedByteData = Data([0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22])
                    var remainingSize = 100 * 1024 * 1024
                    objectData = Data(capacity: remainingSize)
                    while remainingSize > 0 {
                        objectData.append(patternedByteData)
                        remainingSize -= patternedByteData.count
                    }

                    // Upload once using MPU with key "MPU-100MB" by using S3TM.
                    _ = try await S3TransferManager(config: S3TransferManagerConfig(s3Client: s3)).uploadObject(input: UploadObjectInput(putObjectInput: PutObjectInput(
                        body: .data(objectData),
                        bucket: bucketName,
                        key: "MPU-100MB"
                    ))).value

                    // Upload second time using single putObject with key "NonMPU-100MB".
                    _ = try await s3.putObject(input: PutObjectInput(
                        body: .data(objectData),
                        bucket: bucketName,
                        key: "NonMPU-100MB"
                    ))

                    bucketSetupExpectation.fulfill()
                } catch {
                    XCTFail("Failed to setup S3 bucket: \(error)")
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

    /*
     TODO: -
     Expected changes to DownloadObject:
         - Add limit on number of child tasks similar to UploadObject using SemaphoreManager, like in UploadObject.
         - Possible memory leak like with readPartData in UploadObject; monitor debugging navigator.
     */

    // MARK: - downloadObject tests for object originally uploaded using MPU.

    // Case 0.
    func testDownloadObject_UploadedWithMPU_SpecificPartGET() {
        
    }

    // Case 1.
    func testDownloadObject_UploadedWithMPU_SpecificRangeGET() {
        
    }

    // Case 2.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithPartNumbers() {
        
    }

    // Case 3A.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithRangeStartAndEnd() {
        
    }

    // Case 3B.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithRangeStart() {
        
    }

    // Case 4.
    func testDownloadObject_UploadedWithMPU_MultipartGET_WithNoRangeGiven() {
        
    }

    // MARK: - downloadObject tests for object originally uploaded without using MPU.

    // Case 0 -  entire object is 1 part; partNumber 1 used for the test.
    func testDownloadObject_UploadedWithPutObject_SinglePartGET() {
        
    }

    // Case 1.
    func testDownloadObject_UploadedWithPutObject_SpecificRangeGET() {
        
    }

    // Case 2 is not applicable. Attempting to retrieve parts with partNumber > 1 results in error.

    // Case 3A.
    func testDownloadObject_UploadedWithPutObject_MultipartGET_WithRangeStartAndEnd() {
        
    }

    // Case 3B.
    func testDownloadObject_UploadedWithPutObject_MultipartGET_WithRangeStart() {
        
    }

    // Case 4.
    func testDownloadObject_UploadedWithPutObject_MultipartGET_WithNoRangeGiven() {
        
    }

}
