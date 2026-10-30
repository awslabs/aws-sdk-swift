//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Kept for source compatibility only.  Nothing in the SDK reads it.
public enum AWSRetryFeatures {

    /// Always `true`.  Retry Behavior 2.1 is the default for the `standard` and `adaptive` retry modes.
    @available(*, deprecated, message: """
    AWS_NEW_RETRIES_2026 is no longer read. Retry Behavior 2.1 is the default; set the retry mode to legacy to opt out.
    """)
    public static var isNewRetries2026Enabled: Bool { true }
}
