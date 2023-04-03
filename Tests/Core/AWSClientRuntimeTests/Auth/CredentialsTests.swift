//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest

@testable import AWSClientRuntime

class CredentialsTests: XCTestCase {
    
    let accessKey = "some_access_key"
    let secret = "some_secret"
    let session = "some_session"
    let expiration = Date.init(timeIntervalSince1970: 100)
    
    func testDefaultInit() {
        let creds = Credentials(
            accessKey: accessKey,
            secret: secret
        )
        
        XCTAssertEqual(creds.accessKey, accessKey)
        XCTAssertEqual(creds.secret, secret)
        XCTAssertNil(creds.sessionToken)
        XCTAssertNil(creds.expirationTimeout)
    }
    
    func testCRTCredentials() {
        let crtCredentials = try! CRTCredentials(credentials: .init(
            accessKey: accessKey,
            secret: secret,
            expirationTimeout: expiration,
            sessionToken: session
        ))
        let accessKey = crtCredentials.getAccessKey()
        let secret = crtCredentials.getSecret()
        let session = crtCredentials.getSessionToken()
        let expiration = crtCredentials.getExpiration()
        XCTAssertEqual(accessKey, self.accessKey)
        XCTAssertEqual(secret, self.secret)
        XCTAssertEqual(session, self.session)
        XCTAssertEqual(expiration, self.expiration)
    }
}
