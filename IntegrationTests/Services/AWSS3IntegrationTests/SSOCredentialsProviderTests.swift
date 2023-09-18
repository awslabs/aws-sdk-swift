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
    
    private var iamIdentityCenterInstanceArn: String = ""
    private let permissionSetName = "SSOCredProvIntegTestPermSet"
    private var permissionSetArn: String = ""
    private let awsReadOnlyPolicy = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    
        
    override func setUp() async throws {
        // Use default credentials provider chain for setup
        ssoClient = try await SSOClient()
        try await createPermissionSetIfNeeded()
        
        // Create a S3 client that uses SSO credentials provider
        try await setUpClient()
    }

    // The test calls listBuckets() and forces S3Client to use SSOCredentialsProvider
    func test_listBuckets() async throws {
        _ = try await client.listBuckets(input: ListBucketsInput())
    }
    
    override func tearDown() async throws {
        // No action required.
    }
    
    /* HELPER METHODS */
    private func createPermissionSetIfNeeded() async throws {
        // Get IAM identity center instanceArn
        if let response = try await ssoClient.listInstances(input: ListInstancesInput()) as? ListInstancesOutputResponse {
            iamIdentityCenterInstanceArn = response.instances![0].instanceArn
        }
        
        // Check if permission set for this integ test is already present. Save its arn and return if it already exists.
        let output = try await ssoClient.listPermissionSets(input: ListPermissionSetsInput(instanceArn: iamIdentityCenterInstanceArn)) as? ListPermissionSetsOutputResponse
        guard let output = output, sets = output.permissionSets else {
            throw Error("Failed to retrieve list of pre-existing permission sets from IAM Identity Center.")
        }
        if sets.contains(permissionSetName) {
            // Set permission set instanceArn
            let idx = sets.firstIndex(where: $0 == permissionSetName)
            permissionSetArn = sets[idx]
            return
        }
        
        // Otherwise, create permission set and save its ARN
        if let response = try await ssoClient.createPermissionSet(input: CreatePermissionSetInput(
                description: "Permission set for testing SSO credentials provider.",
                instanceArn: iamIdentityCenterInstanceArn,
                name: permissionSetName
        )) as? CreatePermissionSetOutputResponse {
            permissionSetArn = response.permissionSet!.permissionSetArn!
        }
        
        // Attach ReadOnly AWS-managed policy to the created permission set
        let _ = try await ssoClient.attachManagedPolicyToPermissionSet(input: AttachManagedPolicyToPermissionSetInput(
            instanceArn: iamIdentityCenterInstanceArn,
            managedPolicyArn: awsReadOnlyPolicy,
            permissionSetArn: permissionSetArn))
    }
    
    private func setUpClient() async throws {
        // Setup SSOCredentialsProvider
        let SSOCredentialsProvider = try SSOCredentialsProvider()

        // Setup S3ClientConfiguration to use SSOCredentialsProvider
        let testConfig = try await S3Client.S3ClientConfiguration()
        testConfig.credentialsProvider = SSOCredentialsProvider

        // Initialize our S3 client with the specified configuration
        client = S3Client(config: testConfig)
    }
}
