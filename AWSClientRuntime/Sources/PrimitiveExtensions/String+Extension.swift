//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
private let VALID_TCHAR: Set<Character> = Set(arrayLiteral: Character("!"),
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
    func encodeUaToken() -> String {
        return self.filter({VALID_TCHAR.contains($0) || $0.isNumber || $0.isLetter}).replacingOccurrences(of: " ", with: "_")
    }
}
