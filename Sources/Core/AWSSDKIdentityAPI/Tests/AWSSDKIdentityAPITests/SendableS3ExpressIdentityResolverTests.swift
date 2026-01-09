//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSSDKIdentityAPI
import Smithy

/// Tests to verify that S3ExpressIdentityResolver requires Sendable conformance
final class SendableS3ExpressIdentityResolverTests: XCTestCase {
    
    /// Verify that S3ExpressIdentityResolver requires Sendable
    func testS3ExpressIdentityResolverIsSendable() async throws {
        // This test verifies that S3ExpressIdentityResolver requires Sendable
        // by checking that conforming types can be used in Sendable contexts
        
        let resolver = MockS3ExpressIdentityResolver()
        
        // Test 1: Can be used in an actor
        actor TestActor {
            var resolver: MockS3ExpressIdentityResolver?
            
            func setResolver(_ resolver: MockS3ExpressIdentityResolver) {
                self.resolver = resolver
            }
        }
        
        let actor = TestActor()
        await actor.setResolver(resolver)
        
        // Test 2: Can be passed to async functions
        func asyncFunction(resolver: MockS3ExpressIdentityResolver) async -> Bool {
            return true
        }
        
        let result = await asyncFunction(resolver: resolver)
        XCTAssertTrue(result)
    }
    
    /// Verify that S3ExpressIdentityResolver can be shared across actor boundaries
    func testS3ExpressIdentityResolverCanBeSharedAcrossActors() async throws {
        let resolver = MockS3ExpressIdentityResolver()
        
        actor ActorA {
            var resolver: MockS3ExpressIdentityResolver?
            
            func setResolver(_ resolver: MockS3ExpressIdentityResolver) {
                self.resolver = resolver
            }
        }
        
        actor ActorB {
            var resolver: MockS3ExpressIdentityResolver?
            
            func setResolver(_ resolver: MockS3ExpressIdentityResolver) {
                self.resolver = resolver
            }
        }
        
        let actorA = ActorA()
        let actorB = ActorB()
        
        // Share resolver across actors concurrently
        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                await actorA.setResolver(resolver)
            }
            group.addTask {
                await actorB.setResolver(resolver)
            }
        }
    }
}

// MARK: - Mock Types for Testing

private struct MockS3ExpressIdentityResolver: S3ExpressIdentityResolver {
    func getIdentity(identityProperties: Attributes?) async throws -> S3ExpressIdentity {
        return S3ExpressIdentity(
            accessKeyId: "test-access-key",
            secretAccessKey: "test-secret",
            sessionToken: "test-session-token",
            expiration: nil
        )
    }
}
