//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
@_spi(FileBasedConfig) import AWSSDKCommon
import ClientRuntime
import struct Foundation.Data
import struct Foundation.Date
import class Foundation.FileManager
import class Foundation.ISO8601DateFormatter
import class Foundation.JSONDecoder
import class Foundation.JSONEncoder
import func Foundation.NSHomeDirectory
import class Foundation.ProcessInfo
import struct Foundation.TimeInterval
import struct Foundation.URL
import struct Foundation.UUID
import InternalAWSSignin
import Security
import struct Smithy.Attributes
import enum Smithy.ClientError
import SmithyHTTPAPI
import protocol SmithyIdentity.AWSCredentialIdentityResolver

public struct LoginAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let profileName: String?
    private let configFilePath: String?
    private let credentialsFilePath: String?
    private let credentialFeatureIDs: [String]

    /// - Parameters:
    ///   - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) throws {
        try self.init(
            profileName: profileName,
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath,
            credentialFeatureIDs: [CredentialFeatureID.CREDENTIALS_LOGIN.rawValue]
        )
    }

    // Initializer used by profile chain reoslver.
    internal init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        credentialFeatureIDs: [String]
    ) throws {
        self.profileName = profileName
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.credentialFeatureIDs = credentialFeatureIDs
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        let resolvedProfileName = self.profileName ?? ProcessInfo.processInfo.environment["AWS_PROFIE"] ?? "default"

        // Load cached login token.
        let loginSession = try getLoginSessionFromConfig(resolvedProfileName, fileBasedConfig)
        let loginTokenFileURL = try constructLoginTokenFileURL(loginSession)
        let loginToken = try loadLoginToken(resolvedProfileName, loginTokenFileURL)

        // Return immediately if refresh isn't needed.
        if !loginToken.needsRefresh() {
            return loginToken.constructAWSCredentialIdentity(
                credentialFeatureIDs: credentialFeatureIDs
            )
        }

        // If refresh succeeds, return new credentials.
        // If refresh fails and token is expired, throw an error.
        // If refresh fails and token hasn't expired yet, return old creds.
        do {
            return try await refreshAndCacheLoginToken(
                resolvedProfileName,
                loginTokenFileURL
            ).constructAWSCredentialIdentity(
                credentialFeatureIDs: credentialFeatureIDs
            )
        } catch {
            if loginToken.tokenIsExpired() {
                throw error
            } else {
                return loginToken.constructAWSCredentialIdentity(
                    credentialFeatureIDs: credentialFeatureIDs
                )
            }
        }
    }

    private func getLoginSessionFromConfig(
        _ profileName: String,
        _ fileBasedConfig: CRTFileBasedConfiguration
    ) throws -> String {
        guard let value = fileBasedConfig
            .getSection(name: profileName, sectionType: .profile)?
            .getProperty(name: "login_session")?
            .value
        else {
            throw ClientError.dataNotFound(
                "LoginAWSCredentialIdentityResolver: "
                + "Failed to retrieve login_session from profile '\(profileName)'"
            )
        }
        return value
    }

    private func constructLoginTokenFileURL(_ loginSession: String) throws -> URL {
        let tokenFileName = try loginSession.data(using: .utf8)!.computeSHA256().encodeToHexString() + ".json"

        // Return early if user configured a directory override for the login token.
        if let directoryOverride = ProcessInfo.processInfo.environment["AWS_LOGIN_CACHE_DIRECTORY"] {
            return URL(fileURLWithPath: directoryOverride.appendingPathComponent(tokenFileName))
        }

        // Get the login token file URL.
        #if os(macOS) || os(Linux)
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        #else
        let homeDir = URL(fileURLWithPath: NSHomeDirectory(), isDirectory: true)
        #endif
        let relativePath = ".aws/login/cache/\(tokenFileName)"
        return homeDir.appendingPathComponent(relativePath)
    }

    private func loadLoginToken(_ profileName: String, _ fileURL: URL) throws -> LoginToken {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .custom { decoder in
                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)
                let formatter = ISO8601DateFormatter()
                // Powershell saves expiration date with milliseconds.
                formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                if let date = formatter.date(from: dateString) {
                    return date
                }
                // AWS CLI saves expiration date without milliseconds.
                // Because setting .withFractionalSeconds is a strict requirement, must remove it for AWS CLI expiration date.
                formatter.formatOptions = [.withInternetDateTime]
                guard let date = formatter.date(from: dateString) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format")
                }
                return date
            }
            return try decoder.decode(LoginToken.self, from: data)
        } catch {
            throw ClientError.dataNotFound(
                "LoginAWSCredentialIdentityResolver: "
                + "Failed to load a login token for profile '\(profileName)', please reauthenticate."
            )
        }
    }

    private func refreshAndCacheLoginToken(
        _ profileName: String,
        _ loginTokenFileURL: URL
    ) async throws -> LoginToken {
        // Reload the token to ensure it hasn't already been refreshed.
        let loginToken = try loadLoginToken(profileName, loginTokenFileURL)
        if !loginToken.needsRefresh() {
            return loginToken
        }

        // Call CreateOAuth2Token with SignIn client to refresh token.
        let clientConfig = try await SigninClient.SigninClientConfiguration()
        clientConfig.addInterceptorProvider(DPoPInterceptorProvider(dpopKey: loginToken.dpopKey))
        clientConfig.addInterceptorProvider(
            CredentialFeatureIDInterceptorProvider(featureIDsToAdd: credentialFeatureIDs)
        )
        let client = SigninClient(config: clientConfig)
        let output = try await client.createOAuth2Token(input: CreateOAuth2TokenInput(
            tokenInput: SigninClientTypes.CreateOAuth2TokenRequestBody(
                clientId: loginToken.clientId,
                grantType: "refresh_token",
                refreshToken: loginToken.refreshToken
            )
        ))

        // Construct a new LoginToken using values from CreateOAuth2TokenOutput
        guard let accessKey = output.tokenOutput?.accessToken?.accessKeyId else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "LoginAWSCredentialIdentityResolver: "
                + "Missing accessKeyId in AWS Signin response. Failed to create a new login token."
            )
        }

        guard let secretKey = output.tokenOutput?.accessToken?.secretAccessKey else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "LoginAWSCredentialIdentityResolver: "
                + "Missing secretAccessKey in AWS Signin response. Failed to create a new login token."
            )
        }

        guard let sessionToken = output.tokenOutput?.accessToken?.sessionToken else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "LoginAWSCredentialIdentityResolver: "
                + "Missing sessionToken in AWS Signin response. Failed to create a new login token."
            )
        }

        guard let expiresAt = output.tokenOutput?.expiresIn else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "LoginAWSCredentialIdentityResolver: "
                + "Missing expiresIn in AWS Signin response. Failed to create a new login token."
            )
        }

        guard let refreshToken = output.tokenOutput?.refreshToken else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "LoginAWSCredentialIdentityResolver: "
                + "Missing refreshToken in AWS Signin response. Failed to create a new login token."
            )
        }

        let refreshedLoginToken = LoginToken(
            accessToken: AccessToken(
                accessKeyId: accessKey,
                secretAccessKey: secretKey,
                sessionToken: sessionToken,
                accountId: loginToken.accessToken.accountId,
                expiresAt: Date().addingTimeInterval(Double(expiresAt))
            ),
            tokenType: loginToken.tokenType,
            refreshToken: refreshToken,
            idToken: loginToken.idToken,
            clientId: loginToken.clientId,
            dpopKey: loginToken.dpopKey
        )

        // Write the new LoginToken to loginTokenFileURL & return the new LoginToken.
        try refreshedLoginToken.save(to: loginTokenFileURL)
        return refreshedLoginToken
    }
}

/*
    LOGIN TOKEN & NESTED ACCESS TOKEN
 */

struct LoginToken: Codable {
    let accessToken: AccessToken
    let tokenType: String
    let refreshToken: String
    let idToken: String
    let clientId: String
    let dpopKey: String

    // Returns true if token is expired or will expire within 5 minutes.
    func needsRefresh() -> Bool {
        let fiveMinutesFromNow = Date().addingTimeInterval(300)
        return accessToken.expiresAt <= fiveMinutesFromNow
    }

    func tokenIsExpired() -> Bool {
        return Date() > accessToken.expiresAt
    }

    func save(to fileURL: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(self)
        try data.write(to: fileURL, options: [.atomic])
    }

    func constructAWSCredentialIdentity(
        credentialFeatureIDs: [String]
    ) -> AWSCredentialIdentity {
        var properties = Smithy.Attributes()
        properties.set(
            key: AWSIdentityPropertyKeys.credentialFeatureIDs,
            value: credentialFeatureIDs
        )
        return AWSCredentialIdentity(
            accessKey: accessToken.accessKeyId,
            secret: accessToken.secretAccessKey,
            accountID: accessToken.accountId,
            expiration: accessToken.expiresAt,
            sessionToken: accessToken.sessionToken,
            properties: properties
        )
    }
}

struct AccessToken: Codable {
    let accessKeyId: String
    let secretAccessKey: String
    let sessionToken: String
    let accountId: String
    let expiresAt: Date
}

/*
    HEADER & PAYLOAD STRUCTS FOR DPOP GENERATION
 */

struct JWTHeader: Encodable {
    let typ = "dpop+jwt"
    let alg = "ES256"
    let jwk: JWK
}

struct JWK: Encodable {
    let kty = "EC"
    let x: String
    let y: String
    let crv = "P-256"
}

struct JWTPayload: Encodable {
    let jti = UUID().uuidString
    let htm = "POST"
    let htu: String
    let iat: Int
}

/*
    INTERCEPTOR TO CALCULATE & INJECT DPoP HEADER TO REQUEST
 */

private extension Data {
    func base64URLEncodedString() -> String {
        return self.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}

private extension String {
    func minimize() -> String {
        self.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "\t", with: "")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\r", with: "")
    }
}

class DPoPInterceptor<InputType, OutputType>: Interceptor {
    typealias RequestType = SmithyHTTPAPI.HTTPRequest
    typealias ResponseType = HTTPResponse

    let dpopKey: String

    init(dpopKey: String) {
        self.dpopKey = dpopKey
    }

    // Convert PEM to DER
    func pemToDer(_ pemString: String) -> Data? {
        let lines = pemString.components(separatedBy: .newlines)
        let base64String = lines
            .filter { !$0.hasPrefix("-----") && !$0.isEmpty }
            .joined()
        return Data(base64Encoded: base64String)
    }

    func calculateDPoP(
        dpopKey: String,
        endpoint: String
    ) throws -> String {
        guard let derData = pemToDer(dpopKey) else {
            throw ClientError.invalidValue(
                "LoginAWSCredentialIdentityResolver: "
                + "Invalid dpopKey in cached login token."
            )
        }

        // Extract x and y coordinates from dpopKey (EC private key)
        let keyPair = try ECKeyPair.fromDer(data: derData)
        let publicCoords = try keyPair.getPublicCoords()
        let x = publicCoords.x.base64URLEncodedString()
        let y = publicCoords.y.base64URLEncodedString()

        // Create header & payload
        let header = JWTHeader(jwk: JWK(x: x, y: y))
        let payload = JWTPayload(htu: endpoint, iat: Int(Date().timeIntervalSince1970))

        // Create message to sign
        let encodedHeader = try JSONEncoder().encode(header).base64URLEncodedString()
        let encodedPayload = try JSONEncoder().encode(payload).base64URLEncodedString()
        let message = encodedHeader + "." + encodedPayload

        // Get JWT signature
        let messageDigest = try message.data(using: .utf8)!.computeSHA256()
        let signature = try keyPair.sign(digest: messageDigest)
        let decodedSignature = try ECKeyPair.decodeDerEcSignature(signature: signature)
        let r = decodedSignature.r
        let s = decodedSignature.s
        let jwtSignature = (r + s).base64URLEncodedString()

        // Return DPoP string
        return message + "." + jwtSignature
    }

    func modifyBeforeTransmit(context: some MutableRequest<InputType, RequestType>) async throws {
        let request = context.getRequest()
        let htu = request.endpoint.url!.absoluteString
        let dpopString = try calculateDPoP(dpopKey: dpopKey, endpoint: htu)
        request.withHeader(name: "DPoP", value: dpopString)
    }

}

class DPoPInterceptorProvider: HttpInterceptorProvider {
    let dpopKey: String

    init(dpopKey: String) {
        self.dpopKey = dpopKey
    }

    func create<InputType, OutputType>() -> any Interceptor<
        InputType, OutputType, SmithyHTTPAPI.HTTPRequest, HTTPResponse
    > {
        return DPoPInterceptor(dpopKey: dpopKey)
    }
}
