//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import AWSS3
import AWSClientRuntime

class S3ErrorTests: S3XCTestCase {

    func test_noSuchKey_throwsNoSuchKeyWhenUnknownKeyIsUsed() async throws {
        do {
            let input = GetObjectInput(bucket: bucketName, key: UUID().uuidString)
            _ = try await client.getObject(input: input)
            XCTFail("Request should not have succeeded")
        } catch let error as NoSuchKey {
            XCTAssertEqual(error.message, "The specified key does not exist.")
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

    func test_requestID_hasARequestIDAndRequestID2() async throws {
        do {
            let input = GetObjectInput(bucket: bucketName, key: UUID().uuidString)
            _ = try await client.getObject(input: input)
            XCTFail("Request should not have succeeded")
        } catch let error as AWSS3ServiceError {
            let requestID = try XCTUnwrap(error.requestID)
            let requestID2 = try XCTUnwrap(error.requestID2)
            XCTAssertFalse(requestID.isEmpty)
            XCTAssertFalse(requestID2.isEmpty)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

    func test_invalidObjectState_hasReadableProperties() async throws {
        do {
            let key = UUID().uuidString + ".txt"
            let putInput = PutObjectInput(bucket: bucketName, key: key, storageClass: .glacier)
            _ = try await client.putObject(input: putInput)
            let getInput = GetObjectInput(bucket: bucketName, key: key)
            _ = try await client.getObject(input: getInput)
            XCTFail("Request should not have succeeded")
        } catch let error as InvalidObjectState {
            XCTAssertEqual(error.properties.accessTier, nil)
            XCTAssertEqual(error.properties.storageClass, .glacier)
            XCTAssertEqual(error.message, "The operation is not valid for the object\'s storage class")
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }
}
