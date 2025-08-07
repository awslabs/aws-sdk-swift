//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Foundation
@testable import AWSSDKIdentity
import struct Smithy.Attributes
import enum Smithy.ClientError
import struct SmithyIdentity.AWSCredentialIdentity

class CognitoCredentialResolverTests: XCTestCase {
    
    // Mock implementation of IdentityProvidingCognitoIdentityClient for testing
    class MockCognitoClient: CognitoIdentityClientProtocol, @unchecked Sendable {
        var getIdCalls: [(identityPoolId: String, accountId: String?, logins: [String: String]?)] = []
        var getCredentialsCalls: [(identityId: String, logins: [String: String]?, customRoleArn: String?)] = []
        
        var mockIdentityId: String = "us-west-2:12345678-1234-1234-1234-123456789012"
        var mockCredentials: AWSCredentialIdentity = AWSCredentialIdentity(
            accessKey: "ASIAEXAMPLEKEY",
            secret: "exampleSecretKey123456789",
            expiration: Date(timeIntervalSince1970: 1735689600),
            sessionToken: "exampleSessionToken..."
        )
        
        func getId(identityPoolId: String, logins: [String: String]?, region: String) async throws -> String {
            getIdCalls.append((identityPoolId, nil, logins))
            return mockIdentityId
        }
        
        func getCredentialsForIdentity(identityId: String, logins: [String: String]?, region: String) async throws -> AWSCredentialIdentity {
            getCredentialsCalls.append((identityId, logins, nil))
            return mockCredentials
        }
    }
    
    func testTC1_MinimumConfigWithIdentityPoolId() async throws {
        // TC1: Minimum required configuration with IdentityPoolId provides valid credentials
        let mockClient = MockCognitoClient()
        var resolver = try CognitoAWSCredentialIdentityResolver(
            identityPoolId: "us-west-2:test-pool",
            cognitoPoolRegion: "us-west-2",
            cognitoClient: mockClient
        )
        
        var attributes = Attributes()
        let credentials = try await resolver.getIdentity(identityProperties: attributes)
        
        XCTAssertEqual(mockClient.getIdCalls.count, 1)
        XCTAssertEqual(mockClient.getIdCalls[0].identityPoolId, "us-west-2:test-pool")
        XCTAssertNil(mockClient.getIdCalls[0].logins)
        
        XCTAssertEqual(mockClient.getCredentialsCalls.count, 1)
        XCTAssertEqual(mockClient.getCredentialsCalls[0].identityId, "us-west-2:12345678-1234-1234-1234-123456789012")
        
        XCTAssertEqual(credentials.accessKey, "ASIAEXAMPLEKEY")
    }
    
    func testTC2_MinimumConfigWithIdentityId() async throws {
        // TC2: Minimum required configuration with IdentityId provides valid credentials
        let mockClient = MockCognitoClient()
        var resolver = try CognitoAWSCredentialIdentityResolver(
            identityId: "us-west-2:example-id",
            cognitoPoolRegion: "us-west-2",
            cognitoClient: mockClient
        )
        
        var attributes = Attributes()

        let credentials = try await resolver.getIdentity(identityProperties: attributes)
        
        // Should not call GetId when identityId is provided
        XCTAssertEqual(mockClient.getIdCalls.count, 0)
        
        XCTAssertEqual(mockClient.getCredentialsCalls.count, 1)
        XCTAssertEqual(mockClient.getCredentialsCalls[0].identityId, "us-west-2:example-id")
        
        XCTAssertEqual(credentials.accessKey, "ASIAEXAMPLEKEY")
    }
    
    func testTC3_NeitherIdentityPoolIdNorIdentityIdProvided() {
        // TC3: Neither IdentityPoolId nor IdentityId provided results in error
        XCTAssertThrowsError(try CognitoAWSCredentialIdentityResolver(
            cognitoPoolRegion: "us-west-2"
        )) { error in
            XCTAssertTrue(error is ClientError)
        }
    }
    
    func testTC4_ExpiredCredentialsRefreshed() async throws {
        // TC4: Expired credentials are refreshed using existing IdentityId
        let mockClient = MockCognitoClient()
        var resolver = try CognitoAWSCredentialIdentityResolver(
            identityId: "us-west-2:12345678-1234-1234-1234-123456789012",
            cognitoPoolRegion: "us-west-2",
            cognitoClient: mockClient
        )

        // Set expired credentials initially
        mockClient.mockCredentials = AWSCredentialIdentity(
            accessKey: "ASIAEXAMPLEKEY",
            secret: "exampleSecretKey123456789",
            expiration: Date(timeIntervalSince1970: 100), // Expired
            sessionToken: "exampleSessionToken..."
        )
        
        var attributes = Attributes()

        // First call with expired credentials
        let credentials1 = try await resolver.getIdentity(identityProperties: attributes)
        
        // Update mock to return fresh credentials
        mockClient.mockCredentials = AWSCredentialIdentity(
            accessKey: "ASIAEXAMPLEKEY",
            secret: "exampleSecretKey123456789",
            expiration: Date(timeIntervalSince1970: 2735689600), // Future
            sessionToken: "exampleSessionToken..."
        )
        
        // Second call should refresh credentials
        let credentials2 = try await resolver.getIdentity(identityProperties: attributes)
        
        // Should call GetCredentialsForIdentity twice (no GetId since identityId provided)
        XCTAssertEqual(mockClient.getIdCalls.count, 0)
        XCTAssertEqual(mockClient.getCredentialsCalls.count, 2)
        XCTAssertEqual(mockClient.getCredentialsCalls[0].identityId, "us-west-2:12345678-1234-1234-1234-123456789012")
        XCTAssertEqual(mockClient.getCredentialsCalls[1].identityId, "us-west-2:12345678-1234-1234-1234-123456789012")
    }
    
    func testTC5_IdentityRefreshedWhenLoginsUpdated() async throws {
        // TC5: Identity is refreshed when logins are updated
        let mockClient = MockCognitoClient()
        var resolver = try CognitoAWSCredentialIdentityResolver(
            identityPoolId: "us-west-2:test-pool",
            cognitoPoolRegion: "us-west-2",
            cognitoClient: mockClient
        )

        var attributes = Attributes()

        // First call without logins
        let credentials1 = try await resolver.getIdentity(identityProperties: attributes)
        
        // Update logins
        await resolver.updateLogins(["accounts.google.com": "new-google-token"])
        
        // Update mock to return different identity ID for new logins
        mockClient.mockIdentityId = "us-west-2:12345678-1234-1234-1234-333333333333"
        
        // Second call with updated logins
        let credentials2 = try await resolver.getIdentity(identityProperties: attributes)
        
        // Should call GetId twice (once without logins, once with logins)
        XCTAssertEqual(mockClient.getIdCalls.count, 2)
        XCTAssertNil(mockClient.getIdCalls[0].logins)
        XCTAssertEqual(mockClient.getIdCalls[1].logins?["accounts.google.com"], "new-google-token")
        
        // Should call GetCredentialsForIdentity twice
        XCTAssertEqual(mockClient.getCredentialsCalls.count, 2)
        XCTAssertNil(mockClient.getCredentialsCalls[0].logins)
        XCTAssertEqual(mockClient.getCredentialsCalls[1].logins?["accounts.google.com"], "new-google-token")
    }
    
    func testTC6_IdentityNotRefreshedWhenLoginsUnchanged() async throws {
        // TC6: Identity is NOT refreshed when logins remain unchanged
        let mockClient = MockCognitoClient()
        var resolver = try CognitoAWSCredentialIdentityResolver(
            identityPoolId: "us-west-2:test-pool",
            logins: ["accounts.google.com": "google-token"],
            cognitoPoolRegion: "us-west-2",
            cognitoClient: mockClient
        )
        
        // Set credentials with future expiration
        mockClient.mockCredentials = AWSCredentialIdentity(
            accessKey: "ASIAEXAMPLEKEY",
            secret: "exampleSecretKey123456789",
            expiration: Date(timeIntervalSinceNow: 3600), // 1 hour from now
            sessionToken: "exampleSessionToken..."
        )
        
        var attributes = Attributes()

        // First call
        let credentials1 = try await resolver.getIdentity(identityProperties: attributes)
        
        // Second call with same logins (should use cached credentials)
        let credentials2 = try await resolver.getIdentity(identityProperties: attributes)
        
        // Should call GetId only once
        XCTAssertEqual(mockClient.getIdCalls.count, 1)
        XCTAssertEqual(mockClient.getIdCalls[0].logins?["accounts.google.com"], "google-token")
        
        // Should call GetCredentialsForIdentity only once (second call uses cache)
        XCTAssertEqual(mockClient.getCredentialsCalls.count, 1)
        XCTAssertEqual(mockClient.getCredentialsCalls[0].logins?["accounts.google.com"], "google-token")
    }
    
    func testTC7_FallbackToAWSRegion() throws {
        // TC7: Fall back to AWS_REGION when a Cognito pool region is not explicitly provided
        setenv("AWS_REGION", "us-west-2", 1)
        defer { unsetenv("AWS_REGION") }
        
        let resolver = try CognitoAWSCredentialIdentityResolver(
            identityPoolId: "us-west-2:test-pool"
        )
        
        // Should not throw error since AWS_REGION is set
        XCTAssertNotNil(resolver)
    }
}
