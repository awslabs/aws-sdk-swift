//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.HTTPURLResponse
import class Foundation.URLSession
import struct Foundation.TimeInterval
import struct Foundation.URL
import struct Foundation.URLRequest
import enum Smithy.ClientError
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

/// Maximum time allowed by default (6 hours).
public let DEFAULT_TOKEN_TTL: TimeInterval = 21_600
/// Maximum amount of retries by default.
public let DEFAULT_MAX_RETRIES: Int = 3
/// Default endpoint port.
public let DEFAULT_PORT: Int = 80

// Header required for fetching metadata.
let X_AWS_EC2_METADATA_TOKEN = "x-aws-ec2-metadata-token"

/// The name of the service `IMDSClient` is for. Included in User-Agent header of requests made by the client.
public let SERVICE_NAME = "IMDS"

/// The protocol for a generic instance metadata client.
public protocol InstanceMetadataProvider {
    func get(path: String) async throws -> String
}

/// The IMDSv2 Client.
///
/// This client supports fetching tokens, retrying failures, and caching token according to the configured TTL.
///
/// This client does not fall back to IMDSv1, and only supports IMDSv2.
/// See [transitioning to IMDSv2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#instance-metadata-transition-to-version-2) for more information.
public class IMDSClient: InstanceMetadataProvider {
    private let retries: Int
    private let endpointMode: IMDSEndpointMode
    private let endpoint: URL
    private let port: Int
    private let tokenTTL: TimeInterval
    private let tokenProvider: IMDSTokenProvider

    public init(
        retries: Int? = nil,
        endpointMode: IMDSEndpointMode? = nil,
        endpoint: URL? = nil,
        port: Int? = nil,
        tokenTTL: TimeInterval? = nil
    ) throws {
        self.retries = retries ?? DEFAULT_MAX_RETRIES
        guard self.retries > 0 else {
            throw ClientError.invalidValue(
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
        var delay: TimeInterval = 0.1

        while attempt < retries {
            do {
                let token = try await tokenProvider.getToken()

                var request = URLRequest(url: endpoint.appendingPathComponent(path))
                request.addValue(token.value, forHTTPHeaderField: X_AWS_EC2_METADATA_TOKEN)
                request.addValue("aws-sdk-swift ua/2.1 api/\(SERVICE_NAME)", forHTTPHeaderField: "User-Agent")

                let (data, response) = try await URLSession.shared.data(for: request)

                guard let httpResponse = response as? HTTPURLResponse else {
                    throw IMDSError.deserializationError(
                        "IMDSClient: "
                        + "Failed to receive HTTP response from IMDS."
                    )
                }

                switch httpResponse.statusCode {
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
                    + "Hint: ensure that the path is valid."
                    throw IMDSError.metadata(.nonRetryable(errorMessage))
                default:
                    let errorMessage = "IMDSClient: Failed to retrieve metadata."
                    throw IMDSError.metadata(.nonRetryable(errorMessage))
                }
            } catch let error as IMDSError {
                switch error {
                case .metadata(.retryable), .token(.retryable), .networkError:
                    attempt += 1
                    if attempt > retries { throw error }
                    try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                    delay *= 2
                default:
                    throw error
                }
            } catch {
                throw IMDSError.networkError(error)
            }
        }
        throw IMDSError.reachedMaxRetries
    }
}

public enum IMDSEndpointMode: String {
    case IPv4 = "http://169.254.169.254"
    case IPv6 = "http://[fd00:ec2::254]"
}
