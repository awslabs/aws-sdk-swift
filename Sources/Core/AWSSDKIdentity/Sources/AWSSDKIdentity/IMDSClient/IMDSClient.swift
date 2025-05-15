//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.HTTPURLResponse
import class Foundation.URLSession
import struct Foundation.Data
import struct Foundation.TimeInterval
import struct Foundation.URL
import struct Foundation.URLRequest
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

/// Maximum session token TTL allowed by default (6 hours).
public let DEFAULT_TOKEN_TTL: Int = 21_600
/// Maximum amount of retries by default.
public let DEFAULT_MAX_RETRIES: Int = 3
/// Default endpoint port.
public let DEFAULT_PORT: Int = 80
/// The name of the service `IMDSClient` is for. Included in User-Agent header of requests sent to IMDS.
public let SERVICE_NAME = "imds"
// Header required for fetching metadata.
let X_AWS_EC2_METADATA_TOKEN = "x-aws-ec2-metadata-token"

/// The protocol for a generic IMDS client.
public protocol EC2InstanceMetadataProvider: Sendable {
    func get(path: String) async throws -> String
}

/// The IMDS endpoint mode config enum for IMDS client.
public enum IMDSEndpointMode: String, Sendable {
    case IPv4 = "http://169.254.169.254"
    case IPv6 = "http://[fd00:ec2::254]"
}

/// The IMDSv2.1 Client.
///
/// This client supports fetching tokens, retrying failures, and caching token according to the configured TTL.
///
/// This client does not fall back to IMDSv1, and only supports IMDSv2 & IMDSv2.1.
/// See [transitioning to IMDSv2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#instance-metadata-transition-to-version-2) for more information.
public final class IMDSClient: EC2InstanceMetadataProvider {
    private let retries: Int
    private let endpointMode: IMDSEndpointMode
    private let endpoint: URL
    private let port: Int
    private let tokenTTL: Int
    private let tokenProvider: IMDSTokenProvider

    public init(
        retries: Int? = nil,
        endpointMode: IMDSEndpointMode? = nil,
        endpoint: URL? = nil,
        port: Int? = nil,
        tokenTTL: Int? = nil
    ) throws {
        self.retries = retries ?? DEFAULT_MAX_RETRIES
        guard self.retries > 0 else {
            throw IMDSError.invalidRetryValue(
                "IMDSClient: "
                + "Number of retries must be greater than zero."
            )
        }
        self.endpointMode = endpointMode ?? .IPv4
        self.endpoint = endpoint ?? URL(string: self.endpointMode.rawValue)!
        self.port = port ?? DEFAULT_PORT
        self.tokenTTL = tokenTTL ?? DEFAULT_TOKEN_TTL
        self.tokenProvider = IMDSTokenProvider(endpoint: self.endpoint, ttl: self.tokenTTL)
    }

    public func get(path: String) async throws -> String {
        var attempt = 0
        var backoff: TimeInterval = 0.1

        while attempt <= retries {
            do {
                let (data, response) = try await fetchMetadataResponse(path: path)
                return try await processMetadataResponse(path: path, data: data, response: response)
            } catch let error as IMDSError {
                try await handleErrors(attempt: &attempt, backoff: &backoff, error: error)
            }
        }
        throw IMDSError.reachedMaxRetries // Never reached; added to make compiler happy.
    }

    private func fetchMetadataResponse(path: String) async throws -> (Data, HTTPURLResponse) {
        let token = try await tokenProvider.getToken()

        var request = URLRequest(url: endpoint.appendingPathComponent(path))
        request.addValue(token.value, forHTTPHeaderField: X_AWS_EC2_METADATA_TOKEN)
        request.addValue("aws-sdk-swift ua/2.1 api/\(SERVICE_NAME)", forHTTPHeaderField: "User-Agent")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw IMDSError.deserializationError(
                    "IMDSClient: "
                    + "Failed to cast response from IMDS into HTTPURLResponse."
                )
            }
            return (data, httpResponse)
        } catch {
            throw IMDSError.networkError(error)
        }
    }

    private func processMetadataResponse(
        path: String,
        data: Data,
        response: HTTPURLResponse
    ) async throws -> String {
        switch response.statusCode {
        case 200:
            guard let metadata = String(data: data, encoding: .utf8) else {
                throw IMDSError.deserializationError(
                    "IMDSClient: Failed to decode metadata."
                )
            }
            return metadata
        case 401: // Unauthorized; raised if token has expired.
            throw IMDSError.metadata(.retryable)
        case 404: // Not Found; raised if metadata path is unrecognized by IMDS.
            let errorMessage = "IMDSClient: "
            + "Failed to retrieve metadata from the provided path \"\(path)\". "
            + "Hint: ensure that the path is valid. "
            + "Error code: 404"
            throw IMDSError.metadata(.nonRetryable(errorMessage))
        default:
            let errorMessage = "IMDSClient: Failed to retrieve metadata."
            throw IMDSError.metadata(.nonRetryable(errorMessage))
        }
    }

    private func handleErrors(
        attempt: inout Int,
        backoff: inout TimeInterval,
        error: IMDSError
    ) async throws {
        switch error {
        case .metadata(.retryable), .token(.retryable), .networkError, .deserializationError:
            attempt += 1
            if attempt > retries {
                throw IMDSError.reachedMaxRetries
            }
            try? await Task.sleep(nanoseconds: UInt64(backoff * 1_000_000_000))
            backoff *= 2
        default:
            throw error
        }
    }
}
