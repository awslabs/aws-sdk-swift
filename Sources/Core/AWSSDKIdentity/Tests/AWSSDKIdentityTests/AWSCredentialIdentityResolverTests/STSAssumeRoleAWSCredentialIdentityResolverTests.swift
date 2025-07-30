//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct AWSSDKIdentity.IdentityClientProvider
import struct AWSSDKIdentity.STSAssumeRoleAWSCredentialIdentityResolver
import struct AWSSDKIdentity.EnvironmentAWSCredentialIdentityResolver
import enum Smithy.ClientError

class STSAssumeRoleAWSCredentialIdentityResolverTests: XCTestCase {

    func testInvalidSessionName() async throws {
        XCTAssertThrowsError(try STSAssumeRoleAWSCredentialIdentityResolver(
                awsCredentialIdentityResolver: EnvironmentAWSCredentialIdentityResolver(),
                roleArn: "role",
                sessionName: "invalid session name with spaces",
                identityClientProvider: IdentityClientProvider()
        )) { error in
            if case ClientError.invalidValue = error {
                // The test passes if this case is matched
            } else {
                XCTFail("Expected ClientError.invalidValue error, but got \(error)")
            }
        }
    }
}
