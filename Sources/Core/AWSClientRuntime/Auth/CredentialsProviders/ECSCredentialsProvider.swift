//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

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
    public init() throws {
        let relativeURI = ProcessEnvironment().environmentVariable(key: "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        let absoluteURI = ProcessEnvironment().environmentVariable(key: "AWS_CONTAINER_CREDENTIALS_FULL_URI")

        guard relativeURI != nil || absoluteURI != nil else {
            throw InitializationError.missingURIs("Please configure either the relative or absolute URI environment variable!")
        }

        let defaultHost = "http://169.254.170.2"
        var host = defaultHost
        var pathAndQuery = relativeURI ?? ""

        if let absoluteString = absoluteURI, relativeURI == nil {
            if let uriURL = URL(string: absoluteString) {
                host = uriURL.host ?? defaultHost
                pathAndQuery = buildPathAndQuery(from: uriURL)
            }
        }

        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .ecs(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            pathAndQuery: pathAndQuery,
            host: host
        ))
    }
}

enum InitializationError: Error {
    case missingURIs(String)

    var localizedDescription: String {
        switch self {
        case .missingURIs(let message):
            return message
        }
    }
}

private func buildPathAndQuery(from url: URL) -> String {
    let path = url.path
    let query = url.query ?? ""
    let fragment = url.fragment ?? ""

    return path + (query.isEmpty ? "" : "?\(query)") + (fragment.isEmpty ? "" : "#\(fragment)")
}
