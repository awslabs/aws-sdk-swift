//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AwsCommonRuntimeKit.CommonRuntimeKit

public enum Utils {

    public static func setupCRT() { CommonRuntimeKit.initialize() }
}
