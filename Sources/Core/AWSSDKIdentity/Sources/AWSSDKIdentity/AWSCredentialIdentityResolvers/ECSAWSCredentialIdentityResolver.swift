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
    public init() {}

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
        for attempt in 0...3 {
            do {
                return try await fetchCredentials(request: request)
            } catch {
                if (attempt == 3) {
                    throw error
                }
            }
        }

        // Not reachable; added to quiet compiler.
        throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
            "ECSAWSCredentialIdentityResolver: "
            + "Failed to resolve credentials after 3 retries."
        )
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
        let resolvedToken: String?

        // 1. Attempt to read from file first.
        if let tokenFilePath = ProcessInfo.processInfo.environment["AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE"] {
            do {
                let fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: tokenFilePath))
                resolvedToken = String(data: fileHandle.readDataToEndOfFile(), encoding: .utf8)
            } catch {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "ECSAWSCredentialIdentityResolver: "
                    + "Failed to read authorization token file from configured path."
                )
            }
        // 2. Attempt to read directly from env var.
        } else if let token = ProcessInfo.processInfo.environment["AWS_CONTAINER_AUTHORIZATION_TOKEN"] {
            resolvedToken = token
        } else {
            return nil
        }

        // 3. Validate resolved token.
        guard let resolvedToken, isSingleLine(resolvedToken) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Resolved auth token contains a newline character, making it invalid."
            )
        }
        return resolvedToken
    }

    private func isSingleLine(_ string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.newlines) == nil
    }

    private func validateResolvedURL(_ resolvedURL: URL) throws {
        guard let host = resolvedURL.host else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Resolved URL does not have a host."
            )
        }

        // Must fail if host isn't IP address & scheme is HTTP.
        if resolvedURL.scheme == "http" && !isIPv4Address(host) {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Resolved URL has HTTP scheme with host that isn't an IP address."
            )
        } else if !isIPv4Address(host) {
            return
        }

        // Must fail if host is IP address and doesn't match one of the three conditions below.
        guard host != "169.254.170.2"
            && host != "169.254.170.23"
            && host.split(separator: ".").first != "127" else {
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
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "ECSAWSCredentialIdentityResolver: "
                    + "Could not retrieve credentials from resolved URL."
                )
            }

            // 5. Parse response into AWS credentials and return it.
            let jsonCredentialResponse = try JSONDecoder().decode(
                JSONCredentialResponse.self,
                from: data
            )
            return AWSCredentialIdentity(
                accessKey: jsonCredentialResponse.accessKeyID,
                secret: jsonCredentialResponse.secretAccessKey,
                accountID: jsonCredentialResponse.accountID,
                expiration: jsonCredentialResponse.expiration,
                sessionToken: jsonCredentialResponse.sessionToken
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
