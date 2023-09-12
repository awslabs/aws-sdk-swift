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
import AWSSSO

/* Prerequisites to run the SSO credentials provider integration test(s):
 *
 * 1. Enable AWS Organization for the AWS account used for integration test if it hasn't been already.
 * 2. Create a permission set (for S3::listBuckets) in IAM Identity Center.
 * 3. Create a user in IAM Identity Center, and retrieve username, password, and SSO start URL (these are needed for step 4, aws sso configure).
 * 4. Give the created user access to your AWS account with the created permission set.
 * 5. Configure SSO config.
 * 6. Create SSO token using AWS CLI (aws sso login --profile <profile-name-set-during-aws-sso-configure>).
 * 7. Run the test.
 *
 * Steps 2, 3, 4 will be taken care of by the test's setUp(), using AWS credentials fetched by default credentials provider chain.
 *
 * In effect, you'll need to:
 *  - Do step 1 manually
 *  - Run the test, and have setUp() handle steps 2, 3, 4 then fail (due to no valid SSO token)
 *  - Do step 5 & 6 manually
 *  - Run the test
 *
 * Only step 6 has to be re-done more than once, as SSO token may have expired before you run the test again.
 */
class SSOCredentialsProviderTests : XCTestCase {
    var client: S3Client!
        
    override func setUp() async throws {
        createPermissionSet()
        let userData = createUser()
        giveAccountAccessToUserUsingPermissionSet()
        
        setUpClient()
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
        
    }
    
    private func createUser() async throws -> SSOUserData {
        
    }
    
    private func giveAccountAccessToUserUsingPermissionSet() {
        
    }
    
    private func configureSSOConfig(userData: SSOUserData) {
        
    }
    
    private func ssoLogin() {
        
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
    
    /* HELPER DATA STRUCT */
    private struct SSOUserData {
        val username: String
        val password: String
        val startUrl: String
    }
}
