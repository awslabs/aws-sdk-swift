//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct InternalMetadata {

    public init() {}
 }

extension InternalMetadata: CustomStringConvertible {

    public var description: String {
        return "md/internal"
    }
}
