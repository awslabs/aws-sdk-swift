//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public typealias ShutDownCallback = () -> Void

public struct AWSCredentialsProviderProfileOptions {
    public let shutdownCallback: ShutDownCallback?

    public let configFileNameOverride: String?

    public let profileFileNameOverride: String?

    public let credentialsFileNameOverride: String?

    public init(
        configFileNameOverride: String? = nil,
        profileFileNameOverride: String? = nil,
        credentialsFileNameOverride: String? = nil,
        shutdownCallback: ShutDownCallback? = nil
    ) {
        self.configFileNameOverride = configFileNameOverride
        self.profileFileNameOverride = profileFileNameOverride
        self.credentialsFileNameOverride = credentialsFileNameOverride
        self.shutdownCallback = shutdownCallback
    }
}
