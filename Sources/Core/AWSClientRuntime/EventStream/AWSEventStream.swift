//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Namespace for event stream related types
public enum AWSEventStream {

}

/// AWS Event Stream Errors
enum AWSEventStreamError: Error {

    /// Error thrown when decoding of event stream message fails
    case decoding(String)

    /// Error thrown when message is invalid
    /// This may be due to missing required headers
    case invalidMessage(String)
}

extension AsyncThrowingStream: Equatable where Element: Equatable {
    public static func == (lhs: AsyncThrowingStream, rhs: AsyncThrowingStream) -> Bool {
        // TODO: Remove as part of https://github.com/awslabs/aws-sdk-swift/issues/898
        return false
    }
}
