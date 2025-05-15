//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.HTTPURLResponse
import class Foundation.URLSession
import enum SmithyHTTPAPI.HTTPStatusCode
import struct Foundation.Data
import struct Foundation.URL
import struct Foundation.URLRequest
#if os(Linux)
import FoundationNetworking // For URLSession in Linux.
#endif

// Header required for fetching the session token.
let X_AWS_EC2_METADATA_TOKEN_TTL_SECONDS = "x-aws-ec2-metadata-token-ttl-seconds"

public actor IMDSTokenProvider {
    private var cachedToken: IMDSToken?
    private let endpoint: URL
    private let ttl: Int

    public init(
        endpoint: URL,
        ttl: Int
    ) {
        self.endpoint = endpoint
        self.ttl = ttl
    }

    public func getToken() async throws -> IMDSToken {
        if let cachedToken, !cachedToken.shouldRefresh() {
            return cachedToken
        }

        let request = constructTokenRequest()
        do {
            let (data, response) = try await fetchTokenResponse(request: request)
            return try await processTokenResponse(data: data, response: response)
        } catch let error as IMDSError {
            throw error
        } catch { // Catches errors raised when sending URLRequest.
            throw IMDSError.networkError(error)
        }
    }

    private func constructTokenRequest() -> URLRequest {
        var request = URLRequest(
            url: endpoint.appendingPathComponent("/latest/api/token")
        )
        request.httpMethod = "PUT"
        request.addValue(String(Int(ttl)), forHTTPHeaderField: X_AWS_EC2_METADATA_TOKEN_TTL_SECONDS)
        request.addValue("aws-sdk-swift ua/2.1 api/imds", forHTTPHeaderField: "User-Agent")
        return request
    }

    private func fetchTokenResponse(
        request: URLRequest
    ) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw IMDSError.deserializationError(
                "IMDSTokenProvider: "
                + "Failed to cast response from IMDS into HTTPURLResponse."
            )
        }
        return (data, httpResponse)
    }

    private func processTokenResponse(
        data: Data,
        response: HTTPURLResponse
    ) async throws -> IMDSToken {
        switch response.statusCode {
        case 200: // Success.
            guard
                let ttlStr = response.value(
                    forHTTPHeaderField: X_AWS_EC2_METADATA_TOKEN_TTL_SECONDS
                ),
                let ttl = Int(ttlStr),
                let tokenStr = String(data: data, encoding: .utf8)
            else {
                throw IMDSError.deserializationError(
                    "IMDSTokenProvider: "
                    + "Failed to retrieve IMDS token."
                )
            }
            let token = IMDSToken(value: tokenStr, ttl: ttl)
            cachedToken = token
            return token
        case 403: // Forbidden.
            let errorMessage = "IMDSTokenProvider: "
            + "IMDS is disabled or the caller has insufficient permissions."
            throw IMDSError.token(.nonRetryable(errorMessage))
        default:
            throw IMDSError.token(.retryable)
        }
    }
}
