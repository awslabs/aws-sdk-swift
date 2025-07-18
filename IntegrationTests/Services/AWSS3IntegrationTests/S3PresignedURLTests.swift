//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
import AWSS3

class S3PresignedURLTests: S3XCTestCase {

    func test_getObject_getsObjectWithPresignedURL() async throws {
        let originalData = UUID().uuidString
        let key = UUID().uuidString
        let originalContentDisposition = "attachment; filename=\"test.jpg\""
        try await putObject(body: originalData, key: key)
        let input = GetObjectInput(bucket: bucketName, key: key, responseContentDisposition: originalContentDisposition)
        let url = try await client.presignedURLForGetObject(input: input, expiration: 600.0)
        let (data, response) = try await perform(urlRequest: URLRequest(url: url))
        XCTAssertEqual(Data(originalData.utf8), data)
        let receivedContentDisposition = try XCTUnwrap(response).value(forHTTPHeaderField: "content-disposition")
        XCTAssertEqual(receivedContentDisposition, originalContentDisposition)
    }

    func test_getObject_urlEncodesInputMembers() async throws {
        let key = UUID().uuidString
        let originalIfMatch = UUID().uuidString
        let originalIfNoneMatch = UUID().uuidString
        let responseContentDisposition = UUID().uuidString
        let input = GetObjectInput(bucket: bucketName, ifMatch: originalIfMatch, ifNoneMatch: originalIfNoneMatch, key: key, responseContentDisposition: responseContentDisposition)
        let url = try await client.presignedURLForGetObject(input: input, expiration: 600.0)
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        XCTAssertNotNil(components?.queryItems?.first(where: { $0.name == "IfMatch" && $0.value == originalIfMatch }))
        XCTAssertNotNil(components?.queryItems?.first(where: { $0.name == "IfNoneMatch" && $0.value == originalIfNoneMatch }))
        XCTAssertNotNil(components?.queryItems?.first(where: { $0.name == "response-content-disposition" && $0.value == responseContentDisposition }))
    }

    func test_putObject_putsObjectWithPresignedURL() async throws {
        let originalData = UUID().uuidString
        let key = UUID().uuidString
        let input = PutObjectInput(body: .data(originalData.data(using: .utf8)), bucket: bucketName, key: key)
        let url = try await client.presignedURLForPutObject(input: input, expiration: 600);

        var request = URLRequest(url: url)
        request.httpBody = Data(originalData.utf8)
        request.httpMethod = "PUT"

        _ = try await perform(urlRequest: request)

        let getObjResult = try await client.getObject(input: GetObjectInput(bucket: bucketName, key: key))

        guard let fetchedData = try await getObjResult.body?.readData() else {
            throw GetObjectError.failedToGetObject
        }

        XCTAssertEqual(Data(originalData.utf8), fetchedData)
    }

    enum GetObjectError: Error {
        case failedToGetObject
    }
}
