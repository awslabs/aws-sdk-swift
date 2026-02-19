//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
import Smithy
@testable import AWSClientRuntime

/// Tests to verify that the enableAWSChunked context extension
/// works correctly.
final class EnableAWSChunkedContextTests: XCTestCase {
    
    /// Test that Context extension can store and retrieve enableAWSChunked
    func testContextExtensionStoresEnableAWSChunked() {
        var context = Context(attributes: Attributes())
        
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
    
    /// Test that ContextBuilder can set enableAWSChunked to false
    func testContextBuilderSetsEnableAWSChunkedToFalse() {
        let context = ContextBuilder()
            .withEnableAWSChunked(value: false)
            .build()
        
        XCTAssertEqual(context.enableAWSChunked, false, "enableAWSChunked should be false in built context")
    }

    /// Test that ContextBuilder can set enableAWSChunked to nil explicitly
    func testContextBuilderSetsEnableAWSChunkedToNil() {
        let context = ContextBuilder()
            .withEnableAWSChunked(value: nil)
            .build()
        
        XCTAssertNil(context.enableAWSChunked, "enableAWSChunked should be nil in built context")
    }

    /// Test that ContextBuilder method chaining works correctly
    func testContextBuilderMethodChaining() {
        let context = ContextBuilder()
            .withAccountIDEndpointMode(value: .preferred)
            .withEnableAWSChunked(value: true)
            .build()
        
        XCTAssertEqual(context.enableAWSChunked, true, "enableAWSChunked should be true after method chaining")
        XCTAssertEqual(context.accountIDEndpointMode, .preferred, "accountIDEndpointMode should be preserved")
    }
    
    /// Test that enableAWSChunked default provider returns nil when no config is set
    func testEnableAWSChunkedDefaultProviderReturnsNil() throws {
        let result = try AWSClientConfigDefaultsProvider.enableAWSChunked()
        XCTAssertNil(result, "enableAWSChunked should default to nil when no environment variable or config is set")
    }

    /// Test that enableAWSChunked default provider respects explicit nil parameter
    func testEnableAWSChunkedDefaultProviderRespectsExplicitNil() throws {
        let result = try AWSClientConfigDefaultsProvider.enableAWSChunked(nil)
        XCTAssertNil(result, "enableAWSChunked should return nil when explicitly passed nil")
    }

    /// Test that enableAWSChunked default provider respects explicit true parameter
    func testEnableAWSChunkedDefaultProviderRespectsExplicitTrue() throws {
        let result = try AWSClientConfigDefaultsProvider.enableAWSChunked(true)
        XCTAssertEqual(result, true, "enableAWSChunked should return true when explicitly passed true")
    }

    /// Test that enableAWSChunked default provider respects explicit false parameter
    func testEnableAWSChunkedDefaultProviderRespectsExplicitFalse() throws {
        let result = try AWSClientConfigDefaultsProvider.enableAWSChunked(false)
        XCTAssertEqual(result, false, "enableAWSChunked should return false when explicitly passed false")
    }
    
    /// Test that enableAWSChunked attribute key is properly typed as Bool?
    func testEnableAWSChunkedAttributeKeyType() {
        var context = Context(attributes: Attributes())
        
        // Set a non-nil value
        context.enableAWSChunked = true
        
        // Verify we can retrieve it as Bool?
        let value: Bool? = context.enableAWSChunked
        XCTAssertNotNil(value)
        XCTAssertEqual(value, true)
    }

    /// Test that enableAWSChunked can be overwritten multiple times
    func testEnableAWSChunkedCanBeOverwritten() {
        var context = Context(attributes: Attributes())
        
        context.enableAWSChunked = true
        XCTAssertEqual(context.enableAWSChunked, true)
        
        context.enableAWSChunked = false
        XCTAssertEqual(context.enableAWSChunked, false)
        
        context.enableAWSChunked = nil
        XCTAssertNil(context.enableAWSChunked)
        
        context.enableAWSChunked = true
        XCTAssertEqual(context.enableAWSChunked, true)
    }
    
    /// Test that multiple contexts can have different enableAWSChunked values
    func testMultipleContextsHaveIndependentValues() {
        var context1 = Context(attributes: Attributes())
        var context2 = Context(attributes: Attributes())
        
        context1.enableAWSChunked = true
        context2.enableAWSChunked = false
        
        XCTAssertEqual(context1.enableAWSChunked, true, "context1 should have true")
        XCTAssertEqual(context2.enableAWSChunked, false, "context2 should have false")
    }

    /// Test that ContextBuilder creates independent contexts
    func testContextBuilderCreatesIndependentContexts() {
        let builder = ContextBuilder()
        
        let context1 = builder.withEnableAWSChunked(value: true).build()
        let context2 = builder.withEnableAWSChunked(value: false).build()
        
        // Note: This test verifies that each build() creates a new context
        // The second build should have false, not true
        XCTAssertEqual(context2.enableAWSChunked, false, "Second context should have its own value")
    }
}
