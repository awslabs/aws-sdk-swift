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

let clientRuntimeVersion: Version = "0.170.0"
let crtVersion: Version = "0.54.2"

let excludeRuntimeUnitTests = false

let isPreviewBuild = false

let serviceClientData: [ServiceClientData] = [
    .init(
        "AWSACM",
        "acm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSACMPCA",
        "acm-pca.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAIOps",
        "aiops.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSAPIGateway",
        "api-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSARCRegionswitch",
        "arc-region-switch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyCBOR, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSARCZonalShift",
        "arc-zonal-shift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAccessAnalyzer",
        "accessanalyzer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAccount",
        "account.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAmp",
        "amp.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAmplify",
        "amplify.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAmplifyBackend",
        "amplifybackend.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSAmplifyUIBuilder",
        "amplifyuibuilder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApiGatewayManagementApi",
        "apigatewaymanagementapi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApiGatewayV2",
        "apigatewayv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppConfig",
        "appconfig.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppConfigData",
        "appconfigdata.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSAppFabric",
        "appfabric.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppIntegrations",
        "appintegrations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppMesh",
        "app-mesh.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppRunner",
        "apprunner.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppStream",
        "appstream.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppSync",
        "appsync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppflow",
        "appflow.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationAutoScaling",
        "application-auto-scaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationCostProfiler",
        "applicationcostprofiler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationDiscoveryService",
        "application-discovery-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationInsights",
        "application-insights.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationSignals",
        "application-signals.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSArtifact",
        "artifact.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAthena",
        "athena.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAuditManager",
        "auditmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAutoScaling",
        "auto-scaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSAutoScalingPlans",
        "auto-scaling-plans.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSB2bi",
        "b2bi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMDashboards",
        "bcm-dashboards.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMDataExports",
        "bcm-data-exports.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMPricingCalculator",
        "bcm-pricing-calculator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMRecommendedActions",
        "bcm-recommended-actions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBackup",
        "backup.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBackupGateway",
        "backup-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBackupSearch",
        "backupsearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBatch",
        "batch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBedrock",
        "bedrock.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgent",
        "bedrock-agent.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentCore",
        "bedrock-agentcore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentCoreControl",
        "bedrock-agentcore-control.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentRuntime",
        "bedrock-agent-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockDataAutomation",
        "bedrock-data-automation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockDataAutomationRuntime",
        "bedrock-data-automation-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBedrockRuntime",
        "bedrock-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBilling",
        "billing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBillingconductor",
        "billingconductor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBraket",
        "braket.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBudgets",
        "budgets.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChatbot",
        "chatbot.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSChime",
        "chime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKIdentity",
        "chime-sdk-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKMediaPipelines",
        "chime-sdk-media-pipelines.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKMeetings",
        "chime-sdk-meetings.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSChimeSDKMessaging",
        "chime-sdk-messaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKVoice",
        "chime-sdk-voice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCleanRooms",
        "cleanrooms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCleanRoomsML",
        "cleanroomsml.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloud9",
        "cloud9.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudControl",
        "cloudcontrol.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudDirectory",
        "clouddirectory.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudFormation",
        "cloudformation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudFront",
        "cloudfront.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudFrontKeyValueStore",
        "cloudfront-keyvaluestore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudHSM",
        "cloudhsm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCloudHSMV2",
        "cloudhsm-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudSearch",
        "cloudsearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudSearchDomain",
        "cloudsearch-domain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCloudTrail",
        "cloudtrail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudTrailData",
        "cloudtrail-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCloudWatch",
        "cloudwatch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudWatchEvents",
        "cloudwatch-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudWatchLogs",
        "cloudwatch-logs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCodeBuild",
        "codebuild.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeCatalyst",
        "codecatalyst.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeCommit",
        "codecommit.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeConnections",
        "codeconnections.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeDeploy",
        "codedeploy.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruProfiler",
        "codeguruprofiler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruReviewer",
        "codeguru-reviewer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruSecurity",
        "codeguru-security.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodePipeline",
        "codepipeline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeStarconnections",
        "codestar-connections.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeartifact",
        "codeartifact.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodestarnotifications",
        "codestar-notifications.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoIdentity",
        "cognito-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoIdentityProvider",
        "cognito-identity-provider.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoSync",
        "cognito-sync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSComprehend",
        "comprehend.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSComprehendMedical",
        "comprehendmedical.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSComputeOptimizer",
        "compute-optimizer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConfigService",
        "config-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnect",
        "connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCampaigns",
        "connectcampaigns.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCampaignsV2",
        "connectcampaignsv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCases",
        "connectcases.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectContactLens",
        "connect-contact-lens.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSConnectParticipant",
        "connectparticipant.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSControlCatalog",
        "controlcatalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSControlTower",
        "controltower.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCostExplorer",
        "cost-explorer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCostOptimizationHub",
        "cost-optimization-hub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCostandUsageReportService",
        "cost-and-usage-report-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCustomerProfiles",
        "customer-profiles.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDAX",
        "dax.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDLM",
        "dlm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDSQL",
        "dsql.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataBrew",
        "databrew.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataExchange",
        "dataexchange.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataPipeline",
        "data-pipeline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataSync",
        "datasync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataZone",
        "datazone.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDatabaseMigrationService",
        "database-migration-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDeadline",
        "deadline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDetective",
        "detective.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDevOpsGuru",
        "devops-guru.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDeviceFarm",
        "device-farm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectConnect",
        "direct-connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectoryService",
        "directory-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectoryServiceData",
        "directory-service-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSDocDB",
        "docdb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSDocDBElastic",
        "docdb-elastic.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSDrs",
        "drs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDynamoDB",
        "dynamodb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDynamoDBStreams",
        "dynamodb-streams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEBS",
        "ebs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEC2",
        "ec2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSEC2InstanceConnect",
        "ec2-instance-connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSECR",
        "ecr.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSECRPUBLIC",
        "ecr-public.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSECS",
        "ecs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEFS",
        "efs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEKS",
        "eks.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEKSAuth",
        "eks-auth.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEMR",
        "emr.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEMRServerless",
        "emr-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEMRcontainers",
        "emr-containers.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSElastiCache",
        "elasticache.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticBeanstalk",
        "elastic-beanstalk.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticLoadBalancing",
        "elastic-load-balancing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticLoadBalancingv2",
        "elastic-load-balancing-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticTranscoder",
        "elastic-transcoder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSElasticsearchService",
        "elasticsearch-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEntityResolution",
        "entityresolution.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEventBridge",
        "eventbridge.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEvidently",
        "evidently.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEvs",
        "evs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFMS",
        "fms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFSx",
        "fsx.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFinspace",
        "finspace.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFinspacedata",
        "finspace-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSFirehose",
        "firehose.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFis",
        "fis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSForecast",
        "forecast.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSForecastquery",
        "forecastquery.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSFraudDetector",
        "frauddetector.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSFreeTier",
        "freetier.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGameLift",
        "gamelift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGameLiftStreams",
        "gameliftstreams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGeoMaps",
        "geo-maps.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGeoPlaces",
        "geo-places.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGeoRoutes",
        "geo-routes.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGlacier",
        "glacier.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGlobalAccelerator",
        "global-accelerator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGlue",
        "glue.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGrafana",
        "grafana.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGreengrass",
        "greengrass.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGreengrassV2",
        "greengrassv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGroundStation",
        "groundstation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGuardDuty",
        "guardduty.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSHealth",
        "health.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSHealthLake",
        "healthlake.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIAM",
        "iam.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSIVSRealTime",
        "ivs-realtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIdentitystore",
        "identitystore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSImagebuilder",
        "imagebuilder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInspector",
        "inspector.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInspector2",
        "inspector2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInspectorScan",
        "inspector-scan.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSInternetMonitor",
        "internetmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInvoicing",
        "invoicing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoT",
        "iot.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTAnalytics",
        "iotanalytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTDataPlane",
        "iot-data-plane.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSIoTEvents",
        "iot-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTEventsData",
        "iot-events-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTFleetWise",
        "iotfleetwise.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTJobsDataPlane",
        "iot-jobs-data-plane.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSIoTManagedIntegrations",
        "iot-managed-integrations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTSecureTunneling",
        "iotsecuretunneling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTSiteWise",
        "iotsitewise.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTThingsGraph",
        "iotthingsgraph.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTTwinMaker",
        "iottwinmaker.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTWireless",
        "iot-wireless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIotDeviceAdvisor",
        "iotdeviceadvisor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIvs",
        "ivs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIvschat",
        "ivschat.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKMS",
        "kms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKafka",
        "kafka.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKafkaConnect",
        "kafkaconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKendra",
        "kendra.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKendraRanking",
        "kendra-ranking.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKeyspaces",
        "keyspaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKeyspacesStreams",
        "keyspacesstreams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesis",
        "kinesis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisAnalytics",
        "kinesis-analytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisAnalyticsV2",
        "kinesis-analytics-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideo",
        "kinesis-video.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoArchivedMedia",
        "kinesis-video-archived-media.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoMedia",
        "kinesis-video-media.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoSignaling",
        "kinesis-video-signaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSKinesisVideoWebRTCStorage",
        "kinesis-video-webrtc-storage.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLakeFormation",
        "lakeformation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLambda",
        "lambda.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLaunchWizard",
        "launch-wizard.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLexModelBuildingService",
        "lex-model-building-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLexModelsV2",
        "lex-models-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLexRuntimeService",
        "lex-runtime-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLexRuntimeV2",
        "lex-runtime-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLicenseManager",
        "license-manager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLicenseManagerLinuxSubscriptions",
        "license-manager-linux-subscriptions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLicenseManagerUserSubscriptions",
        "license-manager-user-subscriptions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLightsail",
        "lightsail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLocation",
        "location.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLookoutEquipment",
        "lookoutequipment.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSM2",
        "m2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMPA",
        "mpa.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMTurk",
        "mturk.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMWAA",
        "mwaa.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMWAAServerless",
        "mwaa-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMachineLearning",
        "machine-learning.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMacie2",
        "macie2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMailManager",
        "mailmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSManagedBlockchain",
        "managedblockchain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSManagedBlockchainQuery",
        "managedblockchain-query.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceAgreement",
        "marketplace-agreement.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceCatalog",
        "marketplace-catalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMarketplaceCommerceAnalytics",
        "marketplace-commerce-analytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceDeployment",
        "marketplace-deployment.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceEntitlementService",
        "marketplace-entitlement-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceMetering",
        "marketplace-metering.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceReporting",
        "marketplace-reporting.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMediaConnect",
        "mediaconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaConvert",
        "mediaconvert.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaLive",
        "medialive.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaPackage",
        "mediapackage.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMediaPackageV2",
        "mediapackagev2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaPackageVod",
        "mediapackage-vod.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMediaStore",
        "mediastore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaStoreData",
        "mediastore-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaTailor",
        "mediatailor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMedicalImaging",
        "medical-imaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMemoryDB",
        "memorydb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMgn",
        "mgn.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMigrationHub",
        "migration-hub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubConfig",
        "migrationhub-config.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubOrchestrator",
        "migrationhuborchestrator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubRefactorSpaces",
        "migration-hub-refactor-spaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubStrategy",
        "migrationhubstrategy.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMq",
        "mq.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNeptune",
        "neptune.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSNeptuneGraph",
        "neptune-graph.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNeptunedata",
        "neptunedata.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkFirewall",
        "network-firewall.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkFlowMonitor",
        "networkflowmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkManager",
        "networkmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkMonitor",
        "networkmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNotifications",
        "notifications.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNotificationsContacts",
        "notificationscontacts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOAM",
        "oam.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSOSIS",
        "osis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSObservabilityAdmin",
        "observabilityadmin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSOdb",
        "odb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOmics",
        "omics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOpenSearch",
        "opensearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOpenSearchServerless",
        "opensearchserverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSOrganizations",
        "organizations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOutposts",
        "outposts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPCS",
        "pcs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPI",
        "pi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPanorama",
        "panorama.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPartnerCentralSelling",
        "partnercentral-selling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPaymentCryptography",
        "payment-cryptography.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPaymentCryptographyData",
        "payment-cryptography-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSPcaConnectorAd",
        "pca-connector-ad.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPcaConnectorScep",
        "pca-connector-scep.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalize",
        "personalize.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalizeEvents",
        "personalize-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalizeRuntime",
        "personalize-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSPinpoint",
        "pinpoint.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPinpointEmail",
        "pinpoint-email.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPinpointSMSVoice",
        "pinpoint-sms-voice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSPinpointSMSVoiceV2",
        "pinpoint-sms-voice-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPipes",
        "pipes.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPolly",
        "polly.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPricing",
        "pricing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSProton",
        "proton.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQApps",
        "qapps.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQBusiness",
        "qbusiness.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQConnect",
        "qconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQuickSight",
        "quicksight.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRAM",
        "ram.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRDS",
        "rds.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSRDSData",
        "rds-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRTBFabric",
        "rtbfabric.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRUM",
        "rum.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRbin",
        "rbin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRedshift",
        "redshift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSRedshiftData",
        "redshift-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRedshiftServerless",
        "redshift-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRekognition",
        "rekognition.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRepostspace",
        "repostspace.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResiliencehub",
        "resiliencehub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceExplorer2",
        "resource-explorer-2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceGroups",
        "resource-groups.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceGroupsTaggingAPI",
        "resource-groups-tagging-api.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRolesAnywhere",
        "rolesanywhere.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53",
        "route-53.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSRoute53Domains",
        "route-53-domains.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53Profiles",
        "route53profiles.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53RecoveryCluster",
        "route53-recovery-cluster.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRoute53RecoveryControlConfig",
        "route53-recovery-control-config.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRoute53RecoveryReadiness",
        "route53-recovery-readiness.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53Resolver",
        "route53resolver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSS3",
        "s3.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .AWSSDKIdentityAPI, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSS3Control",
        "s3-control.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSS3Outposts",
        "s3outposts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSS3Tables",
        "s3tables.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSS3Vectors",
        "s3vectors.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSES",
        "ses.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSESv2",
        "sesv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSFN",
        "sfn.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSNS",
        "sns.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSQS",
        "sqs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSSM",
        "ssm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMContacts",
        "ssm-contacts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMGuiConnect",
        "ssm-guiconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSSMIncidents",
        "ssm-incidents.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMQuickSetup",
        "ssm-quicksetup.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSO",
        "sso.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSSOAdmin",
        "sso-admin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSOOIDC",
        "sso-oidc.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSTS",
        "sts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSWF",
        "swf.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMaker",
        "sagemaker.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerA2IRuntime",
        "sagemaker-a2i-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerFeatureStoreRuntime",
        "sagemaker-featurestore-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSageMakerGeospatial",
        "sagemaker-geospatial.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerMetrics",
        "sagemaker-metrics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerRuntime",
        "sagemaker-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSagemakerEdge",
        "sagemaker-edge.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSavingsplans",
        "savingsplans.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSScheduler",
        "scheduler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSchemas",
        "schemas.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecretsManager",
        "secrets-manager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityHub",
        "securityhub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityIR",
        "security-ir.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityLake",
        "securitylake.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServerlessApplicationRepository",
        "serverlessapplicationrepository.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSServiceCatalog",
        "service-catalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceCatalogAppRegistry",
        "service-catalog-appregistry.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceDiscovery",
        "servicediscovery.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceQuotas",
        "service-quotas.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSShield",
        "shield.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSigner",
        "signer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSimSpaceWeaver",
        "simspaceweaver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSnowDeviceManagement",
        "snow-device-management.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSnowball",
        "snowball.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSocialMessaging",
        "socialmessaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSsmSap",
        "ssm-sap.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSStorageGateway",
        "storage-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSupplyChain",
        "supplychain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSupport",
        "support.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSupportApp",
        "support-app.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSynthetics",
        "synthetics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTaxSettings",
        "taxsettings.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTextract",
        "textract.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTimestreamInfluxDB",
        "timestream-influxdb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSTimestreamQuery",
        "timestream-query.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTimestreamWrite",
        "timestream-write.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTnb",
        "tnb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTranscribe",
        "transcribe.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTranscribeStreaming",
        "transcribe-streaming.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTransfer",
        "transfer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTranslate",
        "translate.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTrustedAdvisor",
        "trustedadvisor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSVPCLattice",
        "vpc-lattice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSVerifiedPermissions",
        "verifiedpermissions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSVoiceID",
        "voice-id.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWAF",
        "waf.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWAFRegional",
        "waf-regional.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWAFV2",
        "wafv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWellArchitected",
        "wellarchitected.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWisdom",
        "wisdom.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkDocs",
        "workdocs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkMail",
        "workmail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkMailMessageFlow",
        "workmailmessageflow.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSWorkSpaces",
        "workspaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkSpacesThinClient",
        "workspaces-thin-client.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkSpacesWeb",
        "workspaces-web.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkspacesInstances",
        "workspaces-instances.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSXRay",
        "xray.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "InternalAWSSTS",
        "sts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML],
        isInternal: true
    ),
    .init(
        "InternalAWSSSO",
        "sso.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
        isInternal: true
    ),
    .init(
        "InternalAWSSSOOIDC",
        "sso-oidc.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil],
        isInternal: true
    ),
    .init(
        "InternalAWSCognitoIdentity",
        "cognito-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps],
        isInternal: true
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
    serviceClientData.map(productForService(_:))
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
    filterServiceTargets(isInternal: true)
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
    filterServiceTargets(isInternal: false)
}

private func filterServiceTargets(isInternal: Bool) -> [Target] {
    serviceClientData.filter { $0.isInternal == isInternal }.map(target(_:))
}

private func target(_ service: ServiceClientData) -> Target {
    .target(name: service.name, dependencies: service.dependencies, path: service.sourcePath)
}

private var serviceTestTargets: [Target] {
    guard ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS"] != nil else { return [] }
    return serviceClientData.map(unitTestTarget(_:))
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

struct ServiceClientData {
    let name: String
    let modelPath: String
    let dependencies: [Target.Dependency]
    let isInternal: Bool

    init(_ name: String, _ modelPath: String, _ dependencies: [Target.Dependency], isInternal: Bool = false) {
        self.name = name
        self.modelPath = modelPath
        self.dependencies = dependencies
        self.isInternal = isInternal
    }

    var sourcePath: String {
        isInternal ?
            "Sources/Core/AWSSDKIdentity/InternalClients/\(name)/Sources/\(name)" :
            "Sources/Services/\(name)/Sources/\(name)"
    }
}
