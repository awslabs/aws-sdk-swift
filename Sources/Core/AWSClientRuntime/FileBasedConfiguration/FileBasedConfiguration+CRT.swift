//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

@_spi(Internal) public typealias CRTFileBasedConfiguration = AwsCommonRuntimeKit.FileBasedConfiguration
@_spi(Internal) public typealias CRTFileBasedConfigurationSection = AwsCommonRuntimeKit.FileBasedConfiguration.Section
@_spi(Internal) public typealias CRTFileBasedConfigurationSectionType
    = AwsCommonRuntimeKit.FileBasedConfiguration.SectionType
@_spi(Internal) public typealias CRTFileBasedConfigurationProperty
    = AwsCommonRuntimeKit.FileBasedConfiguration.Section.Property

extension CRTFileBasedConfigurationSectionType {
    init(_ type: FileBasedConfigurationSectionType) {
        switch type {
        case .profile:
            self = .profile
        case .ssoSession:
            self = .ssoSession
        }
    }
}

@_spi(Internal)
extension CRTFileBasedConfiguration: FileBasedConfiguration {
    public func section(
        for name: String,
        type: FileBasedConfigurationSectionType
    ) -> FileBasedConfigurationPropertyProviding? {
        self.getSection(name: name, sectionType: .init(type))
    }
}

@_spi(Internal)
extension CRTFileBasedConfigurationSection: FileBasedConfigurationSection {
    public func property(for name: FileBasedConfigurationKey) -> FileBasedConfigurationProperty? {
        guard let property = getProperty(name: name.rawValue) else { return nil }
        if property.subPropertyCount > 0 {
            return .subsection(property)
        } else {
            return .string(property.value)
        }
    }
}

@_spi(Internal)
extension CRTFileBasedConfigurationProperty: FileBasedConfigurationSubsection {
    public func value(for name: FileBasedConfigurationKey) -> String? {
        self.getSubProperty(name: name.rawValue)
    }
}
