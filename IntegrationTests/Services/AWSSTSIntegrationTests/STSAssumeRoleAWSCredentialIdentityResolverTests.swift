//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import AWSSTS
import AWSIAM
import AWSSDKIdentity
import ClientRuntime
#if canImport(InMemoryExporter)
import InMemoryExporter
#endif
//#if os(Linux)
//import OpenTelemetryConcurrency
//#endif

class STSAssumeRoleAWSCredentialIdentityResolverTests: XCTestCase {
    private let region = "us-east-1"

    // MARK: - Clients, policies, and variables

    // STS client with only the STSAssumeRoleAWSCredentialIdentityResolver configured.
    private var assumeRoleStsClient: STSClient!
    private var assumeRoleStsConfig: STSClient.STSClientConfiguration!

    // Used to create temporary role assumed by STS assume role credentials provider.
    private var iamClient: IAMClient!
    private let roleName = "aws-sts-integration-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private let roleSessionName = "aws-sts-integration-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private var roleArn: String!

    // JSON assume role policy
    private func assumeRolePolicy(acctID: String) -> String {
        return """
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::\(acctID):root"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        }
        """
    }

    private let identityPolicyName = "temp-allow-STS-getCallerIdentity"
    // JSON identity policy
    private let roleIdentityPolicy = """
    {"Version": "2012-10-17","Statement": [{"Sid": "","Effect": "Allow",
    "Action": "sts:GetCallerIdentity","Resource": "*"}]}
    """

    // MARK: - Test case

    // Confirm STS assume role credentials provider works by validating response.
    func testGetCallerIdentity() async throws {
        let response = try await assumeRoleStsClient.getCallerIdentity(
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

    // Right now opentelemetry-swift doesnt support linux or visionos
    #if !(os(Linux) || os(visionOS))
    // OpenTelemetry Tracing works as expected
    func testGetCallerIdentityWithOTelTracing() async throws {
        let inMemoryExporter = InMemoryExporter()

        // Uncomment below when linux becomes supported
        //#if os(Linux)
        // On Apple platforms, the default is the activity based context manager. We want to opt-in to the structured concurrency based context manager instead.
        // OpenTelemetry.registerDefaultConcurrencyContextManager()
        //#endif

        let config = try await STSClient.STSClientConfiguration(
            region: "us-west-2",
            telemetryProvider: OpenTelemetrySwift.provider(spanExporter: inMemoryExporter)
        )
        let client = STSClient(config: config)
        _ = try await client.getCallerIdentity(input: GetCallerIdentityInput())

        let traceResults = inMemoryExporter.getFinishedSpanItems()

        XCTAssertTrue(
            traceResults.contains { span in
                span.instrumentationScope.name == "STS" && span.name == "STS.GetCallerIdentity"
            },
            "Expected STS.GetCallerIdentity span not found"
        )
    }
    #endif

    // MARK: - Setup & teardown

    override func setUp() async throws {
        guard let acctID = try await STSClient(region: region).getCallerIdentity(input: GetCallerIdentityInput()).account else {
            throw AssumeRoleTestError.failedToGetAccountID("Failed to retrieve account ID for the test.")
        }

        // Create role with trust policy (assume role policy).
        iamClient = try IAMClient(region: region)
        roleArn = try await iamClient.createRole(input: CreateRoleInput(
            assumeRolePolicyDocument: assumeRolePolicy(acctID: acctID),
            roleName: roleName
        )).role?.arn
        // This wait is necessary for role creation to propagate everywhere
        let seconds = 10
        let NSEC_PER_SEC = 1_000_000_000
        try await Task.sleep(nanoseconds: UInt64(seconds * NSEC_PER_SEC))

        // Attach identity policy to role.
        _ = try await iamClient.putRolePolicy(input: PutRolePolicyInput(
            policyDocument: roleIdentityPolicy,
            policyName: identityPolicyName,
            roleName: roleName
        ))

        // Construct STS client wih assume-role credentials provider.
        let underlyingResolver = try DefaultAWSCredentialIdentityResolverChain()
        let assumeRoleAWSCredentialIdentityResolver = try STSAssumeRoleAWSCredentialIdentityResolver(
            awsCredentialIdentityResolver: underlyingResolver,
            roleArn: roleArn,
            sessionName: roleSessionName
        )
        assumeRoleStsConfig = try await STSClient.STSClientConfiguration(
            awsCredentialIdentityResolver: assumeRoleAWSCredentialIdentityResolver,
            region: region
        )
        assumeRoleStsClient = STSClient(config: assumeRoleStsConfig)
    }

    override func tearDown() async throws {
        // Delete identity policy attached to role (inline policy).
        let policyName = try await iamClient.listRolePolicies(input: ListRolePoliciesInput(roleName: roleName)).policyNames
        _ = try await iamClient.deleteRolePolicy(input: DeleteRolePolicyInput(
            policyName: policyName?[0], roleName: roleName
        ))

        // Delete role
        _ = try? await iamClient.deleteRole(input: DeleteRoleInput(roleName: roleName))
    }

    // MARK: - ERROR USED IN SETUP
    enum AssumeRoleTestError: Error {
        case failedToGetAccountID(String)
    }
}


