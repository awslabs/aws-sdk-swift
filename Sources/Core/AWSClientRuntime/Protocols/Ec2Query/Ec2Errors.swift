//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyReadWrite
import SmithyXML

public struct Ec2Errors {
    public var error: Ec2Error?

    static var readingClosure: ReadingClosure<Ec2Errors, Reader> {
        return { reader in
            var value = Ec2Errors()
            value.error = try reader["Error"].readIfPresent(readingClosure: Ec2Error.readingClosure)
            return value
        }
    }
}
