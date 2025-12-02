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

let clientRuntimeVersion: Version = "0.175.0"
let crtVersion: Version = "0.54.2"

let excludeRuntimeUnitTests = false

let isPreviewBuild = false

private let serviceClientData: [ServiceClientData] = [
    .init(
        "AWSACM",
        "acm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSACMPCA",
        "acm-pca.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSAIOps",
        "aiops.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSAPIGateway",
        "api-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSARCRegionswitch",
        "arc-region-switch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyCBOR, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSARCZonalShift",
        "arc-zonal-shift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAccessAnalyzer",
        "accessanalyzer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAccount",
        "account.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAmp",
        "amp.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAmplify",
        "amplify.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAmplifyBackend",
        "amplifybackend.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSAmplifyUIBuilder",
        "amplifyuibuilder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApiGatewayManagementApi",
        "apigatewaymanagementapi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApiGatewayV2",
        "apigatewayv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAppConfig",
        "appconfig.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSAppConfigData",
        "appconfigdata.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSAppFabric",
        "appfabric.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAppIntegrations",
        "appintegrations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAppMesh",
        "app-mesh.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAppRunner",
        "apprunner.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAppStream",
        "appstream.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSAppSync",
        "appsync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAppflow",
        "appflow.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationAutoScaling",
        "application-auto-scaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationCostProfiler",
        "applicationcostprofiler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationDiscoveryService",
        "application-discovery-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationInsights",
        "application-insights.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationSignals",
        "application-signals.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSArtifact",
        "artifact.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAthena",
        "athena.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAuditManager",
        "auditmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSAutoScaling",
        "auto-scaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSAutoScalingPlans",
        "auto-scaling-plans.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSB2bi",
        "b2bi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSBCMDashboards",
        "bcm-dashboards.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMDataExports",
        "bcm-data-exports.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMPricingCalculator",
        "bcm-pricing-calculator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMRecommendedActions",
        "bcm-recommended-actions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSBackup",
        "backup.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBackupGateway",
        "backup-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBackupSearch",
        "backupsearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBatch",
        "batch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSBedrock",
        "bedrock.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgent",
        "bedrock-agent.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentCore",
        "bedrock-agentcore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentCoreControl",
        "bedrock-agentcore-control.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentRuntime",
        "bedrock-agent-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockDataAutomation",
        "bedrock-data-automation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockDataAutomationRuntime",
        "bedrock-data-automation-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockRuntime",
        "bedrock-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBilling",
        "billing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBillingconductor",
        "billingconductor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSBraket",
        "braket.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSBudgets",
        "budgets.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSChatbot",
        "chatbot.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSChime",
        "chime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKIdentity",
        "chime-sdk-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKMediaPipelines",
        "chime-sdk-media-pipelines.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKMeetings",
        "chime-sdk-meetings.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSChimeSDKMessaging",
        "chime-sdk-messaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKVoice",
        "chime-sdk-voice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCleanRooms",
        "cleanrooms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCleanRoomsML",
        "cleanroomsml.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloud9",
        "cloud9.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudControl",
        "cloudcontrol.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSCloudDirectory",
        "clouddirectory.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudFormation",
        "cloudformation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSCloudFront",
        "cloudfront.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSCloudFrontKeyValueStore",
        "cloudfront-keyvaluestore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudHSM",
        "cloudhsm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSCloudHSMV2",
        "cloudhsm-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudSearch",
        "cloudsearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudSearchDomain",
        "cloudsearch-domain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSCloudTrail",
        "cloudtrail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudTrailData",
        "cloudtrail-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSCloudWatch",
        "cloudwatch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSCloudWatchEvents",
        "cloudwatch-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudWatchLogs",
        "cloudwatch-logs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSCodeBuild",
        "codebuild.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeCatalyst",
        "codecatalyst.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeCommit",
        "codecommit.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeConnections",
        "codeconnections.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeDeploy",
        "codedeploy.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSCodeGuruProfiler",
        "codeguruprofiler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruReviewer",
        "codeguru-reviewer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSCodeGuruSecurity",
        "codeguru-security.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodePipeline",
        "codepipeline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeStarconnections",
        "codestar-connections.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeartifact",
        "codeartifact.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCodestarnotifications",
        "codestar-notifications.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoIdentity",
        "cognito-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoIdentityProvider",
        "cognito-identity-provider.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoSync",
        "cognito-sync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSComprehend",
        "comprehend.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSComprehendMedical",
        "comprehendmedical.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSComputeOptimizer",
        "compute-optimizer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSComputeOptimizerAutomation",
        "compute-optimizer-automation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSConfigService",
        "config-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSConnect",
        "connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCampaigns",
        "connectcampaigns.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCampaignsV2",
        "connectcampaignsv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCases",
        "connectcases.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectContactLens",
        "connect-contact-lens.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSConnectParticipant",
        "connectparticipant.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSControlCatalog",
        "controlcatalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSControlTower",
        "controltower.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCostExplorer",
        "cost-explorer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSCostOptimizationHub",
        "cost-optimization-hub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSCostandUsageReportService",
        "cost-and-usage-report-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSCustomerProfiles",
        "customer-profiles.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDAX",
        "dax.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDLM",
        "dlm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDSQL",
        "dsql.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDataBrew",
        "databrew.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDataExchange",
        "dataexchange.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDataPipeline",
        "data-pipeline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDataSync",
        "datasync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDataZone",
        "datazone.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDatabaseMigrationService",
        "database-migration-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSDeadline",
        "deadline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSDetective",
        "detective.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDevOpsGuru",
        "devops-guru.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDeviceFarm",
        "device-farm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectConnect",
        "direct-connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectoryService",
        "directory-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSDirectoryServiceData",
        "directory-service-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSDocDB",
        "docdb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSDocDBElastic",
        "docdb-elastic.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSDrs",
        "drs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSDynamoDB",
        "dynamodb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSDynamoDBStreams",
        "dynamodb-streams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEBS",
        "ebs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEC2",
        "ec2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSEC2InstanceConnect",
        "ec2-instance-connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSECR",
        "ecr.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSECRPUBLIC",
        "ecr-public.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSECS",
        "ecs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSEFS",
        "efs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEKS",
        "eks.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSEKSAuth",
        "eks-auth.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEMR",
        "emr.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSEMRServerless",
        "emr-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEMRcontainers",
        "emr-containers.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSElastiCache",
        "elasticache.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSElasticBeanstalk",
        "elastic-beanstalk.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSElasticLoadBalancing",
        "elastic-load-balancing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSElasticLoadBalancingv2",
        "elastic-load-balancing-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSElasticTranscoder",
        "elastic-transcoder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyWaitersAPI]
    ),
    .init(
        "AWSElasticsearchService",
        "elasticsearch-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEntityResolution",
        "entityresolution.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEventBridge",
        "eventbridge.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEvidently",
        "evidently.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSEvs",
        "evs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSFMS",
        "fms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSFSx",
        "fsx.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSFinspace",
        "finspace.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSFinspacedata",
        "finspace-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSFirehose",
        "firehose.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSFis",
        "fis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSForecast",
        "forecast.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSForecastquery",
        "forecastquery.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSFraudDetector",
        "frauddetector.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSFreeTier",
        "freetier.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGameLift",
        "gamelift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGameLiftStreams",
        "gameliftstreams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSGeoMaps",
        "geo-maps.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSGeoPlaces",
        "geo-places.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSGeoRoutes",
        "geo-routes.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSGlacier",
        "glacier.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyWaitersAPI]
    ),
    .init(
        "AWSGlobalAccelerator",
        "global-accelerator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGlue",
        "glue.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGrafana",
        "grafana.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGreengrass",
        "greengrass.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSGreengrassV2",
        "greengrassv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGroundStation",
        "groundstation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSGuardDuty",
        "guardduty.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSHealth",
        "health.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSHealthLake",
        "healthlake.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSIAM",
        "iam.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSIVSRealTime",
        "ivs-realtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIdentitystore",
        "identitystore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSImagebuilder",
        "imagebuilder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSInspector",
        "inspector.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSInspector2",
        "inspector2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSInspectorScan",
        "inspector-scan.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSInternetMonitor",
        "internetmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSInvoicing",
        "invoicing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoT",
        "iot.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTAnalytics",
        "iotanalytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTDataPlane",
        "iot-data-plane.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSIoTEvents",
        "iot-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTEventsData",
        "iot-events-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTFleetWise",
        "iotfleetwise.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTJobsDataPlane",
        "iot-jobs-data-plane.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSIoTManagedIntegrations",
        "iot-managed-integrations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTSecureTunneling",
        "iotsecuretunneling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTSiteWise",
        "iotsitewise.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSIoTThingsGraph",
        "iotthingsgraph.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTTwinMaker",
        "iottwinmaker.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTWireless",
        "iot-wireless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIotDeviceAdvisor",
        "iotdeviceadvisor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIvs",
        "ivs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSIvschat",
        "ivschat.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKMS",
        "kms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKafka",
        "kafka.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKafkaConnect",
        "kafkaconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKendra",
        "kendra.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKendraRanking",
        "kendra-ranking.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKeyspaces",
        "keyspaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKeyspacesStreams",
        "keyspacesstreams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesis",
        "kinesis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSKinesisAnalytics",
        "kinesis-analytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisAnalyticsV2",
        "kinesis-analytics-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideo",
        "kinesis-video.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoArchivedMedia",
        "kinesis-video-archived-media.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoMedia",
        "kinesis-video-media.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoSignaling",
        "kinesis-video-signaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSKinesisVideoWebRTCStorage",
        "kinesis-video-webrtc-storage.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSLakeFormation",
        "lakeformation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLambda",
        "lambda.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLaunchWizard",
        "launch-wizard.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLexModelBuildingService",
        "lex-model-building-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLexModelsV2",
        "lex-models-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSLexRuntimeService",
        "lex-runtime-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSLexRuntimeV2",
        "lex-runtime-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSLicenseManager",
        "license-manager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLicenseManagerLinuxSubscriptions",
        "license-manager-linux-subscriptions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSLicenseManagerUserSubscriptions",
        "license-manager-user-subscriptions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLightsail",
        "lightsail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLocation",
        "location.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSLookoutEquipment",
        "lookoutequipment.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSM2",
        "m2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMPA",
        "mpa.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMTurk",
        "mturk.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMWAA",
        "mwaa.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMWAAServerless",
        "mwaa-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMachineLearning",
        "machine-learning.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSMacie2",
        "macie2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSMailManager",
        "mailmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSManagedBlockchain",
        "managedblockchain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSManagedBlockchainQuery",
        "managedblockchain-query.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceAgreement",
        "marketplace-agreement.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceCatalog",
        "marketplace-catalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSMarketplaceCommerceAnalytics",
        "marketplace-commerce-analytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceDeployment",
        "marketplace-deployment.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceEntitlementService",
        "marketplace-entitlement-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceMetering",
        "marketplace-metering.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceReporting",
        "marketplace-reporting.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSMediaConnect",
        "mediaconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaConvert",
        "mediaconvert.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaLive",
        "medialive.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSMediaPackage",
        "mediapackage.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSMediaPackageV2",
        "mediapackagev2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaPackageVod",
        "mediapackage-vod.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSMediaStore",
        "mediastore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaStoreData",
        "mediastore-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaTailor",
        "mediatailor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMedicalImaging",
        "medical-imaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMemoryDB",
        "memorydb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMgn",
        "mgn.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSMigrationHub",
        "migration-hub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubConfig",
        "migrationhub-config.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubOrchestrator",
        "migrationhuborchestrator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubRefactorSpaces",
        "migration-hub-refactor-spaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubStrategy",
        "migrationhubstrategy.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSMq",
        "mq.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNeptune",
        "neptune.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSNeptuneGraph",
        "neptune-graph.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNeptunedata",
        "neptunedata.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkFirewall",
        "network-firewall.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkFlowMonitor",
        "networkflowmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkManager",
        "networkmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkMonitor",
        "networkmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNotifications",
        "notifications.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNotificationsContacts",
        "notificationscontacts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSNovaAct",
        "nova-act.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSOAM",
        "oam.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSOSIS",
        "osis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSObservabilityAdmin",
        "observabilityadmin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSOdb",
        "odb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSOmics",
        "omics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSOpenSearch",
        "opensearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSOpenSearchServerless",
        "opensearchserverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSOrganizations",
        "organizations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSOutposts",
        "outposts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPCS",
        "pcs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPI",
        "pi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPanorama",
        "panorama.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPartnerCentralAccount",
        "partnercentral-account.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPartnerCentralBenefits",
        "partnercentral-benefits.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPartnerCentralChannel",
        "partnercentral-channel.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPartnerCentralSelling",
        "partnercentral-selling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPaymentCryptography",
        "payment-cryptography.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPaymentCryptographyData",
        "payment-cryptography-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSPcaConnectorAd",
        "pca-connector-ad.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPcaConnectorScep",
        "pca-connector-scep.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalize",
        "personalize.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalizeEvents",
        "personalize-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalizeRuntime",
        "personalize-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSPinpoint",
        "pinpoint.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPinpointEmail",
        "pinpoint-email.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPinpointSMSVoice",
        "pinpoint-sms-voice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSPinpointSMSVoiceV2",
        "pinpoint-sms-voice-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPipes",
        "pipes.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPolly",
        "polly.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSPricing",
        "pricing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSProton",
        "proton.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSQApps",
        "qapps.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSQBusiness",
        "qbusiness.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSQConnect",
        "qconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSQuickSight",
        "quicksight.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRAM",
        "ram.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRDS",
        "rds.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSRDSData",
        "rds-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSRTBFabric",
        "rtbfabric.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRUM",
        "rum.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRbin",
        "rbin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRedshift",
        "redshift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSRedshiftData",
        "redshift-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRedshiftServerless",
        "redshift-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRekognition",
        "rekognition.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSRepostspace",
        "repostspace.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSResiliencehub",
        "resiliencehub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceExplorer2",
        "resource-explorer-2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceGroups",
        "resource-groups.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceGroupsTaggingAPI",
        "resource-groups-tagging-api.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSRolesAnywhere",
        "rolesanywhere.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53",
        "route-53.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSRoute53Domains",
        "route-53-domains.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53GlobalResolver",
        "route53globalresolver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53Profiles",
        "route53profiles.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53RecoveryCluster",
        "route53-recovery-cluster.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSRoute53RecoveryControlConfig",
        "route53-recovery-control-config.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyWaitersAPI]
    ),
    .init(
        "AWSRoute53RecoveryReadiness",
        "route53-recovery-readiness.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53Resolver",
        "route53resolver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSS3",
        "s3.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .AWSSDKIdentityAPI, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSS3Control",
        "s3-control.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSS3Outposts",
        "s3outposts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSS3Tables",
        "s3tables.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSS3Vectors",
        "s3vectors.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSES",
        "ses.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI, .SmithyXML]
    ),
    .init(
        "AWSSESv2",
        "sesv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSFN",
        "sfn.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSNS",
        "sns.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSQS",
        "sqs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSSM",
        "ssm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSSSMContacts",
        "ssm-contacts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMGuiConnect",
        "ssm-guiconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSSMIncidents",
        "ssm-incidents.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSSSMQuickSetup",
        "ssm-quicksetup.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSSO",
        "sso.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSSOAdmin",
        "sso-admin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSSOOIDC",
        "sso-oidc.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSTS",
        "sts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSWF",
        "swf.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMaker",
        "sagemaker.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSSageMakerA2IRuntime",
        "sagemaker-a2i-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerFeatureStoreRuntime",
        "sagemaker-featurestore-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSageMakerGeospatial",
        "sagemaker-geospatial.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerMetrics",
        "sagemaker-metrics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerRuntime",
        "sagemaker-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSageMakerRuntimeHTTP2",
        "sagemaker-runtime-http2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSagemakerEdge",
        "sagemaker-edge.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSavingsplans",
        "savingsplans.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSScheduler",
        "scheduler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSchemas",
        "schemas.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSSecretsManager",
        "secrets-manager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityHub",
        "securityhub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityIR",
        "security-ir.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityLake",
        "securitylake.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSServerlessApplicationRepository",
        "serverlessapplicationrepository.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSServiceCatalog",
        "service-catalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceCatalogAppRegistry",
        "service-catalog-appregistry.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceDiscovery",
        "servicediscovery.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceQuotas",
        "service-quotas.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSShield",
        "shield.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSigner",
        "signer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyWaitersAPI]
    ),
    .init(
        "AWSSignin",
        "signin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSimSpaceWeaver",
        "simspaceweaver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSnowDeviceManagement",
        "snow-device-management.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSnowball",
        "snowball.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSocialMessaging",
        "socialmessaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSsmSap",
        "ssm-sap.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSStorageGateway",
        "storage-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSupplyChain",
        "supplychain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSSupport",
        "support.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSupportApp",
        "support-app.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSSynthetics",
        "synthetics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTaxSettings",
        "taxsettings.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTextract",
        "textract.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTimestreamInfluxDB",
        "timestream-influxdb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSTimestreamQuery",
        "timestream-query.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTimestreamWrite",
        "timestream-write.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTnb",
        "tnb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTranscribe",
        "transcribe.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTranscribeStreaming",
        "transcribe-streaming.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTransfer",
        "transfer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTranslate",
        "translate.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSTrustedAdvisor",
        "trustedadvisor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSVPCLattice",
        "vpc-lattice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSVerifiedPermissions",
        "verifiedpermissions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSVoiceID",
        "voice-id.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWAF",
        "waf.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWAFRegional",
        "waf-regional.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWAFV2",
        "wafv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWellArchitected",
        "wellarchitected.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWisdom",
        "wisdom.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkDocs",
        "workdocs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkMail",
        "workmail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkMailMessageFlow",
        "workmailmessageflow.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI]
    ),
    .init(
        "AWSWorkSpaces",
        "workspaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkSpacesThinClient",
        "workspaces-thin-client.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkSpacesWeb",
        "workspaces-web.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkspacesInstances",
        "workspaces-instances.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "AWSXRay",
        "xray.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps]
    ),
    .init(
        "InternalAWSSTS",
        "sts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps, .SmithyXML],
        .internalUse
    ),
    .init(
        "InternalAWSSSO",
        "sso.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
        .internalUse
    ),
    .init(
        "InternalAWSSSOOIDC",
        "sso-oidc.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
        .internalUse
    ),
    .init(
        "InternalAWSCognitoIdentity",
        "cognito-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTimestamps],
        .internalUse
    ),
    .init(
        "InternalAWSSignin",
        "signin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI],
        .internalUse
    ),
]

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
    static var AWSSDKDynamic: Self { "AWSSDKDynamic" }

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
        serviceProducts,
    dependencies:
        dependencies,
    targets:
        runtimeTargets +
        runtimeTestTargets +
        serviceTargets +
        serviceTestTargets
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

private var serviceProducts: [Product] {
    serviceClientData.filter { $0.serviceType == .awsServiceClient }.map(productForService(_:))
}

private func productForService(_ service: ServiceClientData) -> Product {
    .library(name: service.name, targets: [service.name])
}

// MARK: Dependencies

private var dependencies: [Package.Dependency] {
    [smithySwiftDependency, crtDependency, doccDependencyOrNil].compactMap { $0 }
}

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
                .AWSSDKDynamic,
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
                "InternalAWSSignin"
            ],
            path: "Sources/Core/AWSSDKIdentity/Sources/AWSSDKIdentity"
        ),
        .target(
            name: "AWSSDKChecksums",
            dependencies: [
                .CRT,
                .Smithy,
                .SmithyChecksums,
                .SmithyHTTPAPI,
            ],
            path: "Sources/Core/AWSSDKChecksums/Sources/AWSSDKChecksums"
        ),
        .target(
            name: "AWSSDKDynamic",
            path: "Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic"
        ),
    ] + internalServiceTargets
}

private var internalServiceTargets: [Target] {
    serviceClientData.filter { $0.serviceType == .internalUse }.map(target(_:))
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

private var serviceTargets: [Target] {
    serviceClientData.filter { $0.serviceType == .awsServiceClient }.map(target(_:))
}

private func target(_ service: ServiceClientData) -> Target {
    .target(name: service.name, dependencies: service.dependencies, path: service.sourcePath)
}

private var serviceTestTargets: [Target] {
    guard ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS"] != nil else { return [] }
    return serviceClientData.filter { $0.serviceType == .awsServiceClient }.map(unitTestTarget(_:))
}

private func unitTestTarget(_ service: ServiceClientData) -> Target {
    let testName = "\(service.name)Tests"
    let modelName = URL(fileURLWithPath: service.modelPath).lastPathComponent
    return .testTarget(
        name: "\(testName)",
        dependencies: [
            .byName(name: service.name),
            .ClientRuntime,
            .AWSClientRuntime,
            .SmithyTestUtil,
        ],
        path: "codegen/sdk-codegen/build/smithyprojections/sdk-codegen/\(modelName)/swift-codegen/Tests/\(testName)"
    )
}

// As of Swift 6.2, @unchecked is not needed, but for Swift 6.0 it is
private struct ServiceClientData: @unchecked Sendable {

    enum ServiceType {
        case awsServiceClient
        case internalUse
    }

    let name: String
    let modelPath: String
    let dependencies: [Target.Dependency]
    let serviceType: ServiceType

    init(_ name: String, _ modelPath: String, _ dependencies: [Target.Dependency], _ serviceType: ServiceType = .awsServiceClient) {
        self.name = name
        self.modelPath = modelPath
        self.dependencies = dependencies
        self.serviceType = serviceType
    }

    var sourcePath: String {
        switch serviceType {
        case .awsServiceClient:
            return "Sources/Services/\(name)/Sources/\(name)"
        case .internalUse:
            return "Sources/Core/AWSSDKIdentity/InternalClients/\(name)/Sources/\(name)"
        }
    }
}
