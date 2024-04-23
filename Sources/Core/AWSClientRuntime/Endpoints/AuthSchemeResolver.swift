//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

/// Supported authentication schemes
public enum AuthScheme: Equatable {
    case sigV4(SigV4Parameters)
    case sigV4A(SigV4AParameters)
    case none

    /// The name of the auth scheme
    public var name: String {
        switch self {
        case .sigV4: return "sigv4"
        case .sigV4A: return "sigv4a"
        case .none: return "none"
        }
    }
}

extension AuthScheme {
    /// Initialize an AuthScheme from a dictionary
    /// - Parameter dictionary: Dictionary containing the auth scheme
    public init(from dictionary: [String: Any]) throws {
        guard let name = dictionary["name"] as? String else {
            throw EndpointError.authScheme("Invalid auth scheme")
        }
        switch name {
        case "sigv4":
            self = .sigV4(try SigV4Parameters(from: dictionary))
        case "sigv4a":
            self = .sigV4A(try SigV4AParameters(from: dictionary))
        case "none":
            self = .none
        default:
            throw EndpointError.authScheme("Unknown auth scheme \(name)")
        }
    }
}

extension AuthScheme {
    /// SigV4 auth scheme
    public struct SigV4Parameters: Equatable {

        /// Service name to use for signing
        public let signingName: String?

        /// Region to use for signing
        public let signingRegion: String?

        /// When true, do not double-escape path during signing
        public let disableDoubleEncoding: Bool?
    }
}

extension AuthScheme.SigV4Parameters {
    /// Initialize a SigV4AuthScheme from a dictionary
    /// - Parameter dictionary: Dictionary containing the auth scheme
    init(from dictionary: [String: Any]) throws {
        self.signingName = dictionary["signingName"] as? String
        self.signingRegion = dictionary["signingRegion"] as? String
        self.disableDoubleEncoding = dictionary["disableDoubleEncoding"] as? Bool
    }
}

extension AuthScheme {
    /// SigV4a auth scheme
    public struct SigV4AParameters: Equatable {

        /// Service name to use for signing
        public let signingName: String?

        /// The set of signing regions to use for this endpoint. Currently,
        /// this will always be ["*"].
        public let signingRegionSet: [String]?

        /// When true, do not double-escape path during signing
        public let disableDoubleEncoding: Bool?
    }
}

extension AuthScheme.SigV4AParameters {
    /// Initialize a SigV4AAuthScheme from a dictionary
    /// - Parameter dictionary: Dictionary containing the auth scheme
    init(from dictionary: [String: Any]) throws {
        self.signingName = dictionary["signingName"] as? String
        self.signingRegionSet = dictionary["signingRegionSet"] as? [String]
        self.disableDoubleEncoding = dictionary["disableDoubleEncoding"] as? Bool
    }
}

/// Resolves the auth scheme to use for a given endpoint
public protocol AuthSchemeResolver {

    /// Resolves the auth scheme to use for a given endpoint
    /// If no auth scheme is supported, returns nil and the SDK must throw an error
    /// - Parameter authSchemes: auth schemes to resolve
    /// - Returns: Auth scheme to use
    func resolve(authSchemes: [AuthScheme]) throws -> AuthScheme
}

/// Default implementation of AuthSchemeResolver
public struct DefaultAuthSchemeResolver: AuthSchemeResolver {

    /// Supported auth schemes by the SDK
    let supportedAuthSchemes: Set<String>

    public init(supportedAuthSchemes: Set<String> = ["sigv4", "sigv4a", "none"]) {
        self.supportedAuthSchemes = supportedAuthSchemes
    }

    public func resolve(authSchemes: [AuthScheme]) throws -> AuthScheme {
        guard let authScheme = authSchemes.first(where: { supportedAuthSchemes.contains($0.name) }) else {
            throw EndpointError.authScheme("Failed to resolve auth scheme. Supported schemes: \(supportedAuthSchemes),"
                                           + "available schemes: \(authSchemes.map { $0.name })")
        }

        return authScheme
    }
}
