//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.TimeInterval

/// Stores the most recent estimated skew for each host, for use in the `ttl` of the `amz-sdk-request` header.
///
/// This is the raw skew defined by the "Retry Information Header" SEP: the server's `Date` header minus
/// the local time the response was received.  It includes network latency and has no threshold applied.
/// It is separate from the clock skew used to correct SigV4 signing, which is only set after a clock
/// skew error and only when the skew exceeds a threshold.
actor EstimatedSkewStore {
    static let shared = EstimatedSkewStore()

    private var storage = [String: TimeInterval]()

    /// Create a new store.  Use `shared` except in tests.
    init() {}

    func estimatedSkew(host: String) -> TimeInterval? {
        storage[host]
    }

    func record(host: String, skew: TimeInterval) {
        storage[host] = skew
    }
}
