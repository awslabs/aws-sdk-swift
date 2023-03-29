//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest

@testable import AWSClientRuntime

class FunctionCacheTests: XCTestCase {

    func testFunctionCacheReturnsCachedResultForSameInputs() async {
        var counter: Int = 0
        let cache = FunctionCache<String, String> {
            counter += 1
            return $0.uppercased()
        }
        
        let input = "hello swift"
        
        for _ in 1...20 {
            let ouput = try! await cache.output(for: input)
            XCTAssertEqual(ouput, "HELLO SWIFT")
        }
        
        XCTAssertEqual(counter, 1)
    }
    
    func testFunctionCacheExecutesFunctionForNewInputs() async {
        var counter: Int = 0
        let cache = FunctionCache<String, String> {
            counter += 1
            return $0.uppercased()
        }
        
        let input = "hello swift"
        
        for i in 1...20 {
            let ouput = try! await cache.output(for: input + "\(i)")
            XCTAssertEqual(ouput, "HELLO SWIFT\(i)")
        }
        
        XCTAssertEqual(counter, 20)
    }
    
    func testFunctionCacheReusesTheExistingTaskForSubsequentCallForSameInputs() async {
        var counter: Int = 0
        
        let cache = FunctionCache<String, String> {
            try! await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
            counter += 1
            return $0.uppercased()
        }
        
        let input = "hello swift"
        
        await withTaskGroup(of: String.self) { group in
            for _ in (1...20) {
                group.addTask {
                    try! await cache.output(for: input)
                }
            }
            for await result in group {
                XCTAssertEqual(result, "HELLO SWIFT")
            }
        }
        
        XCTAssertEqual(counter, 1)
    }
}
