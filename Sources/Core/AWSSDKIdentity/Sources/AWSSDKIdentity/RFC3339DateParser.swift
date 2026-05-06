// ISO8601DateFormatter isn't Sendable yet.
import struct Foundation.Date
@preconcurrency import class Foundation.ISO8601DateFormatter

public enum RFC3339DateParser {

    public static func parse(_ string: String) -> Date? {
        rfc3339DateFormatterWithoutFractional.date(from: string)
        ?? rfc3339DateFormatterWithFractional.date(from: string)
    }
}

private let rfc3339DateFormatterWithFractional: ISO8601DateFormatter = {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return dateFormatter
}()

private let rfc3339DateFormatterWithoutFractional: ISO8601DateFormatter = {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withInternetDateTime]
    return dateFormatter
}()

// Foundation.ISO8601DateFormatter is not Sendable, because it has configuration
// properties that do not lock.  It can be treated as Sendable so long as its
// configuration is not changed from multiple threads.
//
// To avoid this, we configure our ISO8601DateFormatters immediately after
// initialization, then config is not changed.
extension Foundation.ISO8601DateFormatter: @retroactive @unchecked Sendable {}
