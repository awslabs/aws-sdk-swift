//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import ClientRuntime
import Smithy

/// Tests to verify that the enableAWSChunked configuration property
/// can be set and retrieved correctly in S3ClientConfig.
final class S3EnableAWSChunkedConfigTests: XCTestCase {
    
    /// Test that enableAWSChunked defaults to nil when not specified
    func testEnableAWSChunkedDefaultsToNil() throws {
        let config = try S3Client.S3ClientConfig(region: "us-east-1")
        XCTAssertNil(config.enableAWSChunked, "enableAWSChunked should default to nil")
    }
    
    /// Test that enableAWSChunked can be set to true
    func testEnableAWSChunkedCanBeSetToTrue() throws {
        let config = try S3Client.S3ClientConfig(
            region: "us-east-1",
            enableAWSChunked: true
        )
        XCTAssertEqual(config.enableAWSChunked, true, "enableAWSChunked should be true")
    }
    
    /// Test that enableAWSChunked can be set to false
    func testEnableAWSChunkedCanBeSetToFalse() throws {
        let config = try S3Client.S3ClientConfig(
            region: "us-east-1",
            enableAWSChunked: false
        )
        XCTAssertEqual(config.enableAWSChunked, false, "enableAWSChunked should be false")
    }
    
    /// Test that enableAWSChunked can be explicitly set to nil
    func testEnableAWSChunkedCanBeSetToNil() throws {
        let config = try S3Client.S3ClientConfig(
            region: "us-east-1",
            enableAWSChunked: nil
        )
        XCTAssertNil(config.enableAWSChunked, "enableAWSChunked should be nil")
    }
    
    /// Test that enableAWSChunked is preserved in deprecated S3ClientConfiguration
    func testEnableAWSChunkedInDeprecatedConfig() throws {
        let config = try S3Client.S3ClientConfiguration(
            region: "us-east-1",
            enableAWSChunked: true
        )
        XCTAssertEqual(config.enableAWSChunked, true, "enableAWSChunked should be true in deprecated config")
    }
    
    /// Test that enableAWSChunked is preserved through toSendable() conversion
    func testEnableAWSChunkedPreservedThroughToSendable() throws {
        let deprecatedConfig = try S3Client.S3ClientConfiguration(
            region: "us-east-1",
            enableAWSChunked: true
        )
        let sendableConfig = try deprecatedConfig.toSendable()
        XCTAssertEqual(sendableConfig.enableAWSChunked, true, "enableAWSChunked should be preserved through toSendable()")
    }
    
    /// Test that Context extension can store and retrieve enableAWSChunked
    func testContextExtensionStoresEnableAWSChunked() {
        var context = Context()
        
        // Test nil value
        XCTAssertNil(context.enableAWSChunked, "enableAWSChunked should default to nil in context")
        
        // Test setting to true
        context.enableAWSChunked = true
        XCTAssertEqual(context.enableAWSChunked, true, "enableAWSChunked should be true in context")
        
        // Test setting to false
        context.enableAWSChunked = false
        XCTAssertEqual(context.enableAWSChunked, false, "enableAWSChunked should be false in context")
        
        // Test setting back to nil
        context.enableAWSChunked = nil
        XCTAssertNil(context.enableAWSChunked, "enableAWSChunked should be nil in context")
    }
    
    /// Test that ContextBuilder can set enableAWSChunked
    func testContextBuilderSetsEnableAWSChunked() {
        let context = ContextBuilder()
            .withEnableAWSChunked(value: true)
            .build()
        
        XCTAssertEqual(context.enableAWSChunked, true, "enableAWSChunked should be true in built context")
    }
}
