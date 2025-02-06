//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public class RegionPlugin<Config: AWSRegionClientConfiguration>: Plugin {
    private var region: String

    public init(_ region: String) {
        self.region = region
    }

    public func configureClient(clientConfiguration: Config) -> Config {
        var copy = clientConfiguration
        copy.region = self.region
        copy.signingRegion = self.region
        return copy
    }
}
