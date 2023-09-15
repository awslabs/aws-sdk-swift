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
 * 1. Enable IAM Identity Center AWS Organization for the AWS account used for integration test if it hasn't been already.
 * 2. Create a permission set (for S3::listBuckets) in IAM Identity Center.
 * 3. Create a user in IAM Identity Center, and retrieve username, password, and SSO start URL (these are needed for step 4, aws sso configure).
 * 4. Give the created user access to your AWS account with the created permission set.
 * 5. Configure SSO config.
 * 6. Create SSO token using AWS CLI (aws sso login --profile <profile-name-set-during-aws-sso-configure>).
 * 7. Run the test.
 *
 * Only step 1 has to be done manually in the AWS account console you're using to run this integration test.
 */
class SSOCredentialsProviderTests : XCTestCase {
    var client: S3Client!
    var ssoClient: SSOAdminClient!
    
    private var username: String = ""
    private var password: String = ""
    private var startUrl: String = ""
    
    private var iamIdentityCenterInstanceArn: String = ""
    private var permissionSetArn: String = ""
    private var userArn: String = ""
    
        
    override func setUp() async throws {
        // Use default credentials provider chain
        ssoClient = try await SSOClient()
        try await createPermissionSet()
        try await createUser()
        try await giveAccountAccessToUserUsingPermissionSet()
        
        // Use AWS CLI for these
        try await configureSSOConfig()
        try await ssoLoginAndCreateToken()
        
        // This client uses SSO credentials provider to call S3::listBuckets operation
        try await setUpClient()
    }

    // This test calls listBuckets() and forces S3Client to use SSOCredentialsProvider
    func test_listBuckets() async throws {
        _ = try await client.listBuckets(input: ListBucketsInput())
    }
    
    override func tearDown() async throws {
        // No action required.
    }
    
    /* HELPER METHODS */
    private func createPermissionSet() async throws {
        if let response = try await ssoClient.listInstances(input: ListInstancesInput()) as! ListInstancesOutputResponse, response.instances != nil {
            iamIdentityCenterInstanceArn = response.instances
            
        }
        
    }
    
    private func createUser() async throws {
        
    }
    
    private func giveAccountAccessToUserUsingPermissionSet() async throws {
        
    }
    
    private func configureSSOConfig() async throws {
        
    }
    
    private func ssoLoginAndCreateToken() async throws {
        
    }
    
    private func setUpClient() async throws {
        // Setup SSOCredentialsProvider
        let SSOCredentialsProvider = try SSOCredentialsProvider(
            configFilePath: Bundle.module.path(forResource: "sso-config", ofType: nil)!,
            credentialsFilePath: Bundle.module.path(forResource: "sso-credentials", ofType: nil)!
        )

        // Setup S3ClientConfiguration to use SSOCredentialsProvider
        let testConfig = try await S3Client.S3ClientConfiguration()
        testConfig.credentialsProvider = SSOCredentialsProvider

        // Initialize our S3 client with the specified configuration
        client = S3Client(config: testConfig)
    }
}
