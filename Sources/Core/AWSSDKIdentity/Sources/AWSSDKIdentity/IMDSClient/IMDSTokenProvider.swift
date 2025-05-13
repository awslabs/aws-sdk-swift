//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.HTTPURLResponse
import class Foundation.URLSession
import enum Smithy.ClientError
import enum SmithyHTTPAPI.HTTPStatusCode
import struct Foundation.TimeInterval
import struct Foundation.URL
import struct Foundation.URLRequest
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

// Header required for fetching token.
let X_AWS_EC2_METADATA_TOKEN_TTL_SECONDS = "x-aws-ec2-metadata-token-ttl-seconds"

public class IMDSTokenProvider {
    private var cachedToken: IMDSToken?
    private let endpoint: URL
    private let ttl: TimeInterval

    public init(
        endpoint: URL,
        ttl: TimeInterval
    ) {
        self.endpoint = endpoint
        self.ttl = ttl
    }

    public func getToken() async throws -> IMDSToken {
        if let cachedToken, !cachedToken.shouldRefresh() {
            return cachedToken
        }

        var request = URLRequest(
            url: endpoint.appendingPathComponent("/latest/api/token")
        )
        request.httpMethod = "PUT"
        request.addValue(String(Int(ttl)), forHTTPHeaderField: X_AWS_EC2_METADATA_TOKEN_TTL_SECONDS)
        request.addValue("aws-sdk-swift ua/2.1 api/imds", forHTTPHeaderField: "User-Agent")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw IMDSError.deserializationError(
                    "IMDSTokenProvider: "
                    + "Could not retrieve HTTP response from IMDS."
                )
            }

            let genericErrorMessage = "IMDSTokenProvider: "
            + "Failed to retrieve IMDS token."
            switch httpResponse.statusCode {
            case 200: // Success.
                guard
                    let ttlStr = httpResponse.value(
                        forHTTPHeaderField: X_AWS_EC2_METADATA_TOKEN_TTL_SECONDS
                    ),
                    let ttl = TimeInterval(ttlStr),
                    let tokenStr = String(data: data, encoding: .utf8)
                else {
                    throw IMDSError.deserializationError(genericErrorMessage)
                }
                
                let token = IMDSToken(value: tokenStr, ttl: ttl)
                cachedToken = token
                return token
            case 403: // Forbidden.
                let errorMessage = "IMDSTokenProvider: "
                + "IMDS is disabled or the caller has insufficient permissions."
                throw IMDSError.token(.nonRetryable(errorMessage))
            default:
                throw IMDSError.token(.nonRetryable(genericErrorMessage))
            }
        } catch let error as IMDSError {
            throw error
        } catch {
            throw IMDSError.networkError(error)
        }
    }
}
