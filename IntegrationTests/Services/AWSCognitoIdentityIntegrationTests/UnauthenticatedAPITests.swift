//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSSTS
import AWSCognitoIdentity
import AWSClientRuntime

/// Tests unauthenciated API using AWSCognitoIdentity::getId
class UnauthenticatedAPITests: XCTestCase {
    private let region = "us-east-1"
    private var stsClient: STSClient!
    private var cognitoIdentityClient: CognitoIdentityClient!

    private var accountID: String!
    private var identityPoolID: String!
    private let identityPoolName = "idpool" + UUID().uuidString.split(separator: "-").first!.lowercased()

    override func setUp() async throws {
        // Set up clients
        stsClient = try STSClient(region: region)
        cognitoIdentityClient = try CognitoIdentityClient(region: region)

        // Create identity pool & save its ID
        identityPoolID = try await cognitoIdentityClient.createIdentityPool(input: CreateIdentityPoolInput(
            allowUnauthenticatedIdentities: true,
            identityPoolName: identityPoolName
        )).identityPoolId

        // Get and save account ID that has the identity pool
        accountID = try await stsClient.getCallerIdentity(input: GetCallerIdentityInput()).account
    }

    override func tearDown() async throws {
        // Delete identity pool
        _ = try await cognitoIdentityClient.deleteIdentityPool(input: DeleteIdentityPoolInput(
            identityPoolId: identityPoolID
        ))
    }

    func testUnauthenticatedAPI() async throws {
        let id = try await cognitoIdentityClient.getId(
            input: GetIdInput(accountId: accountID, identityPoolId: identityPoolID)
        ).identityId ?? ""
        // Assert that successful response was returned with a nonempty ID.
        XCTAssertTrue(id.count > 0)
    }
}
