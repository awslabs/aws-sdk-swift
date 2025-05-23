//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

@testable import AWSCloudFrontKeyValueStore
import XCTest
import enum ClientRuntime.EndpointError
import enum SmithyHTTPAPI.EndpointPropertyValue
import enum SmithyTestUtil.TestInitializer
import struct SmithyHTTPAPI.Endpoint
import struct SmithyHTTPAPI.Headers

class EndpointResolverTest: XCTestCase {

    override class func setUp() {
        SmithyTestUtil.TestInitializer.initialize()
    }

    /// FIPS should error
    func testResolve1() throws {
        let endpointParams = EndpointParams(
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Invalid Configuration: FIPS is not supported with CloudFront-KeyValueStore.", message)
            default:
                XCTFail()
            }
        }
    }

    /// KVS ARN must be provided to use this service
    func testResolve2() throws {
        let endpointParams = EndpointParams(
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("KVS ARN must be provided to use this service", message)
            default:
                XCTFail()
            }
        }
    }

    /// KVS ARN must be a valid ARN
    func testResolve3() throws {
        let endpointParams = EndpointParams(
            kvsARN: "not-a-valid-arn"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("KVS ARN must be a valid ARN", message)
            default:
                XCTFail()
            }
        }
    }

    /// Provided ARN was not a valid CloudFront Service ARN. Found: `notcloudfront`
    func testResolve4() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:notcloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Provided ARN is not a valid CloudFront Service ARN. Found: `notcloudfront`", message)
            default:
                XCTFail()
            }
        }
    }

    /// Provided ARN must be a global resource ARN. Found: `us-west-2`
    func testResolve5() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:cloudfront:us-west-2:123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Provided ARN must be a global resource ARN. Found: `us-west-2`", message)
            default:
                XCTFail()
            }
        }
    }

    /// ARN resource type is invalid. Expected `key-value-store`, found: `some-other-resource-type`
    func testResolve6() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:cloudfront::123456789012:some-other-resource-type/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("ARN resource type is invalid. Expected `key-value-store`, found: `some-other-resource-type`", message)
            default:
                XCTFail()
            }
        }
    }

    /// CloudFront-KeyValueStore is not supported in partition `aws-cn`
    func testResolve7() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws-cn:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("CloudFront-KeyValueStore is not supported in partition `aws-cn`", message)
            default:
                XCTFail()
            }
        }
    }

    /// CloudFront-KeyValueStore is not supported in partition `aws-us-gov`
    func testResolve8() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws-us-gov:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("CloudFront-KeyValueStore is not supported in partition `aws-us-gov`", message)
            default:
                XCTFail()
            }
        }
    }

    /// Valid account based endpoint
    func testResolve9() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: SmithyHTTPAPI.EndpointPropertyValue] =
            [
                "authSchemes": [
                    [
                        "signingName": "cloudfront-keyvaluestore",
                        "name": "sigv4a",
                        "signingRegionSet": [
                            "*"
                        ]
                    ]
                ]
            ]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://123456789012.cloudfront-kvs.global.api.aws", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// Valid account based endpoint, with SDK region
    func testResolve10() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba",
            region: "us-west-2"
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: SmithyHTTPAPI.EndpointPropertyValue] =
            [
                "authSchemes": [
                    [
                        "signingName": "cloudfront-keyvaluestore",
                        "name": "sigv4a",
                        "signingRegionSet": [
                            "*"
                        ]
                    ]
                ]
            ]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://123456789012.cloudfront-kvs.global.api.aws", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// Valid ARN, different partition, should error
    func testResolve11() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba",
            region: "cn-north-1"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Client was configured for partition `aws-cn` but Kvs ARN has `aws`", message)
            default:
                XCTFail()
            }
        }
    }

    /// Valid account based endpoint with FIPS, should error
    func testResolve12() throws {
        let endpointParams = EndpointParams(
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba",
            region: "us-east-1",
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Invalid Configuration: FIPS is not supported with CloudFront-KeyValueStore.", message)
            default:
                XCTFail()
            }
        }
    }

    /// Custom sdk endpoint override
    func testResolve13() throws {
        let endpointParams = EndpointParams(
            endpoint: "https://my-override.example.com",
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba",
            region: "us-east-1"
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: SmithyHTTPAPI.EndpointPropertyValue] =
            [
                "authSchemes": [
                    [
                        "signingName": "cloudfront-keyvaluestore",
                        "name": "sigv4a",
                        "signingRegionSet": [
                            "*"
                        ]
                    ]
                ]
            ]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://123456789012.my-override.example.com", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// Custom sdk endpoint override with path and http
    func testResolve14() throws {
        let endpointParams = EndpointParams(
            endpoint: "http://my-override.example.com/custom-path",
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba"
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: SmithyHTTPAPI.EndpointPropertyValue] =
            [
                "authSchemes": [
                    [
                        "signingName": "cloudfront-keyvaluestore",
                        "name": "sigv4a",
                        "signingRegionSet": [
                            "*"
                        ]
                    ]
                ]
            ]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "http://123456789012.my-override.example.com/custom-path", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// Custom override with different partition should error
    func testResolve15() throws {
        let endpointParams = EndpointParams(
            endpoint: "https://my-override.example.com",
            kvsARN: "arn:aws:cloudfront::123456789012:key-value-store/my-first-kvs-e10b1dce4f394248811e77167e0451ba",
            region: "us-gov-east-1"
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Client was configured for partition `aws-us-gov` but Kvs ARN has `aws`", message)
            default:
                XCTFail()
            }
        }
    }

}
