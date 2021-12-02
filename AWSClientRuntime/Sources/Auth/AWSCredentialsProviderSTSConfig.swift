//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import AwsCommonRuntimeKit
import ClientRuntime
        
public struct AWSCredentialsProviderSTSConfig {
    public let credentialsProvider: AWSCredentialsProvider
    public let roleArn: String
    public let sessionName: String
    public let durationSeconds: UInt16
    public let shutDownCallback: ShutDownCallback?
    private let sharedDefaultIO: SDKDefaultIO = SDKDefaultIO.shared
    
    public init(credentialsProvider: AWSCredentialsProvider,
                roleArn: String,
                sessionName: String,
                durationSeconds: UInt16,
                shutDownCallback: ShutDownCallback? = nil) {
        self.credentialsProvider = credentialsProvider
        self.roleArn = roleArn
        self.sessionName = sessionName
        self.durationSeconds = durationSeconds
        self.shutDownCallback = shutDownCallback
    }
}

extension AWSCredentialsProviderSTSConfig {
    func toCRTType() -> CredentialsProviderSTSConfig {
        return CredentialsProviderSTSConfig(bootstrap: SDKDefaultIO.shared.clientBootstrap,
                                            tlsContext: SDKDefaultIO.shared.tlsContext,
                                            credentialsProvider: credentialsProvider.crtCredentialsProvider,
                                            roleArn: roleArn,
                                            sessionName: sessionName,
                                            durationSeconds: durationSeconds,
                                            shutDownOptions: shutDownCallback)
    }
}

struct CredentialsProviderSTSConfig: CRTCredentialsProviderSTSConfig {
    var bootstrap: ClientBootstrap
    var tlsContext: TlsContext
    var credentialsProvider: CRTAWSCredentialsProvider
    var roleArn: String
    var sessionName: String
    var durationSeconds: UInt16
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    init(bootstrap: ClientBootstrap,
         tlsContext: TlsContext,
         credentialsProvider: CRTAWSCredentialsProvider,
         roleArn: String,
         sessionName: String,
         durationSeconds: UInt16,
         shutDownOptions: ShutDownCallback? = nil) {
        self.bootstrap = bootstrap
        self.tlsContext = tlsContext
        self.credentialsProvider = credentialsProvider
        self.roleArn = roleArn
        self.sessionName = sessionName
        self.durationSeconds = durationSeconds
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
    }
}
