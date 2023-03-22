//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

final class S3Tests: XCTestCase {
    var sut: S3Client!
    let bucketName = "aws-sdk-swift-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    let objectName = "hello-world"
    let expected = "Hello, world!"

    override func setUp() async throws {
        sut = try S3Client(region: "us-west-2")
        try await createBucket()
    }

    override func tearDown() async throws {
        try await emptyBucket()
        try await deleteBucket()
    }

    func testGetObject() async throws {
        try await putObject()
        let input = GetObjectInput(bucket: bucketName, key: objectName)
        let output = try await sut.getObject(input: input)
        XCTAssertNotNil(output)
        XCTAssertNotNil(output.body)

        switch output.body! {
        case .data(let data):
            let actual = String(data: data!, encoding: .utf8)
            XCTAssertEqual(actual, expected)
        case .stream(let stream):
            let actual = String(data: try stream.readToEnd()!, encoding: .utf8)
            print(actual)
            XCTAssertEqual(actual, expected)
        }
    }

    func testPutObject_givenDataBody() async throws {
        let input = PutObjectInput(body: .data(expected.data(using: .utf8)), bucket: bucketName, key: objectName)
        let output = try await sut.putObject(input: input)
        XCTAssertNotNil(output)

        let actual = try await getObject()
        XCTAssertEqual(expected, actual)
    }
    
    func testPutObject_givenStreamBody() async throws {
        let audioURL = Bundle.module.url(forResource: "hello-world", withExtension: nil)!
        let fileHandle = FileHandle(forReadingAtPath: audioURL.relativePath)!
        let input = PutObjectInput(body: .from(fileHandle: fileHandle), bucket: bucketName, key: objectName)
        let output = try await sut.putObject(input: input)
        XCTAssertNotNil(output)

        let actual = try await getObject()
        XCTAssertEqual(expected, actual)
    }

    // MARK: Helpers

    private func createBucket() async throws {
        let input = CreateBucketInput(bucket: bucketName, createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2))
        let output = try await sut.createBucket(input: input)
        print(output)
    }
    
    private func getObject() async throws -> String? {
        let input = GetObjectInput(bucket: bucketName, key: objectName)
        let output = try await sut.getObject(input: input)
        XCTAssertNotNil(output)
        XCTAssertNotNil(output.body)

        switch output.body! {
        case .data(let data):
            return String(data: data!, encoding: .utf8)
        case .stream(let stream):
            return String(data: try stream.readToEnd()!, encoding: .utf8)
        }
    }

    private func deleteBucket() async throws {
        let input = DeleteBucketInput(bucket: bucketName)
        let output = try await sut.deleteBucket(input: input)
        print(output)
    }

    private func emptyBucket() async throws {
        let input = ListObjectsV2Input(bucket: bucketName)
        let output = try await sut.listObjectsV2(input: input)
        let objects = output.contents ?? []
        print("Deleting \(objects.count) objects in \(bucketName)")
        for object in objects {
            print("Deleting \(String(describing: object.key)) in \(bucketName)")
            let deleteInput = DeleteObjectInput(bucket: bucketName, key: object.key)
            let deleteOutput = try await sut.deleteObject(input: deleteInput)
            print(deleteOutput)
        }
    }

    private func putObject() async throws {
        let input = PutObjectInput(body: .data(expected.data(using: .utf8)), bucket: bucketName, key: objectName)
        let output = try await sut.putObject(input: input)
        print(output)
    }

}
