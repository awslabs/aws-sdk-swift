//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public protocol RegionResolver {
    var providers: [RegionProvider] {get}
    func resolveRegion() -> String?
}
