//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Smithy.Attributes
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

public struct ECSAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let urlSession: URLSession
    private let maxRetries: Int

    public init(
        urlSession: URLSession? = nil,
        maxRetries: Int = 3
    ) {
        self.urlSession = urlSession ?? URLSession.shared
        self.maxRetries = maxRetries
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        // 1. Get URI configured via environment variables.
        let (resolvedURL, authToken) = try resolveURLAndOptionalAuthToken()

        // 2. Validate resolved URL before proceeding.
        try validateResolvedURL(resolvedURL)

        // 3. Create URLRequest; add Authorization header if applicable.
        var request = URLRequest(url: resolvedURL)
        if let authToken {
            request.addValue(authToken, forHTTPHeaderField: "Authorization")
        }

        // 4. Send the URLRequest; retry 3 times max.
        var backoff: TimeInterval = 0.1
        for _ in 0..<maxRetries {
            do {
                return try await fetchCredentials(request: request)
            } catch {
                try? await Task.sleep(nanoseconds: UInt64(backoff * 1_000_000_000))
                backoff *= 2
            }
        }
        return try await fetchCredentials(request: request)
    }

    private func resolveURLAndOptionalAuthToken() throws -> (URL, String?) {
        var resolvedURI: String
        var authToken: String?

        if let relativeURI = ProcessInfo.processInfo.environment["AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"] {
            resolvedURI = "http://169.254.170.2" + relativeURI // Prefix it with ECS container host.
        } else if let fullURI = ProcessInfo.processInfo.environment["AWS_CONTAINER_CREDENTIALS_FULL_URI"] {
            resolvedURI = fullURI
            authToken = try resolveAuthToken()
        } else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: Couldn't initialize. "
                + "Neither AWS_CONTAINER_CREDENTIALS_RELATIVE_URI nor "
                + "AWS_CONTAINER_CREDENTIALS_FULL_URI environment variables were set."
            )
        }
        guard let resolvedURL = URL(string: resolvedURI) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Could not create URL from resolved URI."
            )
        }
        return (resolvedURL, authToken)
    }

    private func resolveAuthToken() throws -> String? {
        if let token = try readTokenFromFile() ?? readTokenFromEnvironment() {
            try validateToken(token)
            return token
        }
        return nil
    }

    private func readTokenFromFile() throws -> String? {
        guard let tokenFilePath = ProcessInfo.processInfo.environment["AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE"] else {
            return nil
        }
        do {
            let fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: tokenFilePath))
            let data = fileHandle.readDataToEndOfFile()
            return String(data: data, encoding: .utf8)?.trimmingCharacters(in: .newlines)
        } catch {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: Failed to read authorization token file from configured path."
            )
        }
    }

    private func readTokenFromEnvironment() -> String? {
        ProcessInfo.processInfo.environment["AWS_CONTAINER_AUTHORIZATION_TOKEN"]
    }

    private func validateToken(_ token: String) throws {
        guard !token.contains(where: { $0.isNewline }) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: Resolved auth token contains a newline character, making it invalid."
            )
        }
    }

    private func validateResolvedURL(_ resolvedURL: URL) throws {
        guard let host = resolvedURL.host else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Resolved URL does not have a host."
            )
        }

        // Must fail if host isn't IP address & scheme isn't HTTPS.
        if resolvedURL.scheme != "https" && !isIPv4Address(host) {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Resolved URL has HTTP scheme with host that isn't an IP address."
            )
        } else if !isIPv4Address(host) {
            return
        }

        // Must fail if host is IP address and doesn't match one of the three conditions below.
        guard host == "169.254.170.2" // ECS container host.
            || host == "169.254.170.23" // EKS container host.
            || host.split(separator: ".").first == "127" else { // Loopback CIDR.
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "The IP address in resolved URL is invalid. "
                + "It must be within loopback CIDR 127.0.0.0/8, "
                + "or be the ECS container host 169.254.170.2, "
                + "or be the EKS container host 169.254.170.23."
            )
        }
    }

    private func isIPv4Address(_ host: String) -> Bool {
        // Regex pattern that checks string of pattern X.X.X.X where X is an integer between 0 and 255.
        let pattern = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}"
        + "([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
        return host.range(of: pattern, options: .regularExpression) != nil
    }

    private func fetchCredentials(request: URLRequest) async throws -> AWSCredentialIdentity {
        // If status code is 200, parse response payload into AWS credentials and return it.
        do {
            let (data, response) = try await urlSession.asyncData(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "ECSAWSCredentialIdentityResolver: "
                    + "Could not retrieve credentials from resolved URL."
                )
            }

            // Parse response into AWS credentials and return it.
            let jsonCredentialResponse = try JSONDecoder().decode(
                JSONCredentialResponse.self,
                from: data
            )
            var properties = Attributes()
            properties.set(key: AWSIdentityPropertyKeys.credentialFeatureIDs, value: [CredentialFeatureID.CREDENTIALS_HTTP.rawValue])
            return AWSCredentialIdentity(
                accessKey: jsonCredentialResponse.accessKeyID,
                secret: jsonCredentialResponse.secretAccessKey,
                accountID: jsonCredentialResponse.accountID,
                expiration: jsonCredentialResponse.expiration,
                sessionToken: jsonCredentialResponse.sessionToken,
                properties: properties
            )
        } catch {
            // Handle network errors (not HTTP status errors).
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Failed to retrieve credentials: \(error)"
            )
        }
    }
}

// Serde utility for decoding JSON credential response from HTTP endpoint.
private struct JSONCredentialResponse: Codable {
    let accessKeyID: String
    let secretAccessKey: String
    let sessionToken: String?
    let expiration: Date?
    let accountID: String?

    enum CodingKeys: String, CodingKey {
        case accessKeyID = "AccessKeyId"
        case secretAccessKey = "SecretAccessKey"
        case sessionToken = "Token"
        case expiration = "Expiration"
        case accountID = "AccountId"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Required fields
        accessKeyID = try container.decode(String.self, forKey: .accessKeyID)
        secretAccessKey = try container.decode(String.self, forKey: .secretAccessKey)

        // Optional fields
        sessionToken = try container.decodeIfPresent(String.self, forKey: .sessionToken)
        accountID = try container.decodeIfPresent(String.self, forKey: .accountID)

        // Handle the Expiration field which is a string in ISO8601 format.
        if let expirationString = try container.decodeIfPresent(String.self, forKey: .expiration) {
            let formatter = ISO8601DateFormatter()
            expiration = formatter.date(from: expirationString)
        } else {
            expiration = nil
        }
    }
}
