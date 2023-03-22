//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

extension FileBasedConfiguration {
    enum SectionType {
        case profile
        case ssoSession
    }
    
    struct Section {
        typealias Key = String
        
        typealias ValueProvider = (Key) -> String?
        private let valueForKey: ValueProvider
        
        private let sectionForKey: SectionProvider
        
        init(
            valueProvider: @escaping ValueProvider,
            sectionProvider: @escaping SectionProvider
        ) {
            self.valueForKey = valueProvider
            self.sectionForKey = sectionProvider
        }
        
        // waqar - What if we want to get w/e is there (value or section)
        // how can we do that?
        func value(for key: Key) -> String? {
            valueForKey(key)
        }
        
        func section(for key: Key) -> Section? {
            sectionForKey(key)
        }
    }
}
