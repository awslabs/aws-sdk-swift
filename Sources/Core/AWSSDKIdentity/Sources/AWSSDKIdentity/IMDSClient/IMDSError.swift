//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum IMDSError: Error {
    public enum TokenError: Sendable {
        case retryable
        case nonRetryable(_ message: String)
    }

    public enum MetadataError: Sendable {
        case retryable
        case nonRetryable(_ message: String)
    }

    case token(TokenError)
    case metadata(MetadataError)
    case networkError(Error)
    case deserializationError(String)
    case reachedMaxRetries
    case invalidRetryValue(String)
    case invalidProfileName
    case failedToResolveProfileName
}
