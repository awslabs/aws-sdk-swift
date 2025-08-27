//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSCognitoIdentity
import AWSIAM
import AWSSDKIdentity
import AWSSTS
import ClientRuntime
import SmithyWaitersAPI
import XCTest

/// Tests CognitoAWSCredentialIdentityResolver using STS::getCallerIdentity.
class CognitoAWSCredentialIdentityResolverTests: XCTestCase {
    private let region = "us-west-2"

    private var cognitoIdentityClient: CognitoIdentityClient!
    private var iamClient: IAMClient!
    private let identityPoolName = "aws-cognito-integration-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private var identityPoolId: String!
    private var roleName: String!

    override func setUp() async throws {
        try await super.setUp()

        // CognitoIdentity client for creating & deleting identity pool
        cognitoIdentityClient = try CognitoIdentityClient(region: region)
        iamClient = try IAMClient(region: "us-east-1")

        // Create identity pool that allows unauthenticated identities
        identityPoolId = try await cognitoIdentityClient.createIdentityPool(
            input: CreateIdentityPoolInput(
                allowUnauthenticatedIdentities: true,
                identityPoolName: identityPoolName
            )
        ).identityPoolId
        // Create an IAM role for unauthenticated users
        roleName = "CognitoUnauth_\(identityPoolName)"
        let trustPolicy = """
        {
            "Version": "2012-10-17",
            "Statement": [{
                "Effect": "Allow",
                "Principal": {"Federated": "cognito-identity.amazonaws.com"},
                "Action": "sts:AssumeRoleWithWebIdentity",
                "Condition": {
                    "StringEquals": {"cognito-identity.amazonaws.com:aud": "\(identityPoolId!)"},
                    "ForAnyValue:StringLike": {"cognito-identity.amazonaws.com:amr": "unauthenticated"}
                }
            }]
        }
        """
        let createRoleInput = CreateRoleInput(
            assumeRolePolicyDocument: trustPolicy,
            roleName: roleName
        )
        let createRoleResponse = try await iamClient.createRole(input: createRoleInput)

        try await Task.sleep(nanoseconds: 10_000_000_000) // 10 seconds

        // Assign the role to the identity pool
        _ = try await cognitoIdentityClient.setIdentityPoolRoles(
            input: SetIdentityPoolRolesInput(
                identityPoolId: identityPoolId,
                roles: ["unauthenticated": createRoleResponse.role!.arn!]
            )
        )
    }

    override func tearDown() async throws {
        _ = try? await cognitoIdentityClient.deleteIdentityPool(
            input: DeleteIdentityPoolInput(identityPoolId: identityPoolId)
        )
        _ = try? await iamClient.deleteRole(
            input: DeleteRoleInput(roleName: roleName)
        )

        try await super.tearDown()
    }

    /// Confirm CognitoAWSCredentialIdentityResolver works by calling STS getCallerIdentity
    func testGetCallerIdentityWithCognitoCredentials() async throws {
        // Create CognitoAWSCredentialIdentityResolver
        let cognitoCredentialResolver = try CognitoAWSCredentialIdentityResolver(
            identityPoolId: identityPoolId,
            identityPoolRegion: region // us-west-2
        )

        // Configure STS client with Cognito credentials
        let cognitoStsConfig = try await STSClient.STSClientConfiguration(
            awsCredentialIdentityResolver: cognitoCredentialResolver,
            region: "us-east-1" // different from cognito pool region
        )
        let cognitoStsClient = STSClient(config: cognitoStsConfig)
        let response = try await cognitoStsClient.getCallerIdentity(
            input: GetCallerIdentityInput()
        )

        let account = try XCTUnwrap(response.account)
        let userId = try XCTUnwrap(response.userId)
        let arn = try XCTUnwrap(response.arn)

        XCTAssertNotEqual(account, "")
        XCTAssertNotEqual(userId, "")
        XCTAssertTrue(arn.contains(roleName))
    }
}
