//
//  File.swift
//  
//
//  Created by Yoo, Chan on 6/27/24.
//

import Foundation
import Smithy
import XCTest
import AWSS3
import AWSIntegrationTestUtils

class S3ConcurrentTests: S3XCTestCase {
    let fileSize = 104_857_600

    func test_100MB_putObject() async throws {
        let file = ByteStream.from(
            fileHandle: try FileHandle(
                forReadingFrom: Bundle.module.url(forResource: "100MiB", withExtension: "txt")!
            )
        )
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)
        _ = try await client.putObject(input: putObjectInput)
        let headObjectInput = HeadObjectInput(bucket: bucketName, key: objectKey)
        let contentLength = try await client.headObject(input: headObjectInput).contentLength
        XCTAssertEqual(contentLength, fileSize)
    }

    func test_100MB_getObject() async throws {
        let file = ByteStream.from(
            fileHandle: try FileHandle(
                forReadingFrom: Bundle.module.url(forResource: "100MiB", withExtension: "txt")!
            )
        )
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)
        _ = try await client.putObject(input: putObjectInput)
        let getObjectInput = GetObjectInput(bucket: bucketName, key: objectKey)
        let retrievedData = try await client.getObject(input: getObjectInput).body.unsafelyUnwrapped.readData()
        XCTAssertEqual(
            try Data(contentsOf: Bundle.module.url(forResource: "100MiB", withExtension: "txt")!),
            retrievedData
        )
    }

    func test_10x_100MB_putObject() async throws {
        try await repeatConcurrently(count: 10, test: test_100MB_putObject)
    }

    func test_10x_100MB_getObject() async throws {
        try await repeatConcurrently(count: 10, test: test_100MB_getObject)
    }
}
