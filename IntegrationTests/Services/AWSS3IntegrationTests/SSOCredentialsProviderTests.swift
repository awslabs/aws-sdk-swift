//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import AWSS3
import AWSClientRuntime
import AWSSSOAdmin

/* Prerequisites to run the SSO credentials provider integration test(s):
 *
 * [Manual]
 * 1. Enable IAM Identity Center AWS Organization for the AWS account used to run integration test if it hasn't been already.
 *
 * [Automatic]
 * 2. Create a read-only permission set in IAM Identity Center called "SSOCredProvIntegTestPermSet".
 *
 * [Manual]
 * 3. Create a user in IAM Identity Center.
 * 4. Give the created user access to your AWS account with the created permission set.
 * 5. Retrieve username, password, and SSO start URL of the IAM Identity Store user. Configure SSO config using these values (aws sso configure).
 * 6. Create SSO token using AWS CLI (aws sso login --profile <profile-name-set-during-aws-sso-configure>).
 * 7. Run the test.
 *
 * Note: Enabling AWS organization and creating IAM identity store have no exposed API as of 9/17/2023 for programmatic activation / creation.
 *
 * Step 1, 3, 4, 5 have to be done only once per account.
 */
class SSOCredentialsProviderTests : XCTestCase {
    var client: S3Client!
    var ssoClient: SSOAdminClient!
    // Change this region string to the region where AWS SSO instance is in.
    let region = "us-west-2"
    
    private var iamIdentityCenterInstanceArn: String = ""
    private let permissionSetName = "SSOCredProvIntegTestPermSet"
    private var permissionSetArn: String = ""
    private let awsReadOnlyPolicy = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    
        
    override func setUp() async throws {
        try await super.setUp()
        // Use default credentials provider chain for setup
        ssoClient = try SSOAdminClient(region: "us-west-2")
        try await createPermissionSetIfNeeded()
        
        // Create a S3 client that uses SSO credentials provider
        try await setUpClient()
    }

    // The test calls listBuckets() and forces S3Client to use SSOCredentialsProvider
    func test_listBuckets() async throws {
        _ = try await client.listBuckets(input: ListBucketsInput())
    }
    
    /* HELPER METHODS */
    private func createPermissionSetIfNeeded() async throws {
        // Get IAM identity center instanceArn
        let listInstancesOutput = try await ssoClient.listInstances(input: ListInstancesInput())
        iamIdentityCenterInstanceArn = listInstancesOutput.instances![0].instanceArn!
        
        do {
            // Create permission set and save its ARN
            let createPermissionSetOutput = try await ssoClient.createPermissionSet(input: CreatePermissionSetInput(
                description: "Permission set for testing SSO credentials provider.",
                instanceArn: iamIdentityCenterInstanceArn,
                name: permissionSetName
            ))
            permissionSetArn = createPermissionSetOutput.permissionSet!.permissionSetArn!
            
            
            // Attach ReadOnly AWS-managed policy to the created permission set
            let _ = try await ssoClient.attachManagedPolicyToPermissionSet(input: AttachManagedPolicyToPermissionSetInput(
                instanceArn: iamIdentityCenterInstanceArn,
                managedPolicyArn: awsReadOnlyPolicy,
                permissionSetArn: permissionSetArn))
        } catch let error as AWSSSOAdmin.ConflictException {
            if let message = error.message, message.contains("\(permissionSetName) already exists") {
                return
            } else {
                throw error
            }
        }
    }
    
    private func setUpClient() async throws {
        // Setup SSOCredentialsProvider
        let SSOCredentialsProvider = try SSOCredentialsProvider()

        // Setup S3ClientConfiguration to use SSOCredentialsProvider
        let testConfig = try await S3Client.S3ClientConfiguration()
        testConfig.credentialsProvider = SSOCredentialsProvider
        testConfig.region = region

        // Initialize our S3 client with the specified configuration
        client = S3Client(config: testConfig)
    }
}
