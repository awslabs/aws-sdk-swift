//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

// SDK guarantees sdk-version.txt will be present
let sdkVersionFile = Bundle.module.url(forResource: "sdk-version", withExtension: "txt")!

// First-time load will take longer but subsequent calls will use cached data
// swiftlint:disable:next force_try
public let sdkVersion = try! String(contentsOf: sdkVersionFile, encoding: .utf8)
