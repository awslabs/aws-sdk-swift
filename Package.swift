// swift-tools-version:5.9

//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// This manifest is auto-generated.  Do not commit edits to this file;
// they will be overwritten.

import Foundation
import PackageDescription

// MARK: - Dynamic Content

let clientRuntimeVersion: Version = "0.150.0"
let crtVersion: Version = "0.52.1"

let excludeRuntimeUnitTests = false

let isPreviewBuild = false

let serviceTargets: [String: [Target.Dependency]] = [
    "AWSACM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSACMPCA": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSAIOps": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSAPIGateway": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSARCRegionswitch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyCBOR, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSARCZonalShift": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAccessAnalyzer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAccount": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAmp": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAmplify": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAmplifyBackend": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSAmplifyUIBuilder": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApiGatewayManagementApi": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApiGatewayV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppConfig": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSAppConfigData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSAppFabric": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppIntegrations": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppMesh": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppRunner": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppStream": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSAppSync": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppTest": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAppflow": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApplicationAutoScaling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApplicationCostProfiler": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApplicationDiscoveryService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApplicationInsights": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSApplicationSignals": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSArtifact": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAthena": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAuditManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSAutoScaling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSAutoScalingPlans": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSB2bi": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSBCMDataExports": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBCMPricingCalculator": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBackup": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBackupGateway": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBackupSearch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBatch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSBedrock": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBedrockAgent": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBedrockAgentCore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBedrockAgentCoreControl": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBedrockAgentRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBedrockDataAutomation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBedrockDataAutomationRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSBedrockRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBilling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBillingconductor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSBraket": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSBudgets": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSChatbot": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSChime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSChimeSDKIdentity": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSChimeSDKMediaPipelines": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSChimeSDKMeetings": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSChimeSDKMessaging": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSChimeSDKVoice": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCleanRooms": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCleanRoomsML": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloud9": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloudControl": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSCloudDirectory": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloudFormation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSCloudFront": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSCloudFrontKeyValueStore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloudHSM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSCloudHSMV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloudSearch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML],
    "AWSCloudSearchDomain": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSCloudTrail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloudTrailData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSCloudWatch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSCloudWatchEvents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCloudWatchLogs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSCodeBuild": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeCatalyst": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeCommit": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeConnections": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeDeploy": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSCodeGuruProfiler": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeGuruReviewer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSCodeGuruSecurity": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodePipeline": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeStarconnections": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodeartifact": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCodestarnotifications": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCognitoIdentity": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCognitoIdentityProvider": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCognitoSync": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSComprehend": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSComprehendMedical": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSComputeOptimizer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSConfigService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSConnectCampaigns": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSConnectCampaignsV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSConnectCases": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSConnectContactLens": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSConnectParticipant": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSControlCatalog": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSControlTower": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCostExplorer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSCostOptimizationHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSCostandUsageReportService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSCustomerProfiles": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDAX": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDLM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDSQL": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDataBrew": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDataExchange": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDataPipeline": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDataSync": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDataZone": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDatabaseMigrationService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDeadline": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDetective": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDevOpsGuru": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDeviceFarm": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDirectConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDirectoryService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDirectoryServiceData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSDocDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSDocDBElastic": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSDrs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSDynamoDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDynamoDBStreams": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEBS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEC2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSEC2InstanceConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSECR": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSECRPUBLIC": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSECS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSEFS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEKS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSEKSAuth": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEMR": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSEMRServerless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEMRcontainers": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSElastiCache": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticBeanstalk": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticLoadBalancing": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticLoadBalancingv2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticTranscoder": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyWaitersAPI],
    "AWSElasticsearchService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEntityResolution": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEventBridge": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEvidently": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSEvs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSFMS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSFSx": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSFinspace": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSFinspacedata": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSFirehose": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSFis": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSForecast": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSForecastquery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSFraudDetector": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSFreeTier": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGameLift": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGameLiftStreams": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSGeoMaps": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSGeoPlaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSGeoRoutes": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSGlacier": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyWaitersAPI],
    "AWSGlobalAccelerator": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGlue": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGrafana": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGreengrass": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSGreengrassV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGroundStation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSGuardDuty": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSHealth": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSHealthLake": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIAM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSIVSRealTime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIdentitystore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSImagebuilder": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSInspector": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSInspector2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSInspectorScan": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSInternetMonitor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSInvoicing": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoT": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTAnalytics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTDataPlane": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSIoTEvents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTEventsData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTFleetHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSIoTFleetWise": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTJobsDataPlane": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSIoTManagedIntegrations": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTSecureTunneling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTSiteWise": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSIoTThingsGraph": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTTwinMaker": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIoTWireless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIotDeviceAdvisor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIvs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSIvschat": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKMS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKafka": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKafkaConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKendra": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKendraRanking": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKeyspaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKeyspacesStreams": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKinesis": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSKinesisAnalytics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKinesisAnalyticsV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKinesisVideo": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKinesisVideoArchivedMedia": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKinesisVideoMedia": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSKinesisVideoSignaling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSKinesisVideoWebRTCStorage": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSLakeFormation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLambda": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLaunchWizard": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLexModelBuildingService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLexModelsV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSLexRuntimeService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSLexRuntimeV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSLicenseManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLicenseManagerLinuxSubscriptions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSLicenseManagerUserSubscriptions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLightsail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLocation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLookoutEquipment": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLookoutMetrics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSLookoutVision": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSM2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMPA": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMTurk": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMWAA": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMachineLearning": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSMacie2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSMailManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSManagedBlockchain": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSManagedBlockchainQuery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMarketplaceAgreement": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMarketplaceCatalog": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSMarketplaceCommerceAnalytics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMarketplaceDeployment": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMarketplaceEntitlementService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMarketplaceMetering": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMarketplaceReporting": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSMediaConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMediaConvert": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMediaLive": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSMediaPackage": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSMediaPackageV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMediaPackageVod": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSMediaStore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMediaStoreData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMediaTailor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMedicalImaging": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMemoryDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMgn": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSMigrationHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMigrationHubConfig": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMigrationHubOrchestrator": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMigrationHubRefactorSpaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMigrationHubStrategy": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSMq": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNeptune": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSNeptuneGraph": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNeptunedata": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNetworkFirewall": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNetworkFlowMonitor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNetworkManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNetworkMonitor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNotifications": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSNotificationsContacts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSOAM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSOSIS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSObservabilityAdmin": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSOdb": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSOmics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSOpenSearch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSOpenSearchServerless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSOpsWorks": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyWaitersAPI],
    "AWSOpsWorksCM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSOrganizations": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSOutposts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPCS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPI": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPanorama": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPartnerCentralSelling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPaymentCryptography": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPaymentCryptographyData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSPcaConnectorAd": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPcaConnectorScep": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPersonalize": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPersonalizeEvents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPersonalizeRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSPinpoint": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPinpointEmail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPinpointSMSVoice": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSPinpointSMSVoiceV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPipes": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPolly": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSPricing": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSProton": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSQApps": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSQBusiness": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSQConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSQLDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSQLDBSession": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSQuickSight": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRAM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRDS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSRDSData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSRUM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRbin": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRedshift": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSRedshiftData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRedshiftServerless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRekognition": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSRepostspace": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSResiliencehub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSResourceExplorer2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSResourceGroups": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSResourceGroupsTaggingAPI": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSRoboMaker": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRolesAnywhere": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRoute53": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSRoute53Domains": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRoute53Profiles": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRoute53RecoveryCluster": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSRoute53RecoveryControlConfig": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyWaitersAPI],
    "AWSRoute53RecoveryReadiness": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSRoute53Resolver": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSS3": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .AWSSDKIdentityAPI, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSS3Control": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML],
    "AWSS3Outposts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSS3Tables": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSS3Vectors": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSES": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSSESv2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSFN": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSMS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSNS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML],
    "AWSSQS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSSM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSSMContacts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSSMGuiConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSSMIncidents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSSMQuickSetup": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSSO": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSSOAdmin": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSSOOIDC": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSTS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML],
    "AWSSWF": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSageMaker": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSageMakerA2IRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSageMakerFeatureStoreRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSageMakerGeospatial": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSageMakerMetrics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSageMakerRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSagemakerEdge": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSavingsplans": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSScheduler": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSchemas": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSecretsManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSecurityHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSecurityIR": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSecurityLake": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSServerlessApplicationRepository": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSServiceCatalog": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSServiceCatalogAppRegistry": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSServiceDiscovery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSServiceQuotas": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSShield": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSigner": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSimSpaceWeaver": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSnowDeviceManagement": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSnowball": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSocialMessaging": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSsmSap": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSStorageGateway": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSupplyChain": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSSupport": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSupportApp": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSSynthetics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTaxSettings": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTextract": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTimestreamInfluxDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSTimestreamQuery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTimestreamWrite": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTnb": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTranscribe": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTranscribeStreaming": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTransfer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTranslate": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSTrustedAdvisor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSVPCLattice": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSVerifiedPermissions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSVoiceID": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWAF": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWAFRegional": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWAFV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWellArchitected": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWisdom": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWorkDocs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWorkMail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWorkMailMessageFlow": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
    "AWSWorkSpaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWorkSpacesThinClient": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWorkSpacesWeb": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSWorkspacesInstances": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
    "AWSXRay": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
]

let internalAWSSTSDependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
let internalAWSSSODependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
let internalAWSSSOOIDCDependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]

// MARK: - Static Content

// MARK: Target Dependencies

extension Target.Dependency {
    // AWS modules
    static var AWSClientRuntime: Self { "AWSClientRuntime" }
    static var AWSSDKCommon: Self { "AWSSDKCommon" }
    static var AWSSDKEventStreamsAuth: Self { "AWSSDKEventStreamsAuth" }
    static var AWSSDKHTTPAuth: Self { "AWSSDKHTTPAuth" }
    static var AWSSDKIdentity: Self { "AWSSDKIdentity" }
    static var AWSSDKIdentityAPI: Self { "AWSSDKIdentityAPI" }
    static var AWSSDKChecksums: Self { "AWSSDKChecksums" }
    static var AWSSDKPartitions: Self { "AWSSDKPartitions" }

    // CRT module
    static var CRT: Self { .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift") }

    // Smithy modules
    static var ClientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var Smithy: Self { .product(name: "Smithy", package: "smithy-swift") }
    static var SmithyCBOR: Self { .product(name: "SmithyCBOR", package: "smithy-swift") }
    static var SmithyChecksumsAPI: Self { .product(name: "SmithyChecksumsAPI", package: "smithy-swift") }
    static var SmithyChecksums: Self { .product(name: "SmithyChecksums", package: "smithy-swift") }
    static var SmithyEventStreams: Self { .product(name: "SmithyEventStreams", package: "smithy-swift") }
    static var SmithyEventStreamsAPI: Self { .product(name: "SmithyEventStreamsAPI", package: "smithy-swift") }
    static var SmithyEventStreamsAuthAPI: Self { .product(name: "SmithyEventStreamsAuthAPI", package: "smithy-swift") }
    static var SmithyFormURL: Self { .product(name: "SmithyFormURL", package: "smithy-swift") }
    static var SmithyHTTPAPI: Self { .product(name: "SmithyHTTPAPI", package: "smithy-swift") }
    static var SmithyHTTPAuth: Self { .product(name: "SmithyHTTPAuth", package: "smithy-swift") }
    static var SmithyHTTPAuthAPI: Self { .product(name: "SmithyHTTPAuthAPI", package: "smithy-swift") }
    static var SmithyIdentity: Self { .product(name: "SmithyIdentity", package: "smithy-swift") }
    static var SmithyIdentityAPI: Self { .product(name: "SmithyIdentityAPI", package: "smithy-swift") }
    static var SmithyJSON: Self { .product(name: "SmithyJSON", package: "smithy-swift") }
    static var SmithyReadWrite: Self { .product(name: "SmithyReadWrite", package: "smithy-swift") }
    static var SmithyRetries: Self { .product(name: "SmithyRetries", package: "smithy-swift") }
    static var SmithyRetriesAPI: Self { .product(name: "SmithyRetriesAPI", package: "smithy-swift") }
    static var SmithyStreams: Self { .product(name: "SmithyStreams", package: "smithy-swift") }
    static var SmithyTestUtil: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
    static var SmithyTimestamps: Self { .product(name: "SmithyTimestamps", package: "smithy-swift") }
    static var SmithyWaitersAPI: Self { .product(name: "SmithyWaitersAPI", package: "smithy-swift") }
    static var SmithyXML: Self { .product(name: "SmithyXML", package: "smithy-swift") }
}

// MARK: Base Package

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products:
        runtimeProducts +
        serviceTargets.map(productForService(_:_:)),
    dependencies:
        [clientRuntimeDependency, crtDependency, doccDependencyOrNil].compactMap { $0 },
    targets:
        runtimeTargets +
        runtimeTestTargets +
        serviceTargets.map(target(_:_:)) +
        serviceTargets.map(unitTestTarget(_:_:))
)

// MARK: Products

private var runtimeProducts: [Product] {
    ["AWSClientRuntime", "AWSSDKCommon", "AWSSDKEventStreamsAuth", "AWSSDKHTTPAuth", "AWSSDKIdentityAPI", "AWSSDKIdentity", "AWSSDKChecksums"]
        .map { .library(name: $0, targets: [$0]) }
}

private func productForService(_ service: String, _ dependencies: [Target.Dependency]) -> Product {
    .library(name: service, targets: [service])
}

// MARK: Dependencies

private var clientRuntimeDependency: Package.Dependency {
    let previewPath = "./smithy-swift"
    let developmentPath = "../smithy-swift"
    let gitURL = "https://github.com/smithy-lang/smithy-swift"
    let useLocalDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_LOCAL_DEPS"] != nil
    if isPreviewBuild {
        return .package(path: previewPath)
    } else if useLocalDeps {
        return .package(path: developmentPath)
    } else {
        return .package(url: gitURL, exact: clientRuntimeVersion)
    }
}

private var crtDependency: Package.Dependency {
    .package(url: "https://github.com/awslabs/aws-crt-swift", exact: crtVersion)
}

private var doccDependencyOrNil: Package.Dependency? {
    guard ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_ENABLE_DOCC"] != nil else { return nil }
    return .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")}

// MARK: Targets

private var runtimeTargets: [Target] {
    [
        .target(
            name: "AWSSDKForSwift",
            path: "Sources/Core/AWSSDKForSwift",
            exclude: ["Documentation.docc/AWSSDKForSwift.md"]
        ),
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .CRT,
                .ClientRuntime,
                .SmithyIdentity,
                .SmithyRetriesAPI,
                .SmithyRetries,
                .AWSSDKCommon,
                .AWSSDKHTTPAuth,
                .AWSSDKChecksums,
                .AWSSDKPartitions,
            ],
            path: "Sources/Core/AWSClientRuntime/Sources/AWSClientRuntime",
            resources: [
                .process("Resources"),
            ]
        ),
        .target(
            name: "AWSSDKCommon",
            dependencies: [.CRT],
            path: "Sources/Core/AWSSDKCommon/Sources/AWSSDKCommon"
        ),
        .target(
            name: "AWSSDKEventStreamsAuth",
            dependencies: [.SmithyEventStreamsAPI, .SmithyEventStreamsAuthAPI, .SmithyEventStreams, .CRT, .ClientRuntime, .AWSSDKHTTPAuth],
            path: "Sources/Core/AWSSDKEventStreamsAuth/Sources/AWSSDKEventStreamsAuth"
        ),
        .target(
            name: "AWSSDKHTTPAuth",
            dependencies: [.CRT, .Smithy, .ClientRuntime, .SmithyHTTPAuth, .AWSSDKIdentityAPI, .AWSSDKChecksums],
            path: "Sources/Core/AWSSDKHTTPAuth/Sources/AWSSDKHTTPAuth"
        ),
        .target(
            name: "AWSSDKIdentityAPI",
            dependencies: [.Smithy, .SmithyIdentityAPI],
            path: "Sources/Core/AWSSDKIdentityAPI/Sources/AWSSDKIdentityAPI"
        ),
        .target(
            name: "AWSSDKIdentity",
            dependencies: [.AWSSDKIdentityAPI, .CRT, .Smithy, .ClientRuntime, .SmithyIdentity, .SmithyIdentityAPI, .SmithyHTTPAPI, .AWSSDKCommon, "InternalAWSSTS", "InternalAWSSSO", "InternalAWSSSOOIDC", ],
            path: "Sources/Core/AWSSDKIdentity/Sources/AWSSDKIdentity"
        ),
        .target(
            name: "InternalAWSSTS",
            dependencies: internalAWSSTSDependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSSTS/Sources/InternalAWSSTS"
        ),
        .target(
            name: "InternalAWSSSO",
            dependencies: internalAWSSSODependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSSSO/Sources/InternalAWSSSO"
        ),
        .target(
            name: "InternalAWSSSOOIDC",
            dependencies: internalAWSSSOOIDCDependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSSSOOIDC/Sources/InternalAWSSSOOIDC"
        ),
        .target(
            name: "AWSSDKChecksums",
            dependencies: [.CRT, .Smithy, .ClientRuntime, .SmithyChecksumsAPI, .SmithyChecksums, .SmithyHTTPAPI],
            path: "Sources/Core/AWSSDKChecksums/Sources"
        ),
        .target(
            name: "AWSSDKPartitions",
            path: "Sources/Core/AWSSDKPartitions/Sources"
        ),
    ]
}

private var runtimeTestTargets: [Target] {
    guard !excludeRuntimeUnitTests else { return [] }
    return [
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [.AWSClientRuntime, .ClientRuntime, .SmithyTestUtil, .AWSSDKCommon, .AWSSDKIdentity],
            path: "Sources/Core/AWSClientRuntime/Tests/AWSClientRuntimeTests",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AWSSDKEventStreamsAuthTests",
            dependencies: [.AWSClientRuntime, .AWSSDKEventStreamsAuth, .AWSSDKIdentity, .SmithyStreams, .SmithyTestUtil],
            path: "Sources/Core/AWSSDKEventStreamsAuth/Tests/AWSSDKEventStreamsAuthTests"
        ),
        .testTarget(
            name: "AWSSDKHTTPAuthTests",
            dependencies: [.AWSSDKHTTPAuth, .AWSClientRuntime, .AWSSDKEventStreamsAuth, .CRT, .ClientRuntime, .SmithyTestUtil],
            path: "Sources/Core/AWSSDKHTTPAuth/Tests/AWSSDKHTTPAuthTests"
        ),
        .testTarget(
            name: "AWSSDKIdentityTests",
            dependencies: [.AWSSDKIdentity, .Smithy, .SmithyIdentity, .AWSClientRuntime],
            path: "Sources/Core/AWSSDKIdentity/Tests/AWSSDKIdentityTests",
            resources: [.process("Resources")]
        ),
    ]
}

private func target(_ service: String, _ dependencies: [Target.Dependency]) -> Target {
    .target(
        name: service,
        dependencies: dependencies,
        path: "Sources/Services/\(service)/Sources/\(service)"
    )
}

private func unitTestTarget(_ service: String, _ dependencies: [Target.Dependency]) -> Target {
    let testName = "\(service)Tests"
    return .testTarget(
        name: "\(testName)",
        dependencies: [.ClientRuntime, .AWSClientRuntime, .byName(name: service), .SmithyTestUtil],
        path: "Sources/Services/\(service)/Tests/\(testName)"
    )
}
