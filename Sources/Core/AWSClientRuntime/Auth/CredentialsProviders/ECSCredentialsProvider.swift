//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credentials provider that sources credentials from ECS container metadata
public struct ECSCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider
    /// Creates a credential provider that sources credentials from ECS container metadata
    /// ECS creds provider can be used to access creds via either relative uri to a fixed endpoint http://169.254.170.2,
    /// or via a full uri specified by environment variables:
    /// - AWS_CONTAINER_CREDENTIALS_RELATIVE_URI
    /// - AWS_CONTAINER_CREDENTIALS_FULL_URI
    /// - AWS_CONTAINER_AUTHORIZATION_TOKEN
    ///
    /// If both relative uri and absolute uri are set, relative uri has higher priority.
    /// Token is used in auth header but only for absolute uri.
    /// - Returns: `CredentialsProvider`
    /// - Throws: CommonRuntimeError.crtError or InitializationError.missingURIs
    public init(
        relativeURI: String? = nil,
        absoluteURI: String? = nil,
        authorizationToken: String? = nil
    ) throws {
        let env = ProcessEnvironment()

        var resolvedRelativeURI = relativeURI ?? env.environmentVariable(key: "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        var resolvedAbsoluteURI = absoluteURI ?? env.environmentVariable(key: "AWS_CONTAINER_CREDENTIALS_FULL_URI")

        guard resolvedRelativeURI != nil || isValidAbsoluteURI(resolvedAbsoluteURI) else {
            let environmentVariables = ProcessInfo.processInfo.environment
            let environmentString = environmentVariables.map { "\($0.key): \($0.value)" }.joined(separator: "\n")

            throw ClientError.dataNotFound(
                "Please configure either the relative or absolute URI environment variable!\n All Environment Variables:\n \(environmentString)"
            )
        }

        let defaultHost = "169.254.170.2"
        var host = defaultHost
        var pathAndQuery = resolvedRelativeURI ?? ""

        if let absoluteString = resolvedAbsoluteURI, resolvedRelativeURI == nil, let uriURL = URL(string: absoluteString) {
            host = uriURL.host ?? defaultHost
            pathAndQuery = try buildPathAndQuery(from: uriURL)
        }

        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .ecs(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            pathAndQuery: pathAndQuery,
            host: host
        ))
    }
}

private func buildPathAndQuery(from url: URL) throws -> String {
    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    components.scheme = nil
    components.host = nil
    guard let pathQueryFragment = components.url else {
        throw ClientError.pathCreationFailed("Could not retrieve path from URL!")
    }
    return pathQueryFragment.absoluteString
}

private func isValidAbsoluteURI(_ uri: String?) -> Bool {
    guard let validUri = uri, let _ = URL(string: validUri)?.host else {
        return false
    }
    return true
}
