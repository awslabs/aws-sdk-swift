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
import struct Foundation.UUID
import Smithy
import SmithyHTTPAPI
import struct SmithyIdentity.AWSCredentialIdentity
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import protocol SmithyIdentityAPI.IdentityInvalidator
import protocol SmithyIdentityAPI.IdentityResolver

private let AMZ_SDK_REQUEST_HEADER = "amz-sdk-request"

/// Adds the amz-sdk-request header to requests.
public class AmzSdkRequestMiddleware<InputType, OperationStackOutput> {
    public var id: String { "AmzSdkRequest" }

    private var maxAttempts: Int
    private var attempt: Int = 0

    public init(maxRetries: Int) {
        self.maxAttempts = maxRetries + 1
    }

    private func addHeader(builder: HTTPRequestBuilder, context: Context) {
        self.attempt += 1

        if self.attempt == 1 {
            builder.withHeader(name: AMZ_SDK_REQUEST_HEADER, value: "attempt=1; max=\(maxAttempts)")
        } else {
            let estimatedSkew = context.estimatedSkew ?? {
                context.getLogger()?.info("Estimated skew not found; defaulting to zero.")
                return 0
            }()
            let socketTimeout = context.socketTimeout ?? {
                context.getLogger()?.info("Socket timeout value not found; defaulting to 60 seconds.")
                return 60.0
            }()
            let ttlDateUTCString = awsGetTTL(now: Date(), estimatedSkew: estimatedSkew, socketTimeout: socketTimeout)
            builder.updateHeader(
                name: AMZ_SDK_REQUEST_HEADER,
                value: "ttl=\(ttlDateUTCString); attempt=\(self.attempt); max=\(maxAttempts)"
            )
        }
    }

}

extension AmzSdkRequestMiddleware: Interceptor {
    public typealias InputType = InputType
    public typealias OutputType = OperationStackOutput
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public func modifyBeforeSigning(context: some MutableRequest<InputType, HTTPRequest>) async throws {
        let builder = context.getRequest().toBuilder()
        addHeader(builder: builder, context: context.getAttributes())
        context.updateRequest(updated: builder.build())
    }

    /// readAfterAttempt marks the signing credentials for refresh when the attempt failed with `ExpiredToken` or `InvalidToken`.
    public func readAfterAttempt(
        context: some AfterAttempt<InputType, OperationStackOutput, HTTPRequest, HTTPResponse>
    ) async throws {
        do {
            _ = try context.getOutput()
        } catch {
            guard let code = (error as? ServiceError)?.errorCode,
                  code == "ExpiredToken" || code == "InvalidToken" else { return }
            let attributes = context.getAttributes()
            guard let selected = attributes.selectedAuthScheme,
                  let identity = selected.identity as? AWSCredentialIdentity,
                  let resolver = attributes.getIdentityResolvers()?.get(
                      key: AttributeKey<any IdentityResolver>(name: selected.schemeID)
                  ) as? any AWSCredentialIdentityResolver & IdentityInvalidator
            else { return }
            await resolver.invalidate(identity)
        }
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
