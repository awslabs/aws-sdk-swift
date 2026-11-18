//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
@testable import AWSSDKIdentity

class LoginAWSCredentialIdentityResolverTests: XCTestCase {
    private var tempDirectory: URL!

    override func setUpWithError() throws {
        try super.setUpWithError()
        tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("LoginAWSCredentialIdentityResolverTests-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: tempDirectory, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        if let tempDirectory {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        try super.tearDownWithError()
    }

    // MARK: - Decoding & encoding

    func test_loginToken_decodesWithoutSignInRegion() throws {
        let token = try decode(tokenJSON(signInRegion: nil))
        XCTAssertNil(token.signInRegion)
        XCTAssertNil(token.refreshRegion)
    }

    func test_loginToken_decodesSignInRegion() throws {
        let token = try decode(tokenJSON(signInRegion: "eu-central-1"))
        XCTAssertEqual(token.signInRegion, "eu-central-1")
        XCTAssertEqual(token.refreshRegion, "eu-central-1")

        let emptyToken = try decode(tokenJSON(signInRegion: ""))
        XCTAssertEqual(emptyToken.signInRegion, "")
        XCTAssertNil(emptyToken.refreshRegion)
    }

    func test_loginToken_encodingOmitsNilSignInRegion() throws {
        let fileURL = tempDirectory.appendingPathComponent("token.json")

        try makeToken(signInRegion: nil).save(to: fileURL)
        let savedWithoutRegion = try String(contentsOf: fileURL, encoding: .utf8)
        XCTAssertFalse(savedWithoutRegion.contains("signInRegion"))
        XCTAssertNil(try decode(savedWithoutRegion).signInRegion)

        try makeToken(signInRegion: "eu-central-1").save(to: fileURL)
        let savedWithRegion = try String(contentsOf: fileURL, encoding: .utf8)
        XCTAssertEqual(try decode(savedWithRegion).signInRegion, "eu-central-1")
    }

    // MARK: - Helpers

    private func makeToken(signInRegion: String?) -> LoginToken {
        LoginToken(
            accessToken: AccessToken(
                accessKeyId: "AKID",
                secretAccessKey: "SECRET",
                sessionToken: "SESSION",
                accountId: "123456789012",
                expiresAt: Date(timeIntervalSince1970: 1_577_836_800)
            ),
            tokenType: "aws_sigv4",
            refreshToken: "refresh-token",
            idToken: "id-token",
            clientId: "arn:aws:signin:::devtools/same-device",
            dpopKey: "dpop-key",
            signInRegion: signInRegion
        )
    }

    private func tokenJSON(signInRegion: String?) -> String {
        let regionLine = signInRegion.map { ",\n  \"signInRegion\": \"\($0)\"" } ?? ""
        return """
        {
          "accessToken": {
            "accessKeyId": "AKID",
            "secretAccessKey": "SECRET",
            "sessionToken": "SESSION",
            "accountId": "123456789012",
            "expiresAt": "2020-01-01T00:00:00Z"
          },
          "tokenType": "aws_sigv4",
          "refreshToken": "refresh-token",
          "idToken": "id-token",
          "clientId": "arn:aws:signin:::devtools/same-device",
          "dpopKey": "dpop-key"\(regionLine)
        }
        """
    }

    private func decode(_ json: String) throws -> LoginToken {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            guard let date = RFC3339DateParser.parse(dateString) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid RFC3339 date format"
                )
            }
            return date
        }
        return try decoder.decode(LoginToken.self, from: Data(json.utf8))
    }
}
