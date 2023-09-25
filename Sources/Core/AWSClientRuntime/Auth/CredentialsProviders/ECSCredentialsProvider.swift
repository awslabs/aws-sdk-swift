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

        let resolvedRelativeURI = relativeURI ?? env.environmentVariable(key: "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        let resolvedAbsoluteURI = absoluteURI ?? env.environmentVariable(key: "AWS_CONTAINER_CREDENTIALS_FULL_URI")

        guard resolvedRelativeURI != nil || isValidAbsoluteURI(resolvedAbsoluteURI) else {
            throw ClientError.dataNotFound(
                "Please configure either the relative or absolute URI environment variable!"
            )
        }

        let defaultHost = "169.254.170.2"
        var host = defaultHost
        var pathAndQuery = resolvedRelativeURI ?? ""

        if let relative = resolvedRelativeURI {
            pathAndQuery = relative
        } else if let absolute = resolvedAbsoluteURI, let absoluteURL = URL(string: absolute) {
            let (absoluteHost, absolutePathAndQuery) = try retrieveHostPathAndQuery(from: absoluteURL)
            host = absoluteHost
            pathAndQuery = absolutePathAndQuery
        } else {
            throw ClientError.pathCreationFailed(
                "Failed to retrieve either relative or absolute URI! URI may be malformed."
            )
        }

        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .ecs(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            pathAndQuery: pathAndQuery,
            host: host
        ))
    }
}

private func retrieveHostPathAndQuery(from url: URL) throws -> (String, String) {
    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
        throw ClientError.pathCreationFailed("Absolute URI is malformed! Could not instantiate URLComponents from URL.")
    }
    guard let hostComponent = components.host else {
        throw ClientError.pathCreationFailed("Absolute URI is malformed! Could not retrieve host from URL.")
    }
    components.scheme = nil
    components.host = nil
    guard let pathQueryFragment = components.url else {
        throw ClientError.pathCreationFailed("Could not retrieve path from URL!")
    }
    return (hostComponent, pathQueryFragment.absoluteString)
}

private func isValidAbsoluteURI(_ uri: String?) -> Bool {
    guard let validUri = uri, URL(string: validUri)?.host != nil else {
        return false
    }
    return true
}
