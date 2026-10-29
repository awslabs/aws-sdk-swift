//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.AfterAttempt
import protocol ClientRuntime.Interceptor
import protocol ClientRuntime.ServiceError
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
import SmithyHTTPAuthAPI
import struct SmithyIdentity.AWSCredentialIdentity
import protocol SmithyIdentity.AWSCredentialIdentityResolver

/// CredentialInvalidationInterceptor marks the signing credentials for refresh when an attempt fails with `ExpiredToken` or `InvalidToken`.
public struct CredentialInvalidationInterceptor<InputType, OutputType>: Interceptor {
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    private let resolver: any AWSCredentialIdentityResolver

    public init(resolver: any AWSCredentialIdentityResolver) {
        self.resolver = resolver
    }

    public func readAfterAttempt(
        context: some AfterAttempt<InputType, OutputType, HTTPRequest, HTTPResponse>
    ) async throws {
        guard let invalidator = resolver as? IdentityInvalidator else { return }
        do {
            _ = try context.getOutput()
        } catch {
            guard let code = (error as? ServiceError)?.errorCode,
                  code == "ExpiredToken" || code == "InvalidToken",
                  let identity = context.getAttributes().selectedAuthScheme?.identity as? AWSCredentialIdentity
            else { return }
            await invalidator.invalidate(identity)
        }
    }
}

/// IdentityInvalidator is a credential resolver that can drop the credentials it handed out.
protocol IdentityInvalidator {
    func invalidate(_ identity: AWSCredentialIdentity) async
}
