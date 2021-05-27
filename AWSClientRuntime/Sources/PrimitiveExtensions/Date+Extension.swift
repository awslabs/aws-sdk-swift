//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import AwsCommonRuntimeKit
import struct Foundation.Date

extension Date {
    var awsDateTimeIntervalSince1970: AWSDate {
        return AWSDate(epochS: self.timeIntervalSince1970)
    }
}
