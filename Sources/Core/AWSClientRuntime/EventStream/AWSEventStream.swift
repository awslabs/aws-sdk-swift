//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import Foundation.NSUUID
import ClientRuntime

/// Namespace for event stream related types
struct AWSEventStream {

}

/// AWS Event Stream Errors
enum AWSEventStreamError: Error {

    /// Error thrown when decoding of event stream message fails
    case decoding(String)

    /// Error thrown when message is invalid
    /// This may be due to missing required headers
    case invalidMessage(String)
}
