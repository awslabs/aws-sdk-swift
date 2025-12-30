//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
@_spi(FileBasedConfig) import ConfigFileReader

enum TestSubject {
    
    /// Supplies a `FileBasedConfigurationProviding` closure.  This closure is called to create a test subject for
    /// each test in this package.
    ///
    /// When called, the closure provides a `FileBasedConfiguration`-conforming instance, configured with the passed
    /// config file & credential paths.
    static var constructor: FileBasedConfigurationProviding {

        // Only un-comment one of the following two return statements,
        // to select the config file reader that will be tested.

        // OPTION 1:

        // This constructor creates the existing CRT-based FileBasedConfiguration.
//        return CRTFileBasedConfiguration.makeAsync(configFilePath:credentialsFilePath:)

        // OPTION 2:
        
        // This constructor creates the new, pure-Swift config file reader.
        return ConfigFileReader.makeAsync(configFilePath:credentialsFilePath:)
    }
}
