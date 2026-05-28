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

    /// Tests must reset to `nil` (e.g. in `tearDown`) so the next test
    /// starts from the env-var-derived default.  XCTest runs tests serially,
    /// so the unsynchronized access here is safe in the single test-process
    /// model.  Do not read or write outside of test setup/teardown.
    @_spi(Testing) public nonisolated(unsafe) static var testingOverride: Bool?
}
