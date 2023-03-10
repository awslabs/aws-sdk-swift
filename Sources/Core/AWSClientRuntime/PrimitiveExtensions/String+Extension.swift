//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

private let VALID_CHAR = Set(arrayLiteral: Character("!"),
                                              Character("#"),
                                              Character("$"),
                                              Character("%"),
                                              Character("&"),
                                              Character("\\"),
                                              Character("*"),
                                              Character("+"),
                                              Character("-"),
                                              Character("."),
                                              Character("^"),
                                              Character("_"),
                                              Character("`"),
                                              Character("|"),
                                              Character("~"))

extension String {
    func sanitizeForUserAgentToken() -> String {
        return self.filter({ VALID_CHAR.contains($0)
                            || $0.isNumber
                            || $0.isLetter}).replacingOccurrences(of: " ", with: "_")
    }
}

extension String {
    public var hexaData: Data { .init(hexa) }
    private var hexa: UnfoldSequence<UInt8, Index> {
        sequence(state: startIndex) { startIndex in
            guard startIndex < self.endIndex else { return nil }
            let endIndex = self.index(startIndex, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
            defer { startIndex = endIndex }
            return UInt8(self[startIndex..<endIndex], radix: 16)
        }
    }
}
