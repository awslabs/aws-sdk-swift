//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo

/// Reads opt-in flags from the environment.  Each flag is read once on first
/// access and cached for the lifetime of the process.  Only the literal string
/// `"true"` enables a flag — any other value (including unset) leaves it off.
public enum AWSRetryFeatures {

    /// Set to true via `AWS_NEW_RETRIES_2026=true`.  See
    /// `RetryStrategyOptions.useNewRetries2026` for the behavior it enables.
    public static var isNewRetries2026Enabled: Bool {
        testingOverride ?? cachedNewRetries2026
    }

    private static let cachedNewRetries2026: Bool = {
        ProcessInfo.processInfo.environment["AWS_NEW_RETRIES_2026"] == "true"
    }()

    /// XCTest serial execution makes the unsynchronized access safe.
    /// Reset to `nil` in `tearDown`; do not touch outside test setup/teardown.
    #if swift(>=5.10)
    @_spi(Testing) public nonisolated(unsafe) static var testingOverride: Bool?
    #else
    @_spi(Testing) public static var testingOverride: Bool?
    #endif
}
