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
        let sleepVal = Int.random(in: 1...4)
        for _ in 0...1000 {
            group.enter()

            DispatchQueue.global().async {
                usleep(useconds_t(sleepVal))
                future.fulfill(AWSCredentials(accessKey: "MYACCESSKEY", secret: "sekrit", expirationTimeout: 30))
                group.leave()
            }
        }
        
        let result = group.wait(timeout: DispatchTime.now() + 10)
        XCTAssert(result == .success)
        return future
    }
}
