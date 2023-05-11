//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

class S3XCTestCase: XCTestCase {
    var sut: S3Client!
    var region = "us-west-2"
    let bucketName = "aws-sdk-swift-test-\(UUID().uuidString.split(separator: "-").first!.lowercased())"

    override func setUp() async throws {
        sut = try S3Client(region: region)
        try await createBucket()
    }

    override func tearDown() async throws {
        try await emptyBucket()
        try await deleteBucket()
    }


    // MARK: Helpers

    func perform(urlRequest: URLRequest) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let code = (urlResponse as? HTTPURLResponse)?.statusCode, !(200...299).contains(code) {
                    let error = HTTPError(code: code, data: data, url: urlRequest.url)
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: data ?? Data())
                }
            }
            task.resume()
        }
    }

    struct HTTPError: Error, CustomDebugStringConvertible {
        let code: Int
        let data: Data
        let urlString: String

        init(code: Int, data: Data?, url: URL?) {
            self.code = code
            self.data = data ?? Data()
            self.urlString = url?.absoluteString ?? "<no URL>"
        }

        var debugDescription: String {
            let bodyString = String(data: data, encoding: .utf8) ?? "<not a string>"
            return "HTTP request to: \(urlString) failed with code: \(code), body: \(bodyString)"
        }
    }

    func createBucket() async throws {
        let input = CreateBucketInput(bucket: bucketName, createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2))
        let output = try await sut.createBucket(input: input)
        print(output)
    }

    func getObject(key: String) async throws -> String? {
        let input = GetObjectInput(bucket: bucketName, key: key)
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

    func deleteBucket() async throws {
        let input = DeleteBucketInput(bucket: bucketName)
        let output = try await sut.deleteBucket(input: input)
        print(output)
    }

    func emptyBucket() async throws {
        let keys = try await listBucketKeys()
        print("Deleting \(keys.count) objects in \(bucketName)")
        for key in keys {
            print("Deleting \(String(describing: key)) in \(bucketName)")
            let deleteInput = DeleteObjectInput(bucket: bucketName, key: key)
            let deleteOutput = try await sut.deleteObject(input: deleteInput)
            print(deleteOutput)
        }
    }

    func listBucketKeys() async throws -> [String] {
        let input = ListObjectsV2Input(bucket: bucketName)
        let output = try await sut.listObjectsV2(input: input)
        return output.contents?.compactMap { $0.key } ?? []
    }

    func putObject(body: String, key: String) async throws {
        let input = PutObjectInput(body: .data(body.data(using: .utf8)), bucket: bucketName, key: key)
        let output = try await sut.putObject(input: input)
        print(output)
    }

}
