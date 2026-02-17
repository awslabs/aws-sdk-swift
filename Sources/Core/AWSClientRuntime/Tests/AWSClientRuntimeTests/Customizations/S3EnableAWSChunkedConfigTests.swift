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
}
