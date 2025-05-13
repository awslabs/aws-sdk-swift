//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import struct Foundation.TimeInterval

// The period of time before the token expires, where token is refreshed regardless.
// Prevents token expiration during in-flight requests.
public let TOKEN_REFRESH_BUFFER: TimeInterval = 120

public struct IMDSToken {
    public let value: String
    public let needsRefreshAfter: Date

    public init(
        value: String,
        ttl: TimeInterval
    ) {
        self.value = value
        self.needsRefreshAfter = Date().addingTimeInterval(ttl - TOKEN_REFRESH_BUFFER)
    }

    public func shouldRefresh() -> Bool {
        return Date() > needsRefreshAfter
    }
}
