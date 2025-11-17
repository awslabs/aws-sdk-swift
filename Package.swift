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
        "codegen/sdk-codegen/aws-models/acm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSACMPCA",
        "codegen/sdk-codegen/aws-models/acm-pca.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAIOps",
        "codegen/sdk-codegen/aws-models/aiops.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSAPIGateway",
        "codegen/sdk-codegen/aws-models/api-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSARCRegionswitch",
        "codegen/sdk-codegen/aws-models/arc-region-switch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyCBOR, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSARCZonalShift",
        "codegen/sdk-codegen/aws-models/arc-zonal-shift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAccessAnalyzer",
        "codegen/sdk-codegen/aws-models/accessanalyzer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAccount",
        "codegen/sdk-codegen/aws-models/account.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAmp",
        "codegen/sdk-codegen/aws-models/amp.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAmplify",
        "codegen/sdk-codegen/aws-models/amplify.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAmplifyBackend",
        "codegen/sdk-codegen/aws-models/amplifybackend.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSAmplifyUIBuilder",
        "codegen/sdk-codegen/aws-models/amplifyuibuilder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApiGatewayManagementApi",
        "codegen/sdk-codegen/aws-models/apigatewaymanagementapi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApiGatewayV2",
        "codegen/sdk-codegen/aws-models/apigatewayv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppConfig",
        "codegen/sdk-codegen/aws-models/appconfig.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppConfigData",
        "codegen/sdk-codegen/aws-models/appconfigdata.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSAppFabric",
        "codegen/sdk-codegen/aws-models/appfabric.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppIntegrations",
        "codegen/sdk-codegen/aws-models/appintegrations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppMesh",
        "codegen/sdk-codegen/aws-models/app-mesh.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppRunner",
        "codegen/sdk-codegen/aws-models/apprunner.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppStream",
        "codegen/sdk-codegen/aws-models/appstream.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppSync",
        "codegen/sdk-codegen/aws-models/appsync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAppflow",
        "codegen/sdk-codegen/aws-models/appflow.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationAutoScaling",
        "codegen/sdk-codegen/aws-models/application-auto-scaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationCostProfiler",
        "codegen/sdk-codegen/aws-models/applicationcostprofiler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationDiscoveryService",
        "codegen/sdk-codegen/aws-models/application-discovery-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationInsights",
        "codegen/sdk-codegen/aws-models/application-insights.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSApplicationSignals",
        "codegen/sdk-codegen/aws-models/application-signals.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSArtifact",
        "codegen/sdk-codegen/aws-models/artifact.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAthena",
        "codegen/sdk-codegen/aws-models/athena.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAuditManager",
        "codegen/sdk-codegen/aws-models/auditmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSAutoScaling",
        "codegen/sdk-codegen/aws-models/auto-scaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSAutoScalingPlans",
        "codegen/sdk-codegen/aws-models/auto-scaling-plans.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSB2bi",
        "codegen/sdk-codegen/aws-models/b2bi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMDashboards",
        "codegen/sdk-codegen/aws-models/bcm-dashboards.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMDataExports",
        "codegen/sdk-codegen/aws-models/bcm-data-exports.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMPricingCalculator",
        "codegen/sdk-codegen/aws-models/bcm-pricing-calculator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBCMRecommendedActions",
        "codegen/sdk-codegen/aws-models/bcm-recommended-actions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBackup",
        "codegen/sdk-codegen/aws-models/backup.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBackupGateway",
        "codegen/sdk-codegen/aws-models/backup-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBackupSearch",
        "codegen/sdk-codegen/aws-models/backupsearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBatch",
        "codegen/sdk-codegen/aws-models/batch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBedrock",
        "codegen/sdk-codegen/aws-models/bedrock.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgent",
        "codegen/sdk-codegen/aws-models/bedrock-agent.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentCore",
        "codegen/sdk-codegen/aws-models/bedrock-agentcore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentCoreControl",
        "codegen/sdk-codegen/aws-models/bedrock-agentcore-control.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockAgentRuntime",
        "codegen/sdk-codegen/aws-models/bedrock-agent-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockDataAutomation",
        "codegen/sdk-codegen/aws-models/bedrock-data-automation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBedrockDataAutomationRuntime",
        "codegen/sdk-codegen/aws-models/bedrock-data-automation-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBedrockRuntime",
        "codegen/sdk-codegen/aws-models/bedrock-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBilling",
        "codegen/sdk-codegen/aws-models/billing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBillingconductor",
        "codegen/sdk-codegen/aws-models/billingconductor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSBraket",
        "codegen/sdk-codegen/aws-models/braket.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSBudgets",
        "codegen/sdk-codegen/aws-models/budgets.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChatbot",
        "codegen/sdk-codegen/aws-models/chatbot.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSChime",
        "codegen/sdk-codegen/aws-models/chime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKIdentity",
        "codegen/sdk-codegen/aws-models/chime-sdk-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKMediaPipelines",
        "codegen/sdk-codegen/aws-models/chime-sdk-media-pipelines.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKMeetings",
        "codegen/sdk-codegen/aws-models/chime-sdk-meetings.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSChimeSDKMessaging",
        "codegen/sdk-codegen/aws-models/chime-sdk-messaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSChimeSDKVoice",
        "codegen/sdk-codegen/aws-models/chime-sdk-voice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCleanRooms",
        "codegen/sdk-codegen/aws-models/cleanrooms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCleanRoomsML",
        "codegen/sdk-codegen/aws-models/cleanroomsml.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloud9",
        "codegen/sdk-codegen/aws-models/cloud9.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudControl",
        "codegen/sdk-codegen/aws-models/cloudcontrol.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudDirectory",
        "codegen/sdk-codegen/aws-models/clouddirectory.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudFormation",
        "codegen/sdk-codegen/aws-models/cloudformation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudFront",
        "codegen/sdk-codegen/aws-models/cloudfront.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudFrontKeyValueStore",
        "codegen/sdk-codegen/aws-models/cloudfront-keyvaluestore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudHSM",
        "codegen/sdk-codegen/aws-models/cloudhsm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCloudHSMV2",
        "codegen/sdk-codegen/aws-models/cloudhsm-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudSearch",
        "codegen/sdk-codegen/aws-models/cloudsearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudSearchDomain",
        "codegen/sdk-codegen/aws-models/cloudsearch-domain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCloudTrail",
        "codegen/sdk-codegen/aws-models/cloudtrail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudTrailData",
        "codegen/sdk-codegen/aws-models/cloudtrail-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCloudWatch",
        "codegen/sdk-codegen/aws-models/cloudwatch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSCloudWatchEvents",
        "codegen/sdk-codegen/aws-models/cloudwatch-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCloudWatchLogs",
        "codegen/sdk-codegen/aws-models/cloudwatch-logs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCodeBuild",
        "codegen/sdk-codegen/aws-models/codebuild.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeCatalyst",
        "codegen/sdk-codegen/aws-models/codecatalyst.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuth, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeCommit",
        "codegen/sdk-codegen/aws-models/codecommit.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeConnections",
        "codegen/sdk-codegen/aws-models/codeconnections.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeDeploy",
        "codegen/sdk-codegen/aws-models/codedeploy.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruProfiler",
        "codegen/sdk-codegen/aws-models/codeguruprofiler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruReviewer",
        "codegen/sdk-codegen/aws-models/codeguru-reviewer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeGuruSecurity",
        "codegen/sdk-codegen/aws-models/codeguru-security.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodePipeline",
        "codegen/sdk-codegen/aws-models/codepipeline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeStarconnections",
        "codegen/sdk-codegen/aws-models/codestar-connections.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodeartifact",
        "codegen/sdk-codegen/aws-models/codeartifact.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCodestarnotifications",
        "codegen/sdk-codegen/aws-models/codestar-notifications.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoIdentity",
        "codegen/sdk-codegen/aws-models/cognito-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoIdentityProvider",
        "codegen/sdk-codegen/aws-models/cognito-identity-provider.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCognitoSync",
        "codegen/sdk-codegen/aws-models/cognito-sync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSComprehend",
        "codegen/sdk-codegen/aws-models/comprehend.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSComprehendMedical",
        "codegen/sdk-codegen/aws-models/comprehendmedical.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSComputeOptimizer",
        "codegen/sdk-codegen/aws-models/compute-optimizer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConfigService",
        "codegen/sdk-codegen/aws-models/config-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnect",
        "codegen/sdk-codegen/aws-models/connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCampaigns",
        "codegen/sdk-codegen/aws-models/connectcampaigns.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCampaignsV2",
        "codegen/sdk-codegen/aws-models/connectcampaignsv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectCases",
        "codegen/sdk-codegen/aws-models/connectcases.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSConnectContactLens",
        "codegen/sdk-codegen/aws-models/connect-contact-lens.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSConnectParticipant",
        "codegen/sdk-codegen/aws-models/connectparticipant.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSControlCatalog",
        "codegen/sdk-codegen/aws-models/controlcatalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSControlTower",
        "codegen/sdk-codegen/aws-models/controltower.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCostExplorer",
        "codegen/sdk-codegen/aws-models/cost-explorer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCostOptimizationHub",
        "codegen/sdk-codegen/aws-models/cost-optimization-hub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSCostandUsageReportService",
        "codegen/sdk-codegen/aws-models/cost-and-usage-report-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSCustomerProfiles",
        "codegen/sdk-codegen/aws-models/customer-profiles.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDAX",
        "codegen/sdk-codegen/aws-models/dax.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDLM",
        "codegen/sdk-codegen/aws-models/dlm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDSQL",
        "codegen/sdk-codegen/aws-models/dsql.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataBrew",
        "codegen/sdk-codegen/aws-models/databrew.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataExchange",
        "codegen/sdk-codegen/aws-models/dataexchange.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataPipeline",
        "codegen/sdk-codegen/aws-models/data-pipeline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataSync",
        "codegen/sdk-codegen/aws-models/datasync.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDataZone",
        "codegen/sdk-codegen/aws-models/datazone.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDatabaseMigrationService",
        "codegen/sdk-codegen/aws-models/database-migration-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDeadline",
        "codegen/sdk-codegen/aws-models/deadline.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDetective",
        "codegen/sdk-codegen/aws-models/detective.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDevOpsGuru",
        "codegen/sdk-codegen/aws-models/devops-guru.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDeviceFarm",
        "codegen/sdk-codegen/aws-models/device-farm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectConnect",
        "codegen/sdk-codegen/aws-models/direct-connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectoryService",
        "codegen/sdk-codegen/aws-models/directory-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDirectoryServiceData",
        "codegen/sdk-codegen/aws-models/directory-service-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSDocDB",
        "codegen/sdk-codegen/aws-models/docdb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSDocDBElastic",
        "codegen/sdk-codegen/aws-models/docdb-elastic.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSDrs",
        "codegen/sdk-codegen/aws-models/drs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDynamoDB",
        "codegen/sdk-codegen/aws-models/dynamodb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSDynamoDBStreams",
        "codegen/sdk-codegen/aws-models/dynamodb-streams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEBS",
        "codegen/sdk-codegen/aws-models/ebs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEC2",
        "codegen/sdk-codegen/aws-models/ec2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSEC2InstanceConnect",
        "codegen/sdk-codegen/aws-models/ec2-instance-connect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSECR",
        "codegen/sdk-codegen/aws-models/ecr.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSECRPUBLIC",
        "codegen/sdk-codegen/aws-models/ecr-public.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSECS",
        "codegen/sdk-codegen/aws-models/ecs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEFS",
        "codegen/sdk-codegen/aws-models/efs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEKS",
        "codegen/sdk-codegen/aws-models/eks.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEKSAuth",
        "codegen/sdk-codegen/aws-models/eks-auth.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEMR",
        "codegen/sdk-codegen/aws-models/emr.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEMRServerless",
        "codegen/sdk-codegen/aws-models/emr-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEMRcontainers",
        "codegen/sdk-codegen/aws-models/emr-containers.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSElastiCache",
        "codegen/sdk-codegen/aws-models/elasticache.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticBeanstalk",
        "codegen/sdk-codegen/aws-models/elastic-beanstalk.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticLoadBalancing",
        "codegen/sdk-codegen/aws-models/elastic-load-balancing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticLoadBalancingv2",
        "codegen/sdk-codegen/aws-models/elastic-load-balancing-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSElasticTranscoder",
        "codegen/sdk-codegen/aws-models/elastic-transcoder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSElasticsearchService",
        "codegen/sdk-codegen/aws-models/elasticsearch-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEntityResolution",
        "codegen/sdk-codegen/aws-models/entityresolution.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEventBridge",
        "codegen/sdk-codegen/aws-models/eventbridge.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEvidently",
        "codegen/sdk-codegen/aws-models/evidently.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSEvs",
        "codegen/sdk-codegen/aws-models/evs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFMS",
        "codegen/sdk-codegen/aws-models/fms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFSx",
        "codegen/sdk-codegen/aws-models/fsx.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFinspace",
        "codegen/sdk-codegen/aws-models/finspace.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFinspacedata",
        "codegen/sdk-codegen/aws-models/finspace-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSFirehose",
        "codegen/sdk-codegen/aws-models/firehose.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSFis",
        "codegen/sdk-codegen/aws-models/fis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSForecast",
        "codegen/sdk-codegen/aws-models/forecast.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSForecastquery",
        "codegen/sdk-codegen/aws-models/forecastquery.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSFraudDetector",
        "codegen/sdk-codegen/aws-models/frauddetector.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSFreeTier",
        "codegen/sdk-codegen/aws-models/freetier.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGameLift",
        "codegen/sdk-codegen/aws-models/gamelift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGameLiftStreams",
        "codegen/sdk-codegen/aws-models/gameliftstreams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGeoMaps",
        "codegen/sdk-codegen/aws-models/geo-maps.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGeoPlaces",
        "codegen/sdk-codegen/aws-models/geo-places.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGeoRoutes",
        "codegen/sdk-codegen/aws-models/geo-routes.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGlacier",
        "codegen/sdk-codegen/aws-models/glacier.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGlobalAccelerator",
        "codegen/sdk-codegen/aws-models/global-accelerator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGlue",
        "codegen/sdk-codegen/aws-models/glue.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGrafana",
        "codegen/sdk-codegen/aws-models/grafana.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGreengrass",
        "codegen/sdk-codegen/aws-models/greengrass.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSGreengrassV2",
        "codegen/sdk-codegen/aws-models/greengrassv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGroundStation",
        "codegen/sdk-codegen/aws-models/groundstation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSGuardDuty",
        "codegen/sdk-codegen/aws-models/guardduty.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSHealth",
        "codegen/sdk-codegen/aws-models/health.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSHealthLake",
        "codegen/sdk-codegen/aws-models/healthlake.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIAM",
        "codegen/sdk-codegen/aws-models/iam.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSIVSRealTime",
        "codegen/sdk-codegen/aws-models/ivs-realtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIdentitystore",
        "codegen/sdk-codegen/aws-models/identitystore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSImagebuilder",
        "codegen/sdk-codegen/aws-models/imagebuilder.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInspector",
        "codegen/sdk-codegen/aws-models/inspector.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInspector2",
        "codegen/sdk-codegen/aws-models/inspector2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInspectorScan",
        "codegen/sdk-codegen/aws-models/inspector-scan.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSInternetMonitor",
        "codegen/sdk-codegen/aws-models/internetmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSInvoicing",
        "codegen/sdk-codegen/aws-models/invoicing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoT",
        "codegen/sdk-codegen/aws-models/iot.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTAnalytics",
        "codegen/sdk-codegen/aws-models/iotanalytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTDataPlane",
        "codegen/sdk-codegen/aws-models/iot-data-plane.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSIoTEvents",
        "codegen/sdk-codegen/aws-models/iot-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTEventsData",
        "codegen/sdk-codegen/aws-models/iot-events-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTFleetWise",
        "codegen/sdk-codegen/aws-models/iotfleetwise.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTJobsDataPlane",
        "codegen/sdk-codegen/aws-models/iot-jobs-data-plane.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSIoTManagedIntegrations",
        "codegen/sdk-codegen/aws-models/iot-managed-integrations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTSecureTunneling",
        "codegen/sdk-codegen/aws-models/iotsecuretunneling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTSiteWise",
        "codegen/sdk-codegen/aws-models/iotsitewise.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTThingsGraph",
        "codegen/sdk-codegen/aws-models/iotthingsgraph.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTTwinMaker",
        "codegen/sdk-codegen/aws-models/iottwinmaker.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIoTWireless",
        "codegen/sdk-codegen/aws-models/iot-wireless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIotDeviceAdvisor",
        "codegen/sdk-codegen/aws-models/iotdeviceadvisor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIvs",
        "codegen/sdk-codegen/aws-models/ivs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSIvschat",
        "codegen/sdk-codegen/aws-models/ivschat.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKMS",
        "codegen/sdk-codegen/aws-models/kms.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKafka",
        "codegen/sdk-codegen/aws-models/kafka.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKafkaConnect",
        "codegen/sdk-codegen/aws-models/kafkaconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKendra",
        "codegen/sdk-codegen/aws-models/kendra.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKendraRanking",
        "codegen/sdk-codegen/aws-models/kendra-ranking.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKeyspaces",
        "codegen/sdk-codegen/aws-models/keyspaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKeyspacesStreams",
        "codegen/sdk-codegen/aws-models/keyspacesstreams.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesis",
        "codegen/sdk-codegen/aws-models/kinesis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisAnalytics",
        "codegen/sdk-codegen/aws-models/kinesis-analytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisAnalyticsV2",
        "codegen/sdk-codegen/aws-models/kinesis-analytics-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideo",
        "codegen/sdk-codegen/aws-models/kinesis-video.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoArchivedMedia",
        "codegen/sdk-codegen/aws-models/kinesis-video-archived-media.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoMedia",
        "codegen/sdk-codegen/aws-models/kinesis-video-media.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSKinesisVideoSignaling",
        "codegen/sdk-codegen/aws-models/kinesis-video-signaling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSKinesisVideoWebRTCStorage",
        "codegen/sdk-codegen/aws-models/kinesis-video-webrtc-storage.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLakeFormation",
        "codegen/sdk-codegen/aws-models/lakeformation.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLambda",
        "codegen/sdk-codegen/aws-models/lambda.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLaunchWizard",
        "codegen/sdk-codegen/aws-models/launch-wizard.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLexModelBuildingService",
        "codegen/sdk-codegen/aws-models/lex-model-building-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLexModelsV2",
        "codegen/sdk-codegen/aws-models/lex-models-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLexRuntimeService",
        "codegen/sdk-codegen/aws-models/lex-runtime-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLexRuntimeV2",
        "codegen/sdk-codegen/aws-models/lex-runtime-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLicenseManager",
        "codegen/sdk-codegen/aws-models/license-manager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLicenseManagerLinuxSubscriptions",
        "codegen/sdk-codegen/aws-models/license-manager-linux-subscriptions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSLicenseManagerUserSubscriptions",
        "codegen/sdk-codegen/aws-models/license-manager-user-subscriptions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLightsail",
        "codegen/sdk-codegen/aws-models/lightsail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLocation",
        "codegen/sdk-codegen/aws-models/location.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSLookoutEquipment",
        "codegen/sdk-codegen/aws-models/lookoutequipment.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSM2",
        "codegen/sdk-codegen/aws-models/m2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMPA",
        "codegen/sdk-codegen/aws-models/mpa.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMTurk",
        "codegen/sdk-codegen/aws-models/mturk.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMWAA",
        "codegen/sdk-codegen/aws-models/mwaa.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMachineLearning",
        "codegen/sdk-codegen/aws-models/machine-learning.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMacie2",
        "codegen/sdk-codegen/aws-models/macie2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMailManager",
        "codegen/sdk-codegen/aws-models/mailmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSManagedBlockchain",
        "codegen/sdk-codegen/aws-models/managedblockchain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSManagedBlockchainQuery",
        "codegen/sdk-codegen/aws-models/managedblockchain-query.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceAgreement",
        "codegen/sdk-codegen/aws-models/marketplace-agreement.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceCatalog",
        "codegen/sdk-codegen/aws-models/marketplace-catalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMarketplaceCommerceAnalytics",
        "codegen/sdk-codegen/aws-models/marketplace-commerce-analytics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceDeployment",
        "codegen/sdk-codegen/aws-models/marketplace-deployment.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceEntitlementService",
        "codegen/sdk-codegen/aws-models/marketplace-entitlement-service.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceMetering",
        "codegen/sdk-codegen/aws-models/marketplace-metering.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMarketplaceReporting",
        "codegen/sdk-codegen/aws-models/marketplace-reporting.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMediaConnect",
        "codegen/sdk-codegen/aws-models/mediaconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaConvert",
        "codegen/sdk-codegen/aws-models/mediaconvert.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaLive",
        "codegen/sdk-codegen/aws-models/medialive.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaPackage",
        "codegen/sdk-codegen/aws-models/mediapackage.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMediaPackageV2",
        "codegen/sdk-codegen/aws-models/mediapackagev2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaPackageVod",
        "codegen/sdk-codegen/aws-models/mediapackage-vod.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMediaStore",
        "codegen/sdk-codegen/aws-models/mediastore.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaStoreData",
        "codegen/sdk-codegen/aws-models/mediastore-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMediaTailor",
        "codegen/sdk-codegen/aws-models/mediatailor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMedicalImaging",
        "codegen/sdk-codegen/aws-models/medical-imaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMemoryDB",
        "codegen/sdk-codegen/aws-models/memorydb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMgn",
        "codegen/sdk-codegen/aws-models/mgn.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSMigrationHub",
        "codegen/sdk-codegen/aws-models/migration-hub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubConfig",
        "codegen/sdk-codegen/aws-models/migrationhub-config.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubOrchestrator",
        "codegen/sdk-codegen/aws-models/migrationhuborchestrator.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubRefactorSpaces",
        "codegen/sdk-codegen/aws-models/migration-hub-refactor-spaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMigrationHubStrategy",
        "codegen/sdk-codegen/aws-models/migrationhubstrategy.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSMq",
        "codegen/sdk-codegen/aws-models/mq.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNeptune",
        "codegen/sdk-codegen/aws-models/neptune.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSNeptuneGraph",
        "codegen/sdk-codegen/aws-models/neptune-graph.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNeptunedata",
        "codegen/sdk-codegen/aws-models/neptunedata.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkFirewall",
        "codegen/sdk-codegen/aws-models/network-firewall.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkFlowMonitor",
        "codegen/sdk-codegen/aws-models/networkflowmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkManager",
        "codegen/sdk-codegen/aws-models/networkmanager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNetworkMonitor",
        "codegen/sdk-codegen/aws-models/networkmonitor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNotifications",
        "codegen/sdk-codegen/aws-models/notifications.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSNotificationsContacts",
        "codegen/sdk-codegen/aws-models/notificationscontacts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOAM",
        "codegen/sdk-codegen/aws-models/oam.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSOSIS",
        "codegen/sdk-codegen/aws-models/osis.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSObservabilityAdmin",
        "codegen/sdk-codegen/aws-models/observabilityadmin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSOdb",
        "codegen/sdk-codegen/aws-models/odb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOmics",
        "codegen/sdk-codegen/aws-models/omics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOpenSearch",
        "codegen/sdk-codegen/aws-models/opensearch.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOpenSearchServerless",
        "codegen/sdk-codegen/aws-models/opensearchserverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSOrganizations",
        "codegen/sdk-codegen/aws-models/organizations.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSOutposts",
        "codegen/sdk-codegen/aws-models/outposts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPCS",
        "codegen/sdk-codegen/aws-models/pcs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPI",
        "codegen/sdk-codegen/aws-models/pi.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPanorama",
        "codegen/sdk-codegen/aws-models/panorama.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPartnerCentralSelling",
        "codegen/sdk-codegen/aws-models/partnercentral-selling.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPaymentCryptography",
        "codegen/sdk-codegen/aws-models/payment-cryptography.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPaymentCryptographyData",
        "codegen/sdk-codegen/aws-models/payment-cryptography-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSPcaConnectorAd",
        "codegen/sdk-codegen/aws-models/pca-connector-ad.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPcaConnectorScep",
        "codegen/sdk-codegen/aws-models/pca-connector-scep.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalize",
        "codegen/sdk-codegen/aws-models/personalize.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalizeEvents",
        "codegen/sdk-codegen/aws-models/personalize-events.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPersonalizeRuntime",
        "codegen/sdk-codegen/aws-models/personalize-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSPinpoint",
        "codegen/sdk-codegen/aws-models/pinpoint.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPinpointEmail",
        "codegen/sdk-codegen/aws-models/pinpoint-email.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPinpointSMSVoice",
        "codegen/sdk-codegen/aws-models/pinpoint-sms-voice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSPinpointSMSVoiceV2",
        "codegen/sdk-codegen/aws-models/pinpoint-sms-voice-v2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPipes",
        "codegen/sdk-codegen/aws-models/pipes.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPolly",
        "codegen/sdk-codegen/aws-models/polly.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSPricing",
        "codegen/sdk-codegen/aws-models/pricing.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSProton",
        "codegen/sdk-codegen/aws-models/proton.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQApps",
        "codegen/sdk-codegen/aws-models/qapps.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQBusiness",
        "codegen/sdk-codegen/aws-models/qbusiness.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQConnect",
        "codegen/sdk-codegen/aws-models/qconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSQuickSight",
        "codegen/sdk-codegen/aws-models/quicksight.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRAM",
        "codegen/sdk-codegen/aws-models/ram.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRDS",
        "codegen/sdk-codegen/aws-models/rds.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSRDSData",
        "codegen/sdk-codegen/aws-models/rds-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRTBFabric",
        "codegen/sdk-codegen/aws-models/rtbfabric.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRUM",
        "codegen/sdk-codegen/aws-models/rum.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRbin",
        "codegen/sdk-codegen/aws-models/rbin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRedshift",
        "codegen/sdk-codegen/aws-models/redshift.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSRedshiftData",
        "codegen/sdk-codegen/aws-models/redshift-data.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRedshiftServerless",
        "codegen/sdk-codegen/aws-models/redshift-serverless.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRekognition",
        "codegen/sdk-codegen/aws-models/rekognition.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRepostspace",
        "codegen/sdk-codegen/aws-models/repostspace.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResiliencehub",
        "codegen/sdk-codegen/aws-models/resiliencehub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceExplorer2",
        "codegen/sdk-codegen/aws-models/resource-explorer-2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceGroups",
        "codegen/sdk-codegen/aws-models/resource-groups.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSResourceGroupsTaggingAPI",
        "codegen/sdk-codegen/aws-models/resource-groups-tagging-api.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRolesAnywhere",
        "codegen/sdk-codegen/aws-models/rolesanywhere.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53",
        "codegen/sdk-codegen/aws-models/route-53.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSRoute53Domains",
        "codegen/sdk-codegen/aws-models/route-53-domains.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53Profiles",
        "codegen/sdk-codegen/aws-models/route53profiles.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53RecoveryCluster",
        "codegen/sdk-codegen/aws-models/route53-recovery-cluster.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRoute53RecoveryControlConfig",
        "codegen/sdk-codegen/aws-models/route53-recovery-control-config.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSRoute53RecoveryReadiness",
        "codegen/sdk-codegen/aws-models/route53-recovery-readiness.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSRoute53Resolver",
        "codegen/sdk-codegen/aws-models/route53resolver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSS3",
        "codegen/sdk-codegen/aws-models/s3.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .AWSSDKIdentityAPI, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSS3Control",
        "codegen/sdk-codegen/aws-models/s3-control.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSS3Outposts",
        "codegen/sdk-codegen/aws-models/s3outposts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSS3Tables",
        "codegen/sdk-codegen/aws-models/s3tables.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSS3Vectors",
        "codegen/sdk-codegen/aws-models/s3vectors.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSES",
        "codegen/sdk-codegen/aws-models/ses.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSESv2",
        "codegen/sdk-codegen/aws-models/sesv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSFN",
        "codegen/sdk-codegen/aws-models/sfn.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSNS",
        "codegen/sdk-codegen/aws-models/sns.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSQS",
        "codegen/sdk-codegen/aws-models/sqs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSSM",
        "codegen/sdk-codegen/aws-models/ssm.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMContacts",
        "codegen/sdk-codegen/aws-models/ssm-contacts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMGuiConnect",
        "codegen/sdk-codegen/aws-models/ssm-guiconnect.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSSMIncidents",
        "codegen/sdk-codegen/aws-models/ssm-incidents.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSMQuickSetup",
        "codegen/sdk-codegen/aws-models/ssm-quicksetup.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSO",
        "codegen/sdk-codegen/aws-models/sso.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSSOAdmin",
        "codegen/sdk-codegen/aws-models/sso-admin.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSSOOIDC",
        "codegen/sdk-codegen/aws-models/sso-oidc.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSTS",
        "codegen/sdk-codegen/aws-models/sts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    ),
    .init(
        "AWSSWF",
        "codegen/sdk-codegen/aws-models/swf.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMaker",
        "codegen/sdk-codegen/aws-models/sagemaker.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerA2IRuntime",
        "codegen/sdk-codegen/aws-models/sagemaker-a2i-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerFeatureStoreRuntime",
        "codegen/sdk-codegen/aws-models/sagemaker-featurestore-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSageMakerGeospatial",
        "codegen/sdk-codegen/aws-models/sagemaker-geospatial.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerMetrics",
        "codegen/sdk-codegen/aws-models/sagemaker-metrics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSageMakerRuntime",
        "codegen/sdk-codegen/aws-models/sagemaker-runtime.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSagemakerEdge",
        "codegen/sdk-codegen/aws-models/sagemaker-edge.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSavingsplans",
        "codegen/sdk-codegen/aws-models/savingsplans.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSScheduler",
        "codegen/sdk-codegen/aws-models/scheduler.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSchemas",
        "codegen/sdk-codegen/aws-models/schemas.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecretsManager",
        "codegen/sdk-codegen/aws-models/secrets-manager.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityHub",
        "codegen/sdk-codegen/aws-models/securityhub.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityIR",
        "codegen/sdk-codegen/aws-models/security-ir.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSecurityLake",
        "codegen/sdk-codegen/aws-models/securitylake.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServerlessApplicationRepository",
        "codegen/sdk-codegen/aws-models/serverlessapplicationrepository.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSServiceCatalog",
        "codegen/sdk-codegen/aws-models/service-catalog.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceCatalogAppRegistry",
        "codegen/sdk-codegen/aws-models/service-catalog-appregistry.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceDiscovery",
        "codegen/sdk-codegen/aws-models/servicediscovery.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSServiceQuotas",
        "codegen/sdk-codegen/aws-models/service-quotas.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSShield",
        "codegen/sdk-codegen/aws-models/shield.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSigner",
        "codegen/sdk-codegen/aws-models/signer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSimSpaceWeaver",
        "codegen/sdk-codegen/aws-models/simspaceweaver.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSnowDeviceManagement",
        "codegen/sdk-codegen/aws-models/snow-device-management.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSnowball",
        "codegen/sdk-codegen/aws-models/snowball.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSocialMessaging",
        "codegen/sdk-codegen/aws-models/socialmessaging.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSsmSap",
        "codegen/sdk-codegen/aws-models/ssm-sap.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSStorageGateway",
        "codegen/sdk-codegen/aws-models/storage-gateway.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSupplyChain",
        "codegen/sdk-codegen/aws-models/supplychain.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSSupport",
        "codegen/sdk-codegen/aws-models/support.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSupportApp",
        "codegen/sdk-codegen/aws-models/support-app.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSSynthetics",
        "codegen/sdk-codegen/aws-models/synthetics.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTaxSettings",
        "codegen/sdk-codegen/aws-models/taxsettings.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTextract",
        "codegen/sdk-codegen/aws-models/textract.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTimestreamInfluxDB",
        "codegen/sdk-codegen/aws-models/timestream-influxdb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSTimestreamQuery",
        "codegen/sdk-codegen/aws-models/timestream-query.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTimestreamWrite",
        "codegen/sdk-codegen/aws-models/timestream-write.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTnb",
        "codegen/sdk-codegen/aws-models/tnb.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTranscribe",
        "codegen/sdk-codegen/aws-models/transcribe.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTranscribeStreaming",
        "codegen/sdk-codegen/aws-models/transcribe-streaming.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKEventStreamsAuth, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyEventStreams, .SmithyEventStreamsAPI, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTransfer",
        "codegen/sdk-codegen/aws-models/transfer.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTranslate",
        "codegen/sdk-codegen/aws-models/translate.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSTrustedAdvisor",
        "codegen/sdk-codegen/aws-models/trustedadvisor.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSVPCLattice",
        "codegen/sdk-codegen/aws-models/vpc-lattice.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSVerifiedPermissions",
        "codegen/sdk-codegen/aws-models/verifiedpermissions.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSVoiceID",
        "codegen/sdk-codegen/aws-models/voice-id.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWAF",
        "codegen/sdk-codegen/aws-models/waf.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWAFRegional",
        "codegen/sdk-codegen/aws-models/waf-regional.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWAFV2",
        "codegen/sdk-codegen/aws-models/wafv2.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWellArchitected",
        "codegen/sdk-codegen/aws-models/wellarchitected.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWisdom",
        "codegen/sdk-codegen/aws-models/wisdom.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkDocs",
        "codegen/sdk-codegen/aws-models/workdocs.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkMail",
        "codegen/sdk-codegen/aws-models/workmail.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkMailMessageFlow",
        "codegen/sdk-codegen/aws-models/workmailmessageflow.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    ),
    .init(
        "AWSWorkSpaces",
        "codegen/sdk-codegen/aws-models/workspaces.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkSpacesThinClient",
        "codegen/sdk-codegen/aws-models/workspaces-thin-client.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkSpacesWeb",
        "codegen/sdk-codegen/aws-models/workspaces-web.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSWorkspacesInstances",
        "codegen/sdk-codegen/aws-models/workspaces-instances.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
    .init(
        "AWSXRay",
        "codegen/sdk-codegen/aws-models/xray.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .AWSSDKIdentity, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    ),
]

private let internalAWSSTSData: ServiceClientData =
    .init(
        "AWSSTS",
        "codegen/sdk-codegen/aws-models/sts.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyFormURL, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps, .SmithyXML]
    )
private let internalAWSSSOData: ServiceClientData =
    .init(
        "AWSSSO",
        "codegen/sdk-codegen/aws-models/sso.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    )
private let internalAWSSSOOIDCData: ServiceClientData =
    .init(
        "AWSSSOOIDC",
        "codegen/sdk-codegen/aws-models/sso-oidc.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil]
    )
private let internalAWSCognitoIdentityData: ServiceClientData =
    .init(
        "AWSCognitoIdentity",
        "codegen/sdk-codegen/aws-models/cognito-identity.json",
        [.AWSClientRuntime, .AWSSDKChecksums, .AWSSDKHTTPAuth, .ClientRuntime, .Smithy, .SmithyHTTPAPI, .SmithyHTTPAuthAPI, .SmithyIdentity, .SmithyJSON, .SmithyReadWrite, .SmithyRetries, .SmithyRetriesAPI, .SmithyTestUtil, .SmithyTimestamps]
    )

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
            name: "InternalAWSSTS",
            dependencies: internalAWSSTSData.dependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSSTS/Sources/InternalAWSSTS"
        ),
        .target(
            name: "InternalAWSSSO",
            dependencies: internalAWSSSOData.dependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSSSO/Sources/InternalAWSSSO"
        ),
        .target(
            name: "InternalAWSSSOOIDC",
            dependencies: internalAWSSSOOIDCData.dependencies,
            path: "Sources/Core/AWSSDKIdentity/InternalClients/InternalAWSSSOOIDC/Sources/InternalAWSSSOOIDC"
        ),
        .target(
            name: "InternalAWSCognitoIdentity",
            dependencies: internalAWSCognitoIdentityData.dependencies,
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
            path: "Sources/Core/AWSSDKChecksums/Sources/AWSSDKChecksums"
        ),
        .target(
            name: "AWSSDKDynamic",
            path: "Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic"
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

private var serviceTargets: [Target] {
    serviceClientData.map(target(_:))
}

private func target(_ service: ServiceClientData) -> Target {
    .target(
        name: service.name,
        dependencies: service.dependencies,
        path: "Sources/Services/\(service.name)/Sources/\(service.name)"
    )
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

    init(_ name: String, _ modelPath: String, _ dependencies: [Target.Dependency]) {
        self.name = name
        self.modelPath = modelPath
        self.dependencies = dependencies
    }
}
