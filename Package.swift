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

let clientRuntimeVersion: Version = "0.164.0"
let crtVersion: Version = "0.54.0"

let excludeRuntimeUnitTests = false

let isPreviewBuild = false

let serviceTargets: [String: [Target.Dependency]] = [
    "AWSACM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSACMPCA": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSAIOps": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSAPIGateway": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSARCRegionswitch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyCBOR, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSARCZonalShift": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAccessAnalyzer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAccount": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAmp": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAmplify": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAmplifyBackend": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSAmplifyUIBuilder": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApiGatewayManagementApi": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApiGatewayV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppConfig": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSAppConfigData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSAppFabric": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppIntegrations": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppMesh": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppRunner": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppStream": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSAppSync": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppTest": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAppflow": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApplicationAutoScaling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApplicationCostProfiler": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApplicationDiscoveryService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApplicationInsights": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSApplicationSignals": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSArtifact": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAthena": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAuditManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSAutoScaling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSAutoScalingPlans": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSB2bi": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSBCMDashboards": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBCMDataExports": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBCMPricingCalculator": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBCMRecommendedActions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSBackup": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBackupGateway": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBackupSearch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBatch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSBedrock": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBedrockAgent": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBedrockAgentCore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBedrockAgentCoreControl": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBedrockAgentRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBedrockDataAutomation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBedrockDataAutomationRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSBedrockRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBilling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBillingconductor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSBraket": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSBudgets": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSChatbot": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSChime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSChimeSDKIdentity": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSChimeSDKMediaPipelines": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSChimeSDKMeetings": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSChimeSDKMessaging": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSChimeSDKVoice": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCleanRooms": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCleanRoomsML": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloud9": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloudControl": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSCloudDirectory": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloudFormation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSCloudFront": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSCloudFrontKeyValueStore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloudHSM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSCloudHSMV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloudSearch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML],
    "AWSCloudSearchDomain": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSCloudTrail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloudTrailData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSCloudWatch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSCloudWatchEvents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCloudWatchLogs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSCodeBuild": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeCatalyst": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeCommit": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeConnections": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeDeploy": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSCodeGuruProfiler": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeGuruReviewer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSCodeGuruSecurity": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodePipeline": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeStarconnections": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodeartifact": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCodestarnotifications": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCognitoIdentity": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCognitoIdentityProvider": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCognitoSync": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSComprehend": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSComprehendMedical": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSComputeOptimizer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSConfigService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSConnectCampaigns": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSConnectCampaignsV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSConnectCases": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSConnectContactLens": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSConnectParticipant": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSControlCatalog": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSControlTower": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCostExplorer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSCostOptimizationHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSCostandUsageReportService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSCustomerProfiles": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDAX": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDLM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDSQL": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDataBrew": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDataExchange": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDataPipeline": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDataSync": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDataZone": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDatabaseMigrationService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDeadline": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDetective": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDevOpsGuru": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDeviceFarm": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDirectConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDirectoryService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDirectoryServiceData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSDocDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSDocDBElastic": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSDrs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSDynamoDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSDynamoDBStreams": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEBS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEC2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSEC2InstanceConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSECR": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSECRPUBLIC": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSECS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSEFS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEKS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSEKSAuth": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEMR": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSEMRServerless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEMRcontainers": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSElastiCache": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticBeanstalk": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticLoadBalancing": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticLoadBalancingv2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSElasticTranscoder": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyWaitersAPI],
    "AWSElasticsearchService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEntityResolution": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEventBridge": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEvidently": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSEvs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSFMS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSFSx": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSFinspace": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSFinspacedata": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSFirehose": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSFis": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSForecast": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSForecastquery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSFraudDetector": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSFreeTier": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGameLift": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGameLiftStreams": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSGeoMaps": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSGeoPlaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSGeoRoutes": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSGlacier": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyWaitersAPI],
    "AWSGlobalAccelerator": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGlue": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGrafana": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGreengrass": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSGreengrassV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGroundStation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSGuardDuty": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSHealth": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSHealthLake": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSIAM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSIVSRealTime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIdentitystore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSImagebuilder": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSInspector": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSInspector2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSInspectorScan": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSInternetMonitor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSInvoicing": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoT": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTAnalytics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTDataPlane": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSIoTEvents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTEventsData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTFleetHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSIoTFleetWise": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTJobsDataPlane": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSIoTManagedIntegrations": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTSecureTunneling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTSiteWise": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSIoTThingsGraph": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTTwinMaker": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIoTWireless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIotDeviceAdvisor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIvs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSIvschat": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKMS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKafka": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKafkaConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKendra": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKendraRanking": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKeyspaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKeyspacesStreams": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKinesis": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSKinesisAnalytics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKinesisAnalyticsV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKinesisVideo": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKinesisVideoArchivedMedia": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKinesisVideoMedia": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSKinesisVideoSignaling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSKinesisVideoWebRTCStorage": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSLakeFormation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLambda": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLaunchWizard": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLexModelBuildingService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLexModelsV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSLexRuntimeService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSLexRuntimeV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSLicenseManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLicenseManagerLinuxSubscriptions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSLicenseManagerUserSubscriptions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLightsail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLocation": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLookoutEquipment": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLookoutMetrics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSLookoutVision": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSM2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMPA": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMTurk": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMWAA": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMachineLearning": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSMacie2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSMailManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSManagedBlockchain": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSManagedBlockchainQuery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMarketplaceAgreement": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMarketplaceCatalog": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSMarketplaceCommerceAnalytics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMarketplaceDeployment": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMarketplaceEntitlementService": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMarketplaceMetering": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMarketplaceReporting": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSMediaConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMediaConvert": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMediaLive": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSMediaPackage": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSMediaPackageV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMediaPackageVod": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSMediaStore": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMediaStoreData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMediaTailor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMedicalImaging": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMemoryDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMgn": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSMigrationHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMigrationHubConfig": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMigrationHubOrchestrator": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMigrationHubRefactorSpaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMigrationHubStrategy": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSMq": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNeptune": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSNeptuneGraph": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNeptunedata": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNetworkFirewall": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNetworkFlowMonitor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNetworkManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNetworkMonitor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNotifications": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSNotificationsContacts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSOAM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSOSIS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSObservabilityAdmin": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSOdb": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSOmics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSOpenSearch": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSOpenSearchServerless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSOrganizations": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSOutposts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPCS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPI": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPanorama": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPartnerCentralSelling": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPaymentCryptography": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPaymentCryptographyData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSPcaConnectorAd": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPcaConnectorScep": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPersonalize": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPersonalizeEvents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPersonalizeRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSPinpoint": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPinpointEmail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPinpointSMSVoice": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSPinpointSMSVoiceV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPipes": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPolly": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSPricing": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSProton": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSQApps": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSQBusiness": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSQConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSQLDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSQLDBSession": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSQuickSight": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRAM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRDS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSRDSData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSRUM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRbin": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRedshift": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSRedshiftData": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRedshiftServerless": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRekognition": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSRepostspace": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSResiliencehub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSResourceExplorer2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSResourceGroups": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSResourceGroupsTaggingAPI": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSRoboMaker": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRolesAnywhere": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRoute53": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSRoute53Domains": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRoute53Profiles": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRoute53RecoveryCluster": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSRoute53RecoveryControlConfig": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyWaitersAPI],
    "AWSRoute53RecoveryReadiness": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSRoute53Resolver": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSS3": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .AWSSDKIdentityAPI, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSS3Control": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML],
    "AWSS3Outposts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSS3Tables": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSS3Vectors": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSES": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML],
    "AWSSESv2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSFN": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSNS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML],
    "AWSSQS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSSM": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSSMContacts": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSSMGuiConnect": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSSMIncidents": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSSMQuickSetup": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSSO": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSSOAdmin": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSSOOIDC": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSTS": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML],
    "AWSSWF": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSageMaker": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSageMakerA2IRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSageMakerFeatureStoreRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSageMakerGeospatial": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSageMakerMetrics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSageMakerRuntime": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSagemakerEdge": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSavingsplans": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSScheduler": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSchemas": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSecretsManager": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSecurityHub": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSecurityIR": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSecurityLake": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSServerlessApplicationRepository": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSServiceCatalog": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSServiceCatalogAppRegistry": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSServiceDiscovery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSServiceQuotas": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSShield": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSigner": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI],
    "AWSSimSpaceWeaver": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSnowDeviceManagement": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSnowball": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSocialMessaging": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSsmSap": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSStorageGateway": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSupplyChain": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSSupport": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSupportApp": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSSynthetics": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTaxSettings": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTextract": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTimestreamInfluxDB": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSTimestreamQuery": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTimestreamWrite": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTnb": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTranscribe": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTranscribeStreaming": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTransfer": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTranslate": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSTrustedAdvisor": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSVPCLattice": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSVerifiedPermissions": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSVoiceID": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWAF": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWAFRegional": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWAFV2": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWellArchitected": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWisdom": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWorkDocs": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWorkMail": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWorkMailMessageFlow": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
    "AWSWorkSpaces": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWorkSpacesThinClient": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWorkSpacesWeb": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSWorkspacesInstances": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
    "AWSXRay": [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
]

let internalAWSSTSDependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML]
let internalAWSSSODependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
let internalAWSSSOOIDCDependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
let internalAWSCognitoIdentityDependencies: [Target.Dependency] = [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]

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
        [smithySwiftDependency, crtDependency, doccDependencyOrNil].compactMap { $0 },
    targets:
        runtimeTargets +
        runtimeTestTargets +
        serviceTargets.map(target(_:_:)) +
        serviceTargets.map(unitTestTarget(_:_:))
)

// MARK: Products

private var runtimeProducts: [Product] {
    [
        "AWSClientRuntime",
        "AWSSDKCommon",
        "AWSSDKEventStreamsAuth",
        "AWSSDKHTTPAuth",
        "AWSSDKIdentityAPI",
        "AWSSDKIdentity",
        "AWSSDKChecksums",
    ].map { .library(name: $0, targets: [$0]) }
}

private func productForService(_ service: String, _ dependencies: [Target.Dependency]) -> Product {
    .library(name: service, targets: [service])
}

// MARK: Dependencies

private var smithySwiftDependency: Package.Dependency {
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
    return .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
}

// MARK: Targets

private var runtimeTargets: [Target] {
    [
        .target(
            name: "AWSSDKForSwift",
            path: "Sources/Core/AWSSDKForSwift",
            exclude: ["Documentation.docc/AWSSDKForSwift.md"]
        ),
        .target(
            name: "SDKForSwift",
            path: "Sources/Core/SDKForSwift",
            exclude: ["Documentation.docc/SDKForSwift.md"]
        ),
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .CRT,
                .ClientRuntime,
                .SmithyIdentityAPI,
                .SmithyIdentity,
                .SmithyRetriesAPI,
                .SmithyRetries,
                .SmithyTimestamps,
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
            dependencies: [
                .CRT,
            ],
            path: "Sources/Core/AWSSDKCommon/Sources/AWSSDKCommon"
        ),
        .target(
            name: "AWSSDKEventStreamsAuth",
            dependencies: [
                .SmithyEventStreamsAPI,
                .SmithyEventStreamsAuthAPI,
                .SmithyEventStreams,
                .CRT,
                .AWSSDKHTTPAuth,
            ],
            path: "Sources/Core/AWSSDKEventStreamsAuth/Sources/AWSSDKEventStreamsAuth"
        ),
        .target(
            name: "AWSSDKHTTPAuth",
            dependencies: [
                .CRT,
                .Smithy,
                .SmithyHTTPAuth,
                .AWSSDKIdentityAPI,
                .AWSSDKChecksums,
            ],
            path: "Sources/Core/AWSSDKHTTPAuth/Sources/AWSSDKHTTPAuth"
        ),
        .target(
            name: "AWSSDKIdentityAPI",
            dependencies: [
                .Smithy,
                .SmithyIdentityAPI,
            ],
            path: "Sources/Core/AWSSDKIdentityAPI/Sources/AWSSDKIdentityAPI"
        ),
        .target(
            name: "AWSSDKIdentity",
            dependencies: [
                .AWSSDKIdentityAPI,
                .Smithy,
                .ClientRuntime,
                .SmithyIdentity,
                .SmithyIdentityAPI,
                .SmithyHTTPAPI,
                .AWSSDKCommon,
                "InternalAWSSTS",
                "InternalAWSSSO",
                "InternalAWSSSOOIDC",
                "InternalAWSCognitoIdentity",
            ],
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
            name: "InternalAWSCognitoIdentity",
            dependencies: internalAWSCognitoIdentityDependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSCognitoIdentity/Sources/InternalAWSCognitoIdentity"
        ),
        .target(
            name: "AWSSDKChecksums",
            dependencies: [
                .CRT,
                .Smithy,
                .SmithyChecksums,
                .SmithyHTTPAPI,
            ],
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
            dependencies: [
                .AWSClientRuntime,
                .ClientRuntime,
                .SmithyTestUtil,
                .AWSSDKCommon,
                .AWSSDKIdentity,
            ],
            path: "Sources/Core/AWSClientRuntime/Tests/AWSClientRuntimeTests",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AWSSDKEventStreamsAuthTests",
            dependencies: [
                .AWSSDKEventStreamsAuth,
                .AWSClientRuntime,
                .AWSSDKIdentity,
                .SmithyStreams,
                .SmithyTestUtil,
            ],
            path: "Sources/Core/AWSSDKEventStreamsAuth/Tests/AWSSDKEventStreamsAuthTests"
        ),
        .testTarget(
            name: "AWSSDKHTTPAuthTests",
            dependencies: [
                .AWSSDKHTTPAuth,
                .AWSClientRuntime,
                .AWSSDKEventStreamsAuth,
                .CRT,
                .SmithyTestUtil,
            ],
            path: "Sources/Core/AWSSDKHTTPAuth/Tests/AWSSDKHTTPAuthTests"
        ),
        .testTarget(
            name: "AWSSDKIdentityTests",
            dependencies: [
                .AWSSDKIdentity,
                .Smithy,
                .SmithyIdentity,
            ],
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
        dependencies: [
            .byName(name: service),
            .ClientRuntime,
            .AWSClientRuntime,
            .SmithyTestUtil,
        ],
        path: "Sources/Services/\(service)/Tests/\(testName)"
    )
}
