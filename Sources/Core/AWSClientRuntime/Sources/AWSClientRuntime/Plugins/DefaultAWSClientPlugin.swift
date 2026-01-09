//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public class DefaultAWSClientPlugin: Plugin {
    private var clientName: String

    public init(clientName: String) {
        self.clientName = clientName
    }

    public func configureClient(clientConfiguration: ClientConfiguration) async throws -> ClientConfiguration {
        // Configurations are now value-type structs. While they have mutable properties,
        // we can't effectively mutate through a protocol reference and return the changes.
        // Defaults are set in the configuration's initializer instead.
        return clientConfiguration
    }
}
