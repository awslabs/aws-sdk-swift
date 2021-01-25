/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import Foundation
import ClientRuntime
import XCTest

/**
 Includes Utility functions for Http Protocol Request Serialization Tests
 */
open class AWSHttpRequestTestBase: XCTestCase {
    /**
     Create `HttpRequest` from its components
     */
    public func buildExpectedHttpRequest(method: HttpMethodType,
                                         path: String,
                                         headers: [String: String],
                                         queryParams: [String],
                                         body: String?,
                                         host: String) -> SdkHttpRequest {
        let builder = SdkHttpRequestBuilder()
        
        for queryParam in queryParams {
            let queryParamComponents = queryParam.components(separatedBy: "=")
            if queryParamComponents.count > 1 {
                builder.withQueryItem(URLQueryItem(name: queryParamComponents[0],
                                           value: queryParamComponents[1].removingPercentEncoding))
            } else {
                builder.withQueryItem(URLQueryItem(name: queryParamComponents[0], value: nil))
            }
        }
        
        for (headerName, headerValue) in headers {
            builder.withHeader(name: headerName, value: headerValue)
        }
        
        guard let body = body else {
            return builder.build()
        }
        //handle empty string body cases that should still create a request
        //without the body
        if body != "" && body != "{}" {
            let httpBody = HttpBody.data(body.data(using: .utf8))
            builder.withBody(httpBody)
        }
    
        return builder.build()
        
    }
    
    /**
     Check if a Query Item with given name exists in array of `URLQueryItem`
     */
    public func queryItemExists(_ queryItemName: String, in queryItems: [URLQueryItem]?) -> Bool {
        guard let queryItems = queryItems else {
            return false
        }

        for queryItem in queryItems where queryItem.name == queryItemName {
            return true
        }
        return false
    }
    
    /**
    Check if a header with given name exists in array of `Header`
    */
    public func headerExists(_ headerName: String, in headers: [Header]) -> Bool {
        for header in headers where header.name == headerName {
            return true
        }
        return false
    }
    
    /**
     Asserts `HttpRequest` objects match
     /// - Parameter expected: Expected `HttpRequest`
     /// - Parameter actual: Actual `HttpRequest` to compare against
     /// - Parameter assertEqualHttpBody: Close to assert equality of `HttpBody` components
     */
    public func assertEqual(_ expected: SdkHttpRequest,
                            _ actual: SdkHttpRequest,
                            _ assertEqualHttpBody: (HttpBody?, HttpBody?) -> Void) {
        // assert headers match
        assertEqualHttpHeaders(expected.headers, actual.headers)
        
        // assert Endpoints match
        assertEqualQueryItems(expected.queryItems, actual.queryItems)
        
        // assert the contents of HttpBody match
        assertEqualHttpBody(expected.body, actual.body)
    }
    
    /**
    Asserts `HttpBody` objects with Data objects match
    /// - Parameter expected: Expected `HttpBody`
    /// - Parameter actual: Actual `HttpBody` to compare against
    */
    public func assertEqualHttpBodyData(_ expected: HttpBody, _ actual: HttpBody) {
        if case .data(let actualData) = actual {
            if case .data(let expectedData) = expected {
                guard let expectedData  = expectedData else {
                    XCTAssertNil(actualData, "expected data in HttpBody is nil but actual is not")
                    return
                }
                
                guard let actualData = actualData else {
                    XCTFail("actual data in HttpBody is nil but expected is not")
                    return
                }
                XCTAssertEqual(expectedData,
                               actualData,
                               "The expected and Actual data inside the HttpBody do not match")
            } else {
                XCTFail("The expected HttpBody is not Data Type")
            }
        } else {
            XCTFail("The actual HttpBody is not Data Type")
        }
    }
    
    /**
    Asserts `HttpBody` objects with JSON Data match
    /// - Parameter expected: Expected `HttpBody`
    /// - Parameter actual: Actual `HttpBody` to compare against
    */
    public func assertEqualHttpBodyJSONData(_ expected: HttpBody, _ actual: HttpBody) {
        if case .data(let actualData) = actual {
            if case .data(let expectedData) = expected {
                guard let expectedData  = expectedData else {
                    XCTAssertNil(actualData, "expected data in HttpBody is nil but actual is not")
                    return
                }
                
                guard let actualData = actualData else {
                    XCTFail("actual data in HttpBody is nil but expected is not")
                    return
                }
                assertEqualJSON(expectedData, actualData)
            } else {
                XCTFail("The expected HttpBody is not Data Type")
            }
        } else {
            XCTFail("The actual HttpBody is not Data Type")
        }
    }
    
    /**
    Asserts JSON `Data` objects  match
    /// - Parameter expected: Expected JSON `Data`
    /// - Parameter actual: Actual JSON `Data` to compare against
    */
    public func assertEqualJSON(_ expected: Data, _ actual: Data) {
        guard let expectedJSON = try? JSONSerialization.jsonObject(with: expected) as? [String: Any] else {
            XCTFail("The expected JSON Data is not Valid")
            return
        }
        
        guard let actualJSON = try? JSONSerialization.jsonObject(with: actual) as? [String: Any] else {
            XCTFail("The actual JSON Data is not Valid")
            return
        }
        
        XCTAssertTrue(NSDictionary(dictionary: expectedJSON).isEqual(to: actualJSON))
    }
    
    /**
    Asserts `HttpHeaders` objects  match
    /// - Parameter expected: Expected `HttpHeaders`
    /// - Parameter actual: Actual `HttpHeaders` to compare against
    */
    public func assertEqualHttpHeaders(_ expected: Headers, _ actual: Headers) {
        //in order to properly compare header values where actual is an array and expected comes in
        // as a comma separated string take actual and join them with a comma and then separate them
        // by comma (to in effect get the same separated list as expected) take expected and separate them
        // by comma then throw both actual and expected comma separated arrays in a set and compare sets
        let sortedActualHeaders = actual.dictionary.mapValues({ (values) -> Set<String> in
            let joinedValues = values.joined(separator: ", ")
            let splitValues = joinedValues.components(separatedBy: ", ")
            var set = Set<String>()
            splitValues.forEach { (value) in
                set.insert(value)
            }
            return set
        })
        let sortedExpectedHeaders = expected.dictionary.mapValues { (values) -> Set<String> in
            var set = Set<String>()
            values.forEach { (value) in
                let components = value.components(separatedBy: ", ")
                components.forEach { (arrayValue) in
                    set.insert(arrayValue)
                }
            }
            return set
        }
        for (expectedHeaderName, expectedHeaderValue) in sortedExpectedHeaders {
            guard let actualHeaderValue = sortedActualHeaders[expectedHeaderName] else {
                XCTFail("Expected Header \(expectedHeaderName) is not found in actual headers")
                return
            }
            
            XCTAssertEqual(expectedHeaderValue, actualHeaderValue,
                           "Expected Value of header \(expectedHeaderName) = \(expectedHeaderValue)]" +
                            " does not match actual header value" +
                            "\(String(describing: actual.dictionary[expectedHeaderName]))]")
        }
    }
    
    /**
    Asserts that Http Query Items  match
    /// - Parameter expected: Expected array of Query Items
    /// - Parameter actual: Actual array of Query Items to compare against
    */
    public func assertEqualQueryItems(_ expected: [URLQueryItem]?, _ actual: [URLQueryItem]?) {

        guard let expectedQueryItems = expected else {
            XCTAssertNil(actual,
                         "expected query items is nil but actual are not")
            return
        }
        
        guard let actualQueryItems = actual else {
            XCTFail("actual query items in Endpoint is nil but expected are not")
            return
        }
        //take arrays of query items and convert to dictionary
        let expectedNamesAndValues = expectedQueryItems.map { ($0.name, Set(arrayLiteral: $0.value)) }
        let expectedMap = Dictionary(expectedNamesAndValues, uniquingKeysWith: { first, last in
            return first.union(last)
        })
        
        let actualNamesAndValues = actualQueryItems.map {($0.name, Set(arrayLiteral: $0.value))}
        let actualMap = Dictionary(actualNamesAndValues, uniquingKeysWith: { first, last in
            return first.union(last)
        })
        
        for expectedQueryItem in expectedQueryItems {
            XCTAssertTrue(actualQueryItems.contains(expectedQueryItem),
                          "Actual query item does not contain expected query Item with name: \(expectedQueryItem.name)")
            let actualQueryItemValue = actualMap[expectedQueryItem.name]
            XCTAssertEqual(actualQueryItemValue,
                           expectedMap[expectedQueryItem.name],
                           "Expected query item [\(expectedQueryItem.name)=" +
                           "\(String(describing: expectedQueryItem.value))]" +
                           " does not match actual query item [\(expectedQueryItem.name)" +
                            "=\(String(describing: actualQueryItemValue))]")

        }
    }
}
