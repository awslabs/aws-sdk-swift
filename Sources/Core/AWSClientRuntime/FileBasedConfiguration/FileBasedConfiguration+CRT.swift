//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

extension FileBasedConfiguration.Store {
    static func standard() -> Self {
        .init { sources in
            let task = Task {
                let crtConfiguration = try AwsCommonRuntimeKit.FileBasedConfiguration(
                    configFilePath: sources.configPath,
                    credentialsFilePath: sources.credentialPath
                )
                return FileBasedConfiguration(crtConfiguration: crtConfiguration)
            }
            return try await task.value
        }
    }
}

extension FileBasedConfiguration {
    init(crtConfiguration: AwsCommonRuntimeKit.FileBasedConfiguration) {
        self.init { name, type in
            crtConfiguration
                .getSection(
                    name: name,
                    sectionType: type.crtType()
                )
                .map(Section.init)
        }
    }
}

extension FileBasedConfiguration.Section {
    init(crtSection: AwsCommonRuntimeKit.FileBasedConfiguration.Section) {
        self.init(
            valueProvider: { key in crtSection.getProperty(name: key)?.value },
            sectionProvider: { key, type in
                .init(
                    valueProvider: { nestedKey in
                        crtSection
                            .getProperty(name: key)?
                            .getSubProperty(name: nestedKey)
                    },
                    sectionProvider: { _,_ in nil }
                )
            }
        )
    }
}

extension FileBasedConfiguration.SectionType {
    func crtType() -> AwsCommonRuntimeKit.FileBasedConfiguration.SectionType {
        switch self {
        case .profile: return .profile
        case .ssoSession: return .ssoSession
        }
    }
}
