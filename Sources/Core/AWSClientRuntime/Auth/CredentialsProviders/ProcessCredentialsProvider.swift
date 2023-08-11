//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// The process credentials provider sources credentials from running a command or process.
/// The command to run is sourced from a profile in the AWS config file, using the standard
/// profile selection rules. The profile key the command is read from is "credential_process."
/// E.g.:
///  [default]
///  credential_process=/opt/amazon/bin/my-credential-fetcher --argsA=abc
/// On successfully running the command, the output should be a json data with the following
/// format:
/// {
///     "Version": 1,
///     "AccessKeyId": "accesskey",
///     "SecretAccessKey": "secretAccessKey"
///     "SessionToken": "....",
///     "Expiration": "2019-05-29T00:21:43Z"
/// }
/// Version here identifies the command output format version.
public struct ProcessCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credentials provider that gets credentials from running a command or process.
    ///
    /// - Parameters:
    ///   - fileBasedConfiguration: The file based configuration to read the configuration from.
    ///   - profileFileNameOverride: (Optional) Override of what profile to use to source credentials from ('default' by default)
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) throws {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .process(
            fileBasedConfiguration: fileBasedConfig,
            profileFileNameOverride: profileName
        ))
    }
}
