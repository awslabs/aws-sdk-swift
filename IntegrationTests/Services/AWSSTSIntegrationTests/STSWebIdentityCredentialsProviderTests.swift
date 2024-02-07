//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSSTS
import AWSIAM
import AWSCognitoIdentity
import ClientRuntime
import AWSClientRuntime
import Foundation

/// Tests STS web identity credentials provider using STS::getCallerIdentity.
class STSWebIdentityCredentialsProviderTests: XCTestCase {
    private let region = "us-west-2"
    private var oidcToken: String!
    // File path for the cached OIDC token.
    private var tokenFilePath: String!

    // STS client with only the STS web identity credentials provider configured.
    private var webIdentityStsClient: STSClient!
    private var stsConfig: STSClient.STSClientConfiguration!

    // Used to create identity pools and fetch cognito ID & OIDC token from it.
    private var cognitoIdentityClient: CognitoIdentityClient!
    // Regular STS client; used to fetch the account ID used in fetching cognito ID.
    private var stsClient: STSClient!
    // Cognito identity pool name & ID
    private let identityPoolName = "aws-sts-integration-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private var identityPoolId: String!

    // Used to create temporary role assumed by STS web identity credentials provider.
    private var iamClient: IAMClient!
    // Role properties
    private let roleName = "aws-sts-integration-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private let roleSessionName = "aws-sts-integration-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private var roleArn: String!

    // JSON assume role policy
    private let assumeRolePolicy = """
        {
          "Version": "2012-10-17",
          "Statement": [
            {
              "Sid": "",
              "Effect": "Allow",
              "Principal": {
                "Federated": "cognito-identity.amazonaws.com"
              },
              "Action": [
                "sts:AssumeRoleWithWebIdentity"
              ],
              "Condition": {
                 "ForAnyValue:StringLike": {
                   "cognito-identity.amazonaws.com:amr": "unauthenticated"
                 }
              }
            }
          ]
        }
    """
    // Identity policy name & JSON identity policy
    private let identityPolicyName = "allow-STS-getCallerIdentity"
    private let roleIdentityPolicy = """
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "",
                    "Effect": "Allow",
                    "Action": "sts:GetCallerIdentity",
                    "Resource": "*"
                }
            ]
        }
    """

    override func setUp() async throws {
        try await super.setUp()

        // Create the role to be assumed in exchange for web identity token
        iamClient = try IAMClient(region: region)
        let role = try await iamClient.createRole(input: CreateRoleInput(
            assumeRolePolicyDocument: assumeRolePolicy,
            roleName: roleName
        ))
        roleArn = role.role?.arn

        // This wait is necessary for role creation to propagate everywhere
        let seconds = 10
        let NSEC_PER_SEC = 1_000_000_000
        try await Task.sleep(nanoseconds: UInt64(seconds * NSEC_PER_SEC))

        // Attach identity policy to role
        _ = try await iamClient.putRolePolicy(input: PutRolePolicyInput(
            policyDocument: roleIdentityPolicy,
            policyName: identityPolicyName,
            roleName: roleName
        ))

        // Create the Cognito identity pool that allows unauthenticated identities
        cognitoIdentityClient = try CognitoIdentityClient(region: region)
        let identityPool = try await cognitoIdentityClient.createIdentityPool(
            input: CreateIdentityPoolInput(
                allowUnauthenticatedIdentities: true,
                identityPoolName: identityPoolName
        ))
        identityPoolId = identityPool.identityPoolId

        // Get Cognito ID from Cognito identity pool
        stsClient = try STSClient(region: region)
        let accountId = try await stsClient.getCallerIdentity(input: GetCallerIdentityInput()).account
        let cognitoId = try await cognitoIdentityClient.getId(input: GetIdInput(
            accountId: accountId, identityPoolId: identityPoolId
        ))

        // Get OIDC token from Cognito identity pool using Cognito ID
        oidcToken  = try await cognitoIdentityClient.getOpenIdToken(
            input: GetOpenIdTokenInput(identityId: cognitoId.identityId)
        ).token
        // Save OIDC token to a file then save filepath
        try saveTokenIntoFile()

        // Construct STS web identity credentials provider
        let webIdentityCredentialsProvider = try STSWebIdentityCredentialsProvider(
            region: region,
            roleArn: roleArn,
            roleSessionName: roleSessionName,
            tokenFilePath: tokenFilePath
        )

        // Construct STS config with STS web identity credentials provider
        stsConfig = try await STSClient.STSClientConfiguration(
            credentialsProvider: webIdentityCredentialsProvider,
            region: region
        )

        // Construct STS client with just the...
        // ...STS web identity credentials provider configured
        webIdentityStsClient = STSClient(config: stsConfig)
    }

    override func tearDown() async throws {
        // Delete inline identity policy of the role
        let policyName = try await iamClient.listRolePolicies(input: ListRolePoliciesInput(roleName: roleName)).policyNames
        _ = try await iamClient.deleteRolePolicy(input: DeleteRolePolicyInput(
            policyName: policyName?[0], roleName: roleName
        ))
        // Delete role
        _ = try await iamClient.deleteRole(input: DeleteRoleInput(roleName: roleName))
        // Delete Cognito identity pool
        _ = try await cognitoIdentityClient.deleteIdentityPool(input: DeleteIdentityPoolInput(identityPoolId: identityPoolId))
        // Delete token file
        try deleteTokenFile()
    }

    // Helper methods for saving & deleting token file
    private func saveTokenIntoFile() throws {
        tokenFilePath = NSHomeDirectory() + "/token.txt"
        let tokenData = oidcToken.data(using: String.Encoding.utf8)
        let fileCreated = FileManager.default.createFile(
            atPath: tokenFilePath, contents: tokenData, attributes: nil
        )
        if !fileCreated {
            throw TokenFileError.TokenFileCreationFailed("Failed to create token text file.")
        }
    }
    private func deleteTokenFile() throws {
        do {
            try FileManager.default.removeItem(atPath: tokenFilePath)
        } catch {
            throw TokenFileError.TokenFileDeletionFailed("Failed to delete token text file.")
        }
    }

    // Confirm STS web identity credentials provider gave valid credentials
    // ...by checking response was returned successfully.
    func testGetCallerIdentity() async throws {
        let response = try await webIdentityStsClient.getCallerIdentity(
            input: GetCallerIdentityInput()
        )

        // Ensure returned caller info aren't nil
        let account = try XCTUnwrap(response.account)
        let userId = try XCTUnwrap(response.userId)
        let arn = try XCTUnwrap(response.arn)

        // Ensure returned caller info aren't empty strings
        XCTAssertNotEqual(account, "")
        XCTAssertNotEqual(userId, "")
        XCTAssertNotEqual(arn, "")
    }
}

enum TokenFileError: Error {
    case TokenFileCreationFailed(String)
    case TokenFileDeletionFailed(String)
}

enum IdentityPoolStatus {
    case INITIALIZING
    case DONE
}
