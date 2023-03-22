//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

struct FileBasedConfiguration {
    typealias SectionName = String
    typealias SectionProvider = (SectionName, SectionType) -> Section?
    
    private let getSection: SectionProvider
    
    init(sectionProvider: @escaping SectionProvider) {
        self.getSection = sectionProvider
    }
    
    func section(for name: SectionName, type: SectionType = .profile) -> Section? {
        getSection(name, type)
    }
}
