//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// ISO8601DateFormatter isn't Sendable yet.  It is only used on macOS 11, where Date.ISO8601FormatStyle
// is unavailable.
@preconcurrency import Foundation

/// Parses RFC 3339 timestamps, with or without fractional seconds.
public enum RFC3339DateParser {

    /// Parses an RFC 3339 timestamp such as `2024-07-15T12:30:45Z` or `2024-07-15T12:30:45.123Z`.
    /// - Parameter string: The timestamp to parse.
    /// - Returns: The parsed date, or `nil` if `string` is not a valid RFC 3339 timestamp.
    public static func parse(_ string: String) -> Date? {
        if #available(macOS 12, *) {
            return (try? Date(string, strategy: Date.ISO8601FormatStyle()))
                ?? (try? Date(string, strategy: Date.ISO8601FormatStyle(includingFractionalSeconds: true)))
        } else {
            return legacyWithoutFractional.date(from: string)
                ?? legacyWithFractional.date(from: string)
        }
    }

    // MARK: - macOS 11 fallback

    private static let legacyWithFractional: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return f
    }()

    private static let legacyWithoutFractional: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime]
        return f
    }()
}
