//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyReadWrite
import SmithyXML

public struct Ec2Error {
    public var code: String?
    public var message: String?

    static var readingClosure: ReadingClosure<Ec2Error, Reader> {
        return { reader in
            var value = Ec2Error()
            value.code = try reader["Code"].readIfPresent()
            value.message = try reader["Message"].readIfPresent()
            return value
        }
    }
}
