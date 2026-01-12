//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public class RegionPlugin: Plugin {
    private var region: String

    public init(_ region: String) {
        self.region = region
    }

    public func configureClient(clientConfiguration: inout ClientConfiguration) async throws {
        guard var config = clientConfiguration as? any AWSRegionClientConfiguration else { return }
        config.region = self.region
        config.signingRegion = self.region
        clientConfiguration = config
    }
}
