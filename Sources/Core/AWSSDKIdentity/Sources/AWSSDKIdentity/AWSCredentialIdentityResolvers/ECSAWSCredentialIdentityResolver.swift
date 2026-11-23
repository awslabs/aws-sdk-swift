//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AwsCommonRuntimeKit.HostResolverArguments
import class ClientRuntime.SDKDefaultIO
import Foundation
import struct Smithy.Attributes
import protocol SmithyIdentity.AWSCredentialIdentityResolver
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

public struct ECSAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let urlSession: URLSession
    private let maxRetries: Int
    private let resolveHost: @Sendable (String) async throws -> [String]

    public init(
        urlSession: URLSession? = nil,
        maxRetries: Int = 3
    ) {
        self.init(urlSession: urlSession, maxRetries: maxRetries, resolveHost: Self.resolveHostWithCRT)
    }

    /// - Parameter resolveHost: Resolves a host name to its IP addresses. Injectable for testing.
    init(
        urlSession: URLSession?,
        maxRetries: Int,
        resolveHost: @escaping @Sendable (String) async throws -> [String]
    ) {
        self.urlSession = urlSession ?? URLSession.shared
        self.maxRetries = maxRetries
        self.resolveHost = resolveHost
    }

    private static func resolveHostWithCRT(_ host: String) async throws -> [String] {
        try await SDKDefaultIO.shared.hostResolver
            .resolveAddress(args: HostResolverArguments(hostName: host))
            .map(\.address)
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        // 1. Get URI configured via environment variables.
        let (resolvedURL, authToken) = try resolveURLAndOptionalAuthToken()

        // 2. Validate resolved URL before proceeding.
        try await validateResolvedURL(resolvedURL)

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

    private func validateResolvedURL(_ resolvedURL: URL) async throws {
        guard let host = resolvedURL.host, !host.isEmpty else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Resolved URL does not have a host."
            )
        }

        // Any host is allowed over HTTPS. URL schemes are case-insensitive (RFC 3986).
        if resolvedURL.scheme?.lowercased() == "https" { return }

        // If host is an IP address, it must be one of the allowed IP addresses.
        if let ipAddress = Self.ipAddressBytes(host) {
            guard isAllowedIPAddress(ipAddress) else {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "ECSAWSCredentialIdentityResolver: "
                    + "The IP address in resolved URL is invalid. "
                    + "It must be within loopback CIDR 127.0.0.0/8 or ::1/128, "
                    + "or be the ECS container host 169.254.170.2, "
                    + "or be the EKS container host 169.254.170.23 or fd00:ec2::23."
                )
            }
            return
        }

        // Otherwise host is a host name (e.g. `localhost`); every IP address it resolves to must be allowed.
        let resolvedAddresses: [String]
        do {
            resolvedAddresses = try await resolveHost(host)
        } catch {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "Failed to resolve the host in resolved URL to an IP address: \(error)"
            )
        }
        let allResolvedAddressesAllowed = resolvedAddresses.allSatisfy { address in
            Self.ipAddressBytes(address).map(isAllowedIPAddress) ?? false
        }
        guard !resolvedAddresses.isEmpty, allResolvedAddressesAllowed else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ECSAWSCredentialIdentityResolver: "
                + "The host in resolved URL does not resolve exclusively to allowed IP addresses. "
                + "It must resolve within loopback CIDR 127.0.0.0/8 or ::1/128, "
                + "or to the ECS container host 169.254.170.2, "
                + "or to the EKS container host 169.254.170.23 or fd00:ec2::23."
            )
        }
    }

    private func isAllowedIPAddress(_ ipAddress: [UInt8]) -> Bool {
        let isIPv4Loopback = ipAddress.count == 4 && ipAddress[0] == 127 // Loopback CIDR 127.0.0.0/8.
        return isIPv4Loopback || Self.allowedIPAddresses.contains(ipAddress)
    }

    /// IP addresses allowed over HTTP in addition to the IPv4 loopback CIDR.
    ///
    /// - ECS container host: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html
    /// - EKS Pod Identity Agent (IPv4 and IPv6):
    ///   https://docs.aws.amazon.com/eks/latest/userguide/pod-id-agent-setup.html
    private static let allowedIPAddresses: [[UInt8]] = [
        "169.254.170.2", // ECS container host.
        "169.254.170.23", // EKS Pod Identity Agent (IPv4).
        "fd00:ec2::23", // EKS Pod Identity Agent (IPv6).
        "::1", // IPv6 loopback.
    ].compactMap(ipAddressBytes)

    /// Parses an IPv4 (dotted-decimal) or IPv6 address literal.
    ///
    /// `URL.host` returns IPv6 address literals without the enclosing square brackets, so `host` is expected to be
    /// unbracketed.
    ///
    /// - Returns: The address bytes in network byte order (4 bytes for IPv4, 16 bytes for IPv6),
    ///   or `nil` if `host` is not an IP address literal.
    private static func ipAddressBytes(_ host: String) -> [UInt8]? {
        var ipv4 = in_addr()
        if inet_pton(AF_INET, host, &ipv4) == 1 {
            return withUnsafeBytes(of: &ipv4) { Array($0) }
        }
        var ipv6 = in6_addr()
        if inet_pton(AF_INET6, host, &ipv6) == 1 {
            return withUnsafeBytes(of: &ipv6) { Array($0) }
        }
        return nil
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
            properties.set(
                key: AWSIdentityPropertyKeys.credentialFeatureIDs,
                value: [CredentialFeatureID.CREDENTIALS_HTTP.rawValue]
            )
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
            expiration = RFC3339DateParser.parse(expirationString)
        } else {
            expiration = nil
        }
    }
}
