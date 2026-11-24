//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import struct Foundation.Date
import class Foundation.DateFormatter
import struct Foundation.Locale
import struct Foundation.TimeInterval
import struct Foundation.TimeZone
import Smithy
import SmithyHTTPAPI
@_spi(SmithyTimestamps) import struct SmithyTimestamps.TimestampFormatter

private let AMZ_SDK_REQUEST_HEADER = "amz-sdk-request"

/// Adds the `amz-sdk-request` header to requests, as defined in the "Retry Information Header" SEP.
///
/// The header always carries `attempt` and `max`.  It carries `ttl` when the operation is not streaming
/// and an estimated skew is known for the request's host, i.e. after at least one response has been
/// received from that host.  The estimated skew is measured on every response (see `readAfterTransmit`)
/// and is shared across operations, so `ttl` may be present on the first attempt of an operation.
public class AmzSdkRequestMiddleware<InputType, OperationStackOutput> {
    public var id: String { "AmzSdkRequest" }

    private let maxAttempts: Int
    private let socketTimeout: TimeInterval?
    private let isStreaming: Bool
    private let skewStore: EstimatedSkewStore
    private let now: @Sendable () -> Date
    private var attempt: Int = 0

    /// Creates a new `AmzSdkRequestMiddleware`.
    /// - Parameters:
    ///   - maxRetries: The maximum number of retries for the operation.
    ///   - socketTimeout: The HTTP client's socket read timeout, in seconds.  Used to calculate `ttl`;
    ///     `ttl` is omitted when this is `nil`.
    ///   - isStreaming: `true` if the operation has a streaming input or output.  `ttl` is omitted for streaming operations.
    public convenience init(maxRetries: Int, socketTimeout: TimeInterval? = nil, isStreaming: Bool = false) {
        self.init(
            maxRetries: maxRetries,
            socketTimeout: socketTimeout,
            isStreaming: isStreaming,
            skewStore: .shared,
            now: { Date() }
        )
    }

    init(
        maxRetries: Int,
        socketTimeout: TimeInterval?,
        isStreaming: Bool,
        skewStore: EstimatedSkewStore,
        now: @escaping @Sendable () -> Date
    ) {
        self.maxAttempts = maxRetries + 1
        self.socketTimeout = socketTimeout
        self.isStreaming = isStreaming
        self.skewStore = skewStore
        self.now = now
    }

    private func headerValue(host: String) async -> String {
        var pairs = [String]()
        if !isStreaming,
           let socketTimeout,
           let estimatedSkew = await skewStore.estimatedSkew(host: host) {
            let ttl = awsGetTTL(now: now(), estimatedSkew: estimatedSkew, socketTimeout: socketTimeout)
            pairs.append("ttl=\(ttl)")
        }
        pairs.append("attempt=\(attempt)")
        pairs.append("max=\(maxAttempts)")
        return pairs.joined(separator: "; ")
    }
}

extension AmzSdkRequestMiddleware: Interceptor {
    public typealias InputType = InputType
    public typealias OutputType = OperationStackOutput
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public func modifyBeforeSigning(context: some MutableRequest<InputType, HTTPRequest>) async throws {
        attempt += 1
        let request = context.getRequest()
        let value = await headerValue(host: request.host)
        let builder = request.toBuilder()
        builder.updateHeader(name: AMZ_SDK_REQUEST_HEADER, value: value)
        context.updateRequest(updated: builder.build())
    }

    /// Records the estimated skew for the request's host, per the SEP:
    /// `estimated_skew = <Date header of response> - <local time response was received>`.
    ///
    /// Responses without a valid `Date` header leave the stored value unchanged.
    public func readAfterTransmit(
        context: some BeforeDeserialization<InputType, HTTPRequest, HTTPResponse>
    ) async throws {
        let receivedAt = now()
        guard let dateHeader = context.getResponse().headers.value(for: "Date"),
              let serverDate = TimestampFormatter(format: .httpDate).date(from: dateHeader) else { return }
        await skewStore.record(host: context.getRequest().host, skew: serverDate.timeIntervalSince(receivedAt))
    }
}

// Calculates & returns TTL datetime in strftime format `YYYYmmddTHHMMSSZ`.
func awsGetTTL(now: Date, estimatedSkew: TimeInterval, socketTimeout: TimeInterval) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    let ttlDate = now.addingTimeInterval(estimatedSkew + socketTimeout)
    return dateFormatter.string(from: ttlDate)
}
