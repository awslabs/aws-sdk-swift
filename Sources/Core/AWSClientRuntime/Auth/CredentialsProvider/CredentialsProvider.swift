//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public typealias AWSCredentialsProvider = CredentialsProvider

/// An object responsible for providing credentials for an AWS service
/// Direct initailization is not supported.
/// Create instances via the static functions defined in `CredentialsProvider+Factory.swift`
public struct CredentialsProvider {
    @_spi(Internal)
    public struct Options  {
        public let fileBasedConfigurationStore: CRTFiledBasedConfigurationStore
        
        public init(fileBasedConfigurationStore: CRTFiledBasedConfigurationStore) {
            self.fileBasedConfigurationStore = fileBasedConfigurationStore
        }
    }
    
    let _makeProvider: (Options) async throws -> CredentialsProviding
    
    init(_ makeProvider: @escaping (Options) async throws -> CredentialsProviding) {
        self._makeProvider = makeProvider
    }
    
    @_spi(Internal)
    public func makeProvider(_ options: Options) async throws -> CredentialsProviding {
        try await _makeProvider(options)
    }
}
