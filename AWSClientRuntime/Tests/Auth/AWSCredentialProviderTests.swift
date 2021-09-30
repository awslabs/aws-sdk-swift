//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class AWSCredentialProviderTests: XCTestCase {
    
    func testYouCanUseCustomCredentialsProvider() throws {
        let awsCredsProvider = try AWSCredentialsProvider.fromCustom(MyCustomCredentialsProvider())
        let credentialsResult = try awsCredsProvider.getCredentials()
        let credentials = try credentialsResult.get()
        XCTAssertEqual(credentials.accessKey, "MYACCESSKEY")
        XCTAssertEqual(credentials.secret, "sekrit")
    }
    
    func testYouCanUseCustomCredentialsProviderFromDiffThread() throws {
        let awsCredsProvider = try AWSCredentialsProvider.fromCustom(MyCustomThreadTestCredentialsProvider())
        let credentialsResult = try awsCredsProvider.getCredentials()
        let credentials = try credentialsResult.get()
        XCTAssertEqual(credentials.accessKey, "MYACCESSKEY")
        XCTAssertEqual(credentials.secret, "sekrit")
    }
    
    func testCredentialsProviderIsNonBlocking() throws {
        let awsCredsProvider = try AWSCredentialsProvider.fromCustom(MyCustomThreadTestCredentialsProvider())
        let expectation = XCTestExpectation(description: "credentials received")
        DispatchQueue.global().async {
            do {
                let credentialsResult = try awsCredsProvider.getCredentials()
                let credentials = try credentialsResult.get()
                XCTAssertEqual(credentials.accessKey, "MYACCESSKEY")
                XCTAssertEqual(credentials.secret, "sekrit")
                expectation.fulfill()
            } catch let err {
                XCTFail(err.localizedDescription)
            }
        }
        let thisCodeShouldStillRun = true
        XCTAssertTrue(thisCodeShouldStillRun)
        wait(for: [expectation], timeout: 20.0)
    }
}

struct MyCustomCredentialsProvider: CredentialsProvider {
    func getCredentials() throws -> SdkFuture<AWSCredentials> {
        let future = SdkFuture<AWSCredentials>()
        future.fulfill(AWSCredentials(accessKey: "MYACCESSKEY", secret: "sekrit", expirationTimeout: 30))
        return future
    }
}

struct MyCustomThreadTestCredentialsProvider: CredentialsProvider {
    func getCredentials() throws -> SdkFuture<AWSCredentials> {
        let group = DispatchGroup()
        let future = SdkFuture<AWSCredentials>()
        for _ in 0...1000 {
            group.enter()
            DispatchQueue.global().async {
                usleep(useconds_t(1000))
                future.fulfill(AWSCredentials(accessKey: "MYACCESSKEY", secret: "sekrit", expirationTimeout: 30))
                group.leave()
            }
        }
        
        let result = group.wait(timeout: DispatchTime.now() + 10)
        XCTAssert(result == .success)
        return future
    }
}
