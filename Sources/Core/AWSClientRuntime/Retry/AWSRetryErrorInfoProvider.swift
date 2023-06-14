//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.RetryErrorInfoProvider
import enum ClientRuntime.DefaultRetryErrorInfoProvider
import struct ClientRuntime.RetryErrorInfo

public enum AWSRetryErrorInfoProvider: RetryErrorInfoProvider {

    public static func errorInfo(for error: Error) -> ClientRuntime.RetryErrorInfo? {
        DefaultRetryErrorInfoProvider.errorInfo(for: error)
    }
}
