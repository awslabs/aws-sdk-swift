//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSS3Control
import AWSSTS
import ClientRuntime
import AWSClientRuntime

/// Tests SigV4A signing flow using S3's Multi-Region Access Point (MRAP).
class S3SigV4ATests: S3XCTestCase {
    // The custom S3 client configured with only SigV4A (w/o SigV4)
    private var sigv4aS3Client: S3Client!
    private var s3Config: S3Client.S3ClientConfiguration!

    // MRAP ARN format
    // arn:aws:s3::account-id:accesspoint/MultiRegionAccessPoint_alias
    private var mrapArnFormat = "arn:aws:s3::%@:accesspoint/%@"
    private var mrapAlias: String!
    private var mrapArn: String!
    private let mrapName = "aws-sdk-s3-integration-test-" + UUID().uuidString.split(separator: "-").first!.lowercased()

    // The S3 control client for creating and deleting MRAP
    private var s3ControlClient: S3ControlClient!
    
    // The STS client for fetching AWS account ID
    private var stsClient: STSClient!
    private var accountId: String!

    override func setUp() async throws {
        // Create a bucket
        try await super.setUp()

        // Create a sigv4a-only S3 client
        s3Config = try await S3Client.S3ClientConfiguration(region: region)
        s3Config.authSchemes = [SigV4AAuthScheme()]
        sigv4aS3Client = S3Client(config: s3Config)

        // Fetch account ID
        stsClient = try STSClient(region: region)
        accountId = try await stsClient.getCallerIdentity(input: GetCallerIdentityInput()).account

        // Construct container with MRAP config values
        let publicAccessBlock = S3ControlClientTypes.PublicAccessBlockConfiguration(
            blockPublicAcls: false,
            blockPublicPolicy: false,
            ignorePublicAcls: false,
            restrictPublicBuckets: false
        )
        let regions = [S3ControlClientTypes.Region(bucket: bucketName, bucketAccountId: accountId)]
        let mrapConfig = S3ControlClientTypes.CreateMultiRegionAccessPointInput(
            name: mrapName,
            publicAccessBlock: publicAccessBlock,
            regions: regions
        )

        // Create a S3 Multi-Region Access Point (MRAP)
        s3ControlClient = try S3ControlClient(region: region)
        let createMRAPInput = CreateMultiRegionAccessPointInput(
            accountId: accountId,
            clientToken: UUID().uuidString.split(separator: "-").first!.lowercased(),
            details: mrapConfig
        )
        _ = try await s3ControlClient.createMultiRegionAccessPoint(input: createMRAPInput).requestTokenARN

        // Wait until MRAP creation finishes
        var status: S3ControlClientTypes.MultiRegionAccessPointStatus? = .creating
        repeat {
            let seconds = 20.0
            try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))

            status = try await s3ControlClient.getMultiRegionAccessPoint(input: GetMultiRegionAccessPointInput(
                accountId: accountId,
                name: mrapName
            )).accessPoint?.status
        } while status == .creating

        // Fetch MRAP alias then format & save MRAP ARN
        mrapAlias = try await s3ControlClient.getMultiRegionAccessPoint(input: GetMultiRegionAccessPointInput(
            accountId: accountId,
            name: mrapName
        )).accessPoint?.alias
        mrapArn = String(format: mrapArnFormat, accountId, mrapAlias)
    }

    override func tearDown() async throws {
        // MRAP must be deleted before deleting the linked bucket
        try await deleteMRAP()
        // Empty & delete the bucket
        try await super.tearDown()
    }

    private func deleteMRAP() async throws {
        // Delete the multi-region access point
        _ = try await s3ControlClient.deleteMultiRegionAccessPoint(input: DeleteMultiRegionAccessPointInput(
            accountId: accountId,
            clientToken: UUID().uuidString.split(separator: "-").first!.lowercased(),
            details: S3ControlClientTypes.DeleteMultiRegionAccessPointInput(name: mrapName)
        )).requestTokenARN

        // Wait until MRAP has been deleted before returning
        var mrapCount: Int? = 1
        repeat {
            let seconds = 20.0
            try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))

            mrapCount = try await s3ControlClient.listMultiRegionAccessPoints(input: ListMultiRegionAccessPointsInput(accountId: accountId)).accessPoints?.count
        } while mrapCount == 1
    }

    func testS3MRAPSigV4A() async throws {
        // Call listObjectsV2 with SigV4A-only S3 client
        let response = try await sigv4aS3Client.listObjectsV2(input: ListObjectsV2Input(bucket: mrapArn))
        // Confirm response was returned
        XCTAssertTrue(response.keyCount == 0)
    }
}
