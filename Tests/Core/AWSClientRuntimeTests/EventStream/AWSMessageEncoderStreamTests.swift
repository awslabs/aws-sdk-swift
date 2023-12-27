//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AwsCommonRuntimeKit
import ClientRuntime
@testable import AWSClientRuntime

final class AWSMessageEncoderStreamTests: XCTestCase {
    let baseStream = AsyncThrowingStream<TestEvent, Error> { continuation in
        Task {
            continuation.yield(.allHeaders)
            continuation.yield(.emptyPayload)
            continuation.yield(.noHeaders)
            continuation.finish()
        }
    }
    let region = "us-east-2"
    let requestSignature = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    let serviceName = "test"
    let credentials = AWSCredentials(accessKey: "fake access key", secret: "fake secret key")
    let messageEncoder = AWSEventStream.AWSMessageEncoder()
    
    override class func setUp() {
        AwsCommonRuntimeKit.CommonRuntimeKit.initialize()
    }
    
    // MARK: - Tests
    
    func testIterator_EndMessageSent() async throws {
        let context = HttpContextBuilder()
            .withSigningRegion(value: region)
            .withSigningName(value: serviceName)
            .withRequestSignature(value: requestSignature)
            .withCredentialsProvider(value: MyCustomCredentialsProvider(credentials: credentials))
            .build()
        
        let messageSigner = AWSEventStream.AWSMessageSigner(encoder: messageEncoder) {
            return try await context.makeEventStreamSigningConfig()
        } requestSignature: {
            return context.getRequestSignature()
        }
        
        let sut = EventStream.DefaultMessageEncoderStream(
            stream: baseStream,
            messageEncoder: messageEncoder,
            requestEncoder: JSONEncoder(),
            messageSigner: messageSigner
        )
        
        var actual: [Data] = []
        for try await data in sut {
            actual.append(data)
        }
        
        XCTAssertEqual(4, actual.count)
    }
    
    func testReadAsync() async throws {
        let context = HttpContextBuilder().withSigningRegion(value: region)
            .withSigningName(value: serviceName)
            .withRequestSignature(value: requestSignature)
            .withCredentialsProvider(value: MyCustomCredentialsProvider(credentials: credentials))
            .build()
        
        let messageSigner = AWSEventStream.AWSMessageSigner(encoder: messageEncoder) {
            return try await context.makeEventStreamSigningConfig()
        } requestSignature: {
            return context.getRequestSignature()
        }
        
        let sut = EventStream.DefaultMessageEncoderStream(
            stream: baseStream,
            messageEncoder: messageEncoder,
            requestEncoder: JSONEncoder(),
            messageSigner: messageSigner
        )
        
        let read1 = try await sut.readAsync(upToCount: 100)
        XCTAssertEqual(100, read1!.count)
        
        let read2 = try await sut.readAsync(upToCount: 200)
        XCTAssertEqual(200, read2!.count)
        
        let read3 = try await sut.readAsync(upToCount: 500)
        XCTAssertEqual(249, read3!.count)
        
        let read4 = try await sut.readAsync(upToCount: 500)
        XCTAssertNil(read4)
    }
}
