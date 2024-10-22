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

let clientRuntimeVersion: Version = "0.82.0"
let crtVersion: Version = "0.36.0"

let excludeRuntimeUnitTests = false

let serviceTargets: [String] = [
    "aws-sdk-swift.AWSACM",
    "aws-sdk-swift.AWSACMPCA",
    "aws-sdk-swift.AWSAPIGateway",
    "aws-sdk-swift.AWSARCZonalShift",
    "aws-sdk-swift.AWSAccessAnalyzer",
    "aws-sdk-swift.AWSAccount",
    "aws-sdk-swift.AWSAmp",
    "aws-sdk-swift.AWSAmplify",
    "aws-sdk-swift.AWSAmplifyBackend",
    "aws-sdk-swift.AWSAmplifyUIBuilder",
    "aws-sdk-swift.AWSApiGatewayManagementApi",
    "aws-sdk-swift.AWSApiGatewayV2",
    "aws-sdk-swift.AWSAppConfig",
    "aws-sdk-swift.AWSAppConfigData",
    "aws-sdk-swift.AWSAppFabric",
    "aws-sdk-swift.AWSAppIntegrations",
    "aws-sdk-swift.AWSAppMesh",
    "aws-sdk-swift.AWSAppRunner",
    "aws-sdk-swift.AWSAppStream",
    "aws-sdk-swift.AWSAppSync",
    "aws-sdk-swift.AWSAppTest",
    "aws-sdk-swift.AWSAppflow",
    "aws-sdk-swift.AWSApplicationAutoScaling",
    "aws-sdk-swift.AWSApplicationCostProfiler",
    "aws-sdk-swift.AWSApplicationDiscoveryService",
    "aws-sdk-swift.AWSApplicationInsights",
    "aws-sdk-swift.AWSApplicationSignals",
    "aws-sdk-swift.AWSArtifact",
    "aws-sdk-swift.AWSAthena",
    "aws-sdk-swift.AWSAuditManager",
    "aws-sdk-swift.AWSAutoScaling",
    "aws-sdk-swift.AWSAutoScalingPlans",
    "aws-sdk-swift.AWSB2bi",
    "aws-sdk-swift.AWSBCMDataExports",
    "aws-sdk-swift.AWSBackup",
    "aws-sdk-swift.AWSBackupGateway",
    "aws-sdk-swift.AWSBatch",
    "aws-sdk-swift.AWSBedrock",
    "aws-sdk-swift.AWSBedrockAgent",
    "aws-sdk-swift.AWSBedrockAgentRuntime",
    "aws-sdk-swift.AWSBedrockRuntime",
    "aws-sdk-swift.AWSBillingconductor",
    "aws-sdk-swift.AWSBraket",
    "aws-sdk-swift.AWSBudgets",
    "aws-sdk-swift.AWSChatbot",
    "aws-sdk-swift.AWSChime",
    "aws-sdk-swift.AWSChimeSDKIdentity",
    "aws-sdk-swift.AWSChimeSDKMediaPipelines",
    "aws-sdk-swift.AWSChimeSDKMeetings",
    "aws-sdk-swift.AWSChimeSDKMessaging",
    "aws-sdk-swift.AWSChimeSDKVoice",
    "aws-sdk-swift.AWSCleanRooms",
    "aws-sdk-swift.AWSCleanRoomsML",
    "aws-sdk-swift.AWSCloud9",
    "aws-sdk-swift.AWSCloudControl",
    "aws-sdk-swift.AWSCloudDirectory",
    "aws-sdk-swift.AWSCloudFormation",
    "aws-sdk-swift.AWSCloudFront",
    "aws-sdk-swift.AWSCloudFrontKeyValueStore",
    "aws-sdk-swift.AWSCloudHSM",
    "aws-sdk-swift.AWSCloudHSMV2",
    "aws-sdk-swift.AWSCloudSearch",
    "aws-sdk-swift.AWSCloudSearchDomain",
    "aws-sdk-swift.AWSCloudTrail",
    "aws-sdk-swift.AWSCloudTrailData",
    "aws-sdk-swift.AWSCloudWatch",
    "aws-sdk-swift.AWSCloudWatchEvents",
    "aws-sdk-swift.AWSCloudWatchLogs",
    "aws-sdk-swift.AWSCodeBuild",
    "aws-sdk-swift.AWSCodeCatalyst",
    "aws-sdk-swift.AWSCodeCommit",
    "aws-sdk-swift.AWSCodeConnections",
    "aws-sdk-swift.AWSCodeDeploy",
    "aws-sdk-swift.AWSCodeGuruProfiler",
    "aws-sdk-swift.AWSCodeGuruReviewer",
    "aws-sdk-swift.AWSCodeGuruSecurity",
    "aws-sdk-swift.AWSCodePipeline",
    "aws-sdk-swift.AWSCodeStarconnections",
    "aws-sdk-swift.AWSCodeartifact",
    "aws-sdk-swift.AWSCodestarnotifications",
    "aws-sdk-swift.AWSCognitoIdentity",
    "aws-sdk-swift.AWSCognitoIdentityProvider",
    "aws-sdk-swift.AWSCognitoSync",
    "aws-sdk-swift.AWSComprehend",
    "aws-sdk-swift.AWSComprehendMedical",
    "aws-sdk-swift.AWSComputeOptimizer",
    "aws-sdk-swift.AWSConfigService",
    "aws-sdk-swift.AWSConnect",
    "aws-sdk-swift.AWSConnectCampaigns",
    "aws-sdk-swift.AWSConnectCases",
    "aws-sdk-swift.AWSConnectContactLens",
    "aws-sdk-swift.AWSConnectParticipant",
    "aws-sdk-swift.AWSControlCatalog",
    "aws-sdk-swift.AWSControlTower",
    "aws-sdk-swift.AWSCostExplorer",
    "aws-sdk-swift.AWSCostOptimizationHub",
    "aws-sdk-swift.AWSCostandUsageReportService",
    "aws-sdk-swift.AWSCustomerProfiles",
    "aws-sdk-swift.AWSDAX",
    "aws-sdk-swift.AWSDLM",
    "aws-sdk-swift.AWSDataBrew",
    "aws-sdk-swift.AWSDataExchange",
    "aws-sdk-swift.AWSDataPipeline",
    "aws-sdk-swift.AWSDataSync",
    "aws-sdk-swift.AWSDataZone",
    "aws-sdk-swift.AWSDatabaseMigrationService",
    "aws-sdk-swift.AWSDeadline",
    "aws-sdk-swift.AWSDetective",
    "aws-sdk-swift.AWSDevOpsGuru",
    "aws-sdk-swift.AWSDeviceFarm",
    "aws-sdk-swift.AWSDirectConnect",
    "aws-sdk-swift.AWSDirectoryService",
    "aws-sdk-swift.AWSDirectoryServiceData",
    "aws-sdk-swift.AWSDocDB",
    "aws-sdk-swift.AWSDocDBElastic",
    "aws-sdk-swift.AWSDrs",
    "aws-sdk-swift.AWSDynamoDB",
    "aws-sdk-swift.AWSDynamoDBStreams",
    "aws-sdk-swift.AWSEBS",
    "aws-sdk-swift.AWSEC2",
    "aws-sdk-swift.AWSEC2InstanceConnect",
    "aws-sdk-swift.AWSECR",
    "aws-sdk-swift.AWSECRPUBLIC",
    "aws-sdk-swift.AWSECS",
    "aws-sdk-swift.AWSEFS",
    "aws-sdk-swift.AWSEKS",
    "aws-sdk-swift.AWSEKSAuth",
    "aws-sdk-swift.AWSEMR",
    "aws-sdk-swift.AWSEMRServerless",
    "aws-sdk-swift.AWSEMRcontainers",
    "aws-sdk-swift.AWSElastiCache",
    "aws-sdk-swift.AWSElasticBeanstalk",
    "aws-sdk-swift.AWSElasticInference",
    "aws-sdk-swift.AWSElasticLoadBalancing",
    "aws-sdk-swift.AWSElasticLoadBalancingv2",
    "aws-sdk-swift.AWSElasticTranscoder",
    "aws-sdk-swift.AWSElasticsearchService",
    "aws-sdk-swift.AWSEntityResolution",
    "aws-sdk-swift.AWSEventBridge",
    "aws-sdk-swift.AWSEvidently",
    "aws-sdk-swift.AWSFMS",
    "aws-sdk-swift.AWSFSx",
    "aws-sdk-swift.AWSFinspace",
    "aws-sdk-swift.AWSFinspacedata",
    "aws-sdk-swift.AWSFirehose",
    "aws-sdk-swift.AWSFis",
    "aws-sdk-swift.AWSForecast",
    "aws-sdk-swift.AWSForecastquery",
    "aws-sdk-swift.AWSFraudDetector",
    "aws-sdk-swift.AWSFreeTier",
    "aws-sdk-swift.AWSGameLift",
    "aws-sdk-swift.AWSGlacier",
    "aws-sdk-swift.AWSGlobalAccelerator",
    "aws-sdk-swift.AWSGlue",
    "aws-sdk-swift.AWSGrafana",
    "aws-sdk-swift.AWSGreengrass",
    "aws-sdk-swift.AWSGreengrassV2",
    "aws-sdk-swift.AWSGroundStation",
    "aws-sdk-swift.AWSGuardDuty",
    "aws-sdk-swift.AWSHealth",
    "aws-sdk-swift.AWSHealthLake",
    "aws-sdk-swift.AWSIAM",
    "aws-sdk-swift.AWSIVSRealTime",
    "aws-sdk-swift.AWSIdentitystore",
    "aws-sdk-swift.AWSImagebuilder",
    "aws-sdk-swift.AWSInspector",
    "aws-sdk-swift.AWSInspector2",
    "aws-sdk-swift.AWSInspectorScan",
    "aws-sdk-swift.AWSInternetMonitor",
    "aws-sdk-swift.AWSIoT",
    "aws-sdk-swift.AWSIoT1ClickDevicesService",
    "aws-sdk-swift.AWSIoT1ClickProjects",
    "aws-sdk-swift.AWSIoTAnalytics",
    "aws-sdk-swift.AWSIoTDataPlane",
    "aws-sdk-swift.AWSIoTEvents",
    "aws-sdk-swift.AWSIoTEventsData",
    "aws-sdk-swift.AWSIoTFleetHub",
    "aws-sdk-swift.AWSIoTFleetWise",
    "aws-sdk-swift.AWSIoTJobsDataPlane",
    "aws-sdk-swift.AWSIoTSecureTunneling",
    "aws-sdk-swift.AWSIoTSiteWise",
    "aws-sdk-swift.AWSIoTThingsGraph",
    "aws-sdk-swift.AWSIoTTwinMaker",
    "aws-sdk-swift.AWSIoTWireless",
    "aws-sdk-swift.AWSIotDeviceAdvisor",
    "aws-sdk-swift.AWSIvs",
    "aws-sdk-swift.AWSIvschat",
    "aws-sdk-swift.AWSKMS",
    "aws-sdk-swift.AWSKafka",
    "aws-sdk-swift.AWSKafkaConnect",
    "aws-sdk-swift.AWSKendra",
    "aws-sdk-swift.AWSKendraRanking",
    "aws-sdk-swift.AWSKeyspaces",
    "aws-sdk-swift.AWSKinesis",
    "aws-sdk-swift.AWSKinesisAnalytics",
    "aws-sdk-swift.AWSKinesisAnalyticsV2",
    "aws-sdk-swift.AWSKinesisVideo",
    "aws-sdk-swift.AWSKinesisVideoArchivedMedia",
    "aws-sdk-swift.AWSKinesisVideoMedia",
    "aws-sdk-swift.AWSKinesisVideoSignaling",
    "aws-sdk-swift.AWSKinesisVideoWebRTCStorage",
    "aws-sdk-swift.AWSLakeFormation",
    "aws-sdk-swift.AWSLambda",
    "aws-sdk-swift.AWSLaunchWizard",
    "aws-sdk-swift.AWSLexModelBuildingService",
    "aws-sdk-swift.AWSLexModelsV2",
    "aws-sdk-swift.AWSLexRuntimeService",
    "aws-sdk-swift.AWSLexRuntimeV2",
    "aws-sdk-swift.AWSLicenseManager",
    "aws-sdk-swift.AWSLicenseManagerLinuxSubscriptions",
    "aws-sdk-swift.AWSLicenseManagerUserSubscriptions",
    "aws-sdk-swift.AWSLightsail",
    "aws-sdk-swift.AWSLocation",
    "aws-sdk-swift.AWSLookoutEquipment",
    "aws-sdk-swift.AWSLookoutMetrics",
    "aws-sdk-swift.AWSLookoutVision",
    "aws-sdk-swift.AWSM2",
    "aws-sdk-swift.AWSMTurk",
    "aws-sdk-swift.AWSMWAA",
    "aws-sdk-swift.AWSMachineLearning",
    "aws-sdk-swift.AWSMacie2",
    "aws-sdk-swift.AWSMailManager",
    "aws-sdk-swift.AWSManagedBlockchain",
    "aws-sdk-swift.AWSManagedBlockchainQuery",
    "aws-sdk-swift.AWSMarketplaceAgreement",
    "aws-sdk-swift.AWSMarketplaceCatalog",
    "aws-sdk-swift.AWSMarketplaceCommerceAnalytics",
    "aws-sdk-swift.AWSMarketplaceDeployment",
    "aws-sdk-swift.AWSMarketplaceEntitlementService",
    "aws-sdk-swift.AWSMarketplaceMetering",
    "aws-sdk-swift.AWSMarketplaceReporting",
    "aws-sdk-swift.AWSMediaConnect",
    "aws-sdk-swift.AWSMediaConvert",
    "aws-sdk-swift.AWSMediaLive",
    "aws-sdk-swift.AWSMediaPackage",
    "aws-sdk-swift.AWSMediaPackageV2",
    "aws-sdk-swift.AWSMediaPackageVod",
    "aws-sdk-swift.AWSMediaStore",
    "aws-sdk-swift.AWSMediaStoreData",
    "aws-sdk-swift.AWSMediaTailor",
    "aws-sdk-swift.AWSMedicalImaging",
    "aws-sdk-swift.AWSMemoryDB",
    "aws-sdk-swift.AWSMgn",
    "aws-sdk-swift.AWSMigrationHub",
    "aws-sdk-swift.AWSMigrationHubConfig",
    "aws-sdk-swift.AWSMigrationHubOrchestrator",
    "aws-sdk-swift.AWSMigrationHubRefactorSpaces",
    "aws-sdk-swift.AWSMigrationHubStrategy",
    "aws-sdk-swift.AWSMq",
    "aws-sdk-swift.AWSNeptune",
    "aws-sdk-swift.AWSNeptuneGraph",
    "aws-sdk-swift.AWSNeptunedata",
    "aws-sdk-swift.AWSNetworkFirewall",
    "aws-sdk-swift.AWSNetworkManager",
    "aws-sdk-swift.AWSNetworkMonitor",
    "aws-sdk-swift.AWSNimble",
    "aws-sdk-swift.AWSOAM",
    "aws-sdk-swift.AWSOSIS",
    "aws-sdk-swift.AWSOmics",
    "aws-sdk-swift.AWSOpenSearch",
    "aws-sdk-swift.AWSOpenSearchServerless",
    "aws-sdk-swift.AWSOpsWorks",
    "aws-sdk-swift.AWSOpsWorksCM",
    "aws-sdk-swift.AWSOrganizations",
    "aws-sdk-swift.AWSOutposts",
    "aws-sdk-swift.AWSPCS",
    "aws-sdk-swift.AWSPI",
    "aws-sdk-swift.AWSPanorama",
    "aws-sdk-swift.AWSPaymentCryptography",
    "aws-sdk-swift.AWSPaymentCryptographyData",
    "aws-sdk-swift.AWSPcaConnectorAd",
    "aws-sdk-swift.AWSPcaConnectorScep",
    "aws-sdk-swift.AWSPersonalize",
    "aws-sdk-swift.AWSPersonalizeEvents",
    "aws-sdk-swift.AWSPersonalizeRuntime",
    "aws-sdk-swift.AWSPinpoint",
    "aws-sdk-swift.AWSPinpointEmail",
    "aws-sdk-swift.AWSPinpointSMSVoice",
    "aws-sdk-swift.AWSPinpointSMSVoiceV2",
    "aws-sdk-swift.AWSPipes",
    "aws-sdk-swift.AWSPolly",
    "aws-sdk-swift.AWSPricing",
    "aws-sdk-swift.AWSPrivateNetworks",
    "aws-sdk-swift.AWSProton",
    "aws-sdk-swift.AWSQApps",
    "aws-sdk-swift.AWSQBusiness",
    "aws-sdk-swift.AWSQConnect",
    "aws-sdk-swift.AWSQLDB",
    "aws-sdk-swift.AWSQLDBSession",
    "aws-sdk-swift.AWSQuickSight",
    "aws-sdk-swift.AWSRAM",
    "aws-sdk-swift.AWSRDS",
    "aws-sdk-swift.AWSRDSData",
    "aws-sdk-swift.AWSRUM",
    "aws-sdk-swift.AWSRbin",
    "aws-sdk-swift.AWSRedshift",
    "aws-sdk-swift.AWSRedshiftData",
    "aws-sdk-swift.AWSRedshiftServerless",
    "aws-sdk-swift.AWSRekognition",
    "aws-sdk-swift.AWSRepostspace",
    "aws-sdk-swift.AWSResiliencehub",
    "aws-sdk-swift.AWSResourceExplorer2",
    "aws-sdk-swift.AWSResourceGroups",
    "aws-sdk-swift.AWSResourceGroupsTaggingAPI",
    "aws-sdk-swift.AWSRoboMaker",
    "aws-sdk-swift.AWSRolesAnywhere",
    "aws-sdk-swift.AWSRoute53",
    "aws-sdk-swift.AWSRoute53Domains",
    "aws-sdk-swift.AWSRoute53Profiles",
    "aws-sdk-swift.AWSRoute53RecoveryCluster",
    "aws-sdk-swift.AWSRoute53RecoveryControlConfig",
    "aws-sdk-swift.AWSRoute53RecoveryReadiness",
    "aws-sdk-swift.AWSRoute53Resolver",
    "aws-sdk-swift.AWSS3",
    "aws-sdk-swift.AWSS3Control",
    "aws-sdk-swift.AWSS3Outposts",
    "aws-sdk-swift.AWSSES",
    "aws-sdk-swift.AWSSESv2",
    "aws-sdk-swift.AWSSFN",
    "aws-sdk-swift.AWSSMS",
    "aws-sdk-swift.AWSSNS",
    "aws-sdk-swift.AWSSQS",
    "aws-sdk-swift.AWSSSM",
    "aws-sdk-swift.AWSSSMContacts",
    "aws-sdk-swift.AWSSSMIncidents",
    "aws-sdk-swift.AWSSSMQuickSetup",
    "aws-sdk-swift.AWSSSO",
    "aws-sdk-swift.AWSSSOAdmin",
    "aws-sdk-swift.AWSSSOOIDC",
    "aws-sdk-swift.AWSSTS",
    "aws-sdk-swift.AWSSWF",
    "aws-sdk-swift.AWSSageMaker",
    "aws-sdk-swift.AWSSageMakerA2IRuntime",
    "aws-sdk-swift.AWSSageMakerFeatureStoreRuntime",
    "aws-sdk-swift.AWSSageMakerGeospatial",
    "aws-sdk-swift.AWSSageMakerMetrics",
    "aws-sdk-swift.AWSSageMakerRuntime",
    "aws-sdk-swift.AWSSagemakerEdge",
    "aws-sdk-swift.AWSSavingsplans",
    "aws-sdk-swift.AWSScheduler",
    "aws-sdk-swift.AWSSchemas",
    "aws-sdk-swift.AWSSecretsManager",
    "aws-sdk-swift.AWSSecurityHub",
    "aws-sdk-swift.AWSSecurityLake",
    "aws-sdk-swift.AWSServerlessApplicationRepository",
    "aws-sdk-swift.AWSServiceCatalog",
    "aws-sdk-swift.AWSServiceCatalogAppRegistry",
    "aws-sdk-swift.AWSServiceDiscovery",
    "aws-sdk-swift.AWSServiceQuotas",
    "aws-sdk-swift.AWSShield",
    "aws-sdk-swift.AWSSigner",
    "aws-sdk-swift.AWSSimSpaceWeaver",
    "aws-sdk-swift.AWSSnowDeviceManagement",
    "aws-sdk-swift.AWSSnowball",
    "aws-sdk-swift.AWSSocialMessaging",
    "aws-sdk-swift.AWSSsmSap",
    "aws-sdk-swift.AWSStorageGateway",
    "aws-sdk-swift.AWSSupplyChain",
    "aws-sdk-swift.AWSSupport",
    "aws-sdk-swift.AWSSupportApp",
    "aws-sdk-swift.AWSSynthetics",
    "aws-sdk-swift.AWSTaxSettings",
    "aws-sdk-swift.AWSTextract",
    "aws-sdk-swift.AWSTimestreamInfluxDB",
    "aws-sdk-swift.AWSTimestreamQuery",
    "aws-sdk-swift.AWSTimestreamWrite",
    "aws-sdk-swift.AWSTnb",
    "aws-sdk-swift.AWSTranscribe",
    "aws-sdk-swift.AWSTranscribeStreaming",
    "aws-sdk-swift.AWSTransfer",
    "aws-sdk-swift.AWSTranslate",
    "aws-sdk-swift.AWSTrustedAdvisor",
    "aws-sdk-swift.AWSVPCLattice",
    "aws-sdk-swift.AWSVerifiedPermissions",
    "aws-sdk-swift.AWSVoiceID",
    "aws-sdk-swift.AWSWAF",
    "aws-sdk-swift.AWSWAFRegional",
    "aws-sdk-swift.AWSWAFV2",
    "aws-sdk-swift.AWSWellArchitected",
    "aws-sdk-swift.AWSWisdom",
    "aws-sdk-swift.AWSWorkDocs",
    "aws-sdk-swift.AWSWorkMail",
    "aws-sdk-swift.AWSWorkMailMessageFlow",
    "aws-sdk-swift.AWSWorkSpaces",
    "aws-sdk-swift.AWSWorkSpacesThinClient",
    "aws-sdk-swift.AWSWorkSpacesWeb",
    "aws-sdk-swift.AWSXRay",
]

// MARK: - Static Content

// MARK: Target Dependencies

extension Target.Dependency {
    // AWS modules
    static var awsClientRuntime: Self { "AWSClientRuntime" }
    static var awsSDKCommon: Self { "AWSSDKCommon" }
    static var awsSDKEventStreamsAuth: Self { "AWSSDKEventStreamsAuth" }
    static var awsSDKHTTPAuth: Self { "AWSSDKHTTPAuth" }
    static var awsSDKIdentity: Self { "AWSSDKIdentity" }
    static var awsSDKChecksums: Self { "AWSSDKChecksums" }

    // CRT module
    static var crt: Self { .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift") }

    // Smithy modules
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithy: Self { .product(name: "Smithy", package: "smithy-swift") }
    static var smithyChecksumsAPI: Self { .product(name: "SmithyChecksumsAPI", package: "smithy-swift") }
    static var smithyChecksums: Self { .product(name: "SmithyChecksums", package: "smithy-swift") }
    static var smithyEventStreams: Self { .product(name: "SmithyEventStreams", package: "smithy-swift") }
    static var smithyEventStreamsAPI: Self { .product(name: "SmithyEventStreamsAPI", package: "smithy-swift") }
    static var smithyEventStreamsAuthAPI: Self { .product(name: "SmithyEventStreamsAuthAPI", package: "smithy-swift") }
    static var smithyHTTPAPI: Self { .product(name: "SmithyHTTPAPI", package: "smithy-swift") }
    static var smithyHTTPAuth: Self { .product(name: "SmithyHTTPAuth", package: "smithy-swift") }
    static var smithyIdentity: Self { .product(name: "SmithyIdentity", package: "smithy-swift") }
    static var smithyIdentityAPI: Self { .product(name: "SmithyIdentityAPI", package: "smithy-swift") }
    static var smithyRetries: Self { .product(name: "SmithyRetries", package: "smithy-swift") }
    static var smithyRetriesAPI: Self { .product(name: "SmithyRetriesAPI", package: "smithy-swift") }
    static var smithyWaitersAPI: Self { .product(name: "SmithyWaitersAPI", package: "smithy-swift") }
    static var smithyTestUtils: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
    static var smithyStreams: Self { .product(name: "SmithyStreams", package: "smithy-swift") }
}

// MARK: Base Package

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products:
        runtimeProducts +
        serviceTargets.map(productForService(_:)),
    dependencies:
        [clientRuntimeDependency, crtDependency, doccDependencyOrNil].compactMap { $0 },
    targets:
        runtimeTargets +
        runtimeTestTargets +
        serviceTargets.map(target(_:)) +
        serviceTargets.map(unitTestTarget(_:))
)

// MARK: Products

private var runtimeProducts: [Product] {
    ["AWSClientRuntime", "AWSSDKCommon", "AWSSDKEventStreamsAuth", "AWSSDKHTTPAuth", "AWSSDKIdentity", "AWSSDKChecksums"]
        .map { .library(name: $0, targets: [$0]) }
}

private func productForService(_ service: String) -> Product {
    .library(name: service, targets: [String(service.trimmingPrefix("aws-sdk-swift."))])
}

// MARK: Dependencies

private var clientRuntimeDependency: Package.Dependency {
    let path = "../smithy-swift"
    let gitURL = "https://github.com/smithy-lang/smithy-swift"
    let useLocalDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_LOCAL_DEPS"] != nil
    return useLocalDeps ? .package(path: path) : .package(url: gitURL, exact: clientRuntimeVersion)
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
                .crt,
                .clientRuntime,
                .smithyRetriesAPI,
                .smithyRetries,
                .smithyEventStreamsAPI,
                .smithyEventStreamsAuthAPI,
                .awsSDKCommon,
                .awsSDKHTTPAuth,
                .awsSDKIdentity
            ],
            path: "Sources/Core/aws-sdk-swift.AWSClientRuntime/Sources/AWSClientRuntime",
            resources: [
                .process("Resources"),
            ]
        ),
        .target(
            name: "AWSSDKCommon",
            dependencies: [.crt],
            path: "Sources/Core/aws-sdk-swift.AWSSDKCommon/Sources"
        ),
        .target(
            name: "AWSSDKEventStreamsAuth",
            dependencies: [.smithyEventStreamsAPI, .smithyEventStreamsAuthAPI, .smithyEventStreams, .crt, .clientRuntime, "AWSSDKHTTPAuth"],
            path: "Sources/Core/aws-sdk-swift.AWSSDKEventStreamsAuth/Sources"
        ),
        .target(
            name: "AWSSDKHTTPAuth",
            dependencies: [.crt, .smithy, .clientRuntime, .smithyHTTPAuth, "AWSSDKIdentity", "AWSSDKChecksums"],
            path: "Sources/Core/aws-sdk-swift.AWSSDKHTTPAuth/Sources"
        ),
        .target(
            name: "AWSSDKIdentity",
            dependencies: [.crt, .smithy, .clientRuntime, .smithyIdentity, .smithyIdentityAPI, .smithyHTTPAPI, .awsSDKCommon],
            path: "Sources/Core/aws-sdk-swift.AWSSDKIdentity/Sources"
        ),
        .target(
            name: "AWSSDKChecksums",
            dependencies: [.crt, .smithy, .clientRuntime, .smithyChecksumsAPI, .smithyChecksums, .smithyHTTPAPI],
            path: "Sources/Core/aws-sdk-swift.AWSSDKChecksums/Sources"
        )
    ]
}

private var runtimeTestTargets: [Target] {
    guard !excludeRuntimeUnitTests else { return [] }
    return [
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [.awsClientRuntime, .clientRuntime, .smithyTestUtils, .awsSDKCommon],
            path: "Sources/Core/aws-sdk-swift.AWSClientRuntime/Tests/AWSClientRuntimeTests",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AWSSDKEventStreamsAuthTests",
            dependencies: ["AWSClientRuntime", "AWSSDKEventStreamsAuth", .smithyStreams, .smithyTestUtils],
            path: "Sources/Core/aws-sdk-swift.AWSSDKEventStreamsAuth/Tests/AWSSDKEventStreamsAuthTests"
        ),
        .testTarget(
            name: "AWSSDKHTTPAuthTests",
            dependencies: ["AWSSDKHTTPAuth", "AWSClientRuntime", "AWSSDKEventStreamsAuth", .crt, .clientRuntime, .smithyTestUtils],
            path: "Sources/Core/aws-sdk-swift.AWSSDKHTTPAuth/Tests/AWSSDKHTTPAuthTests"
        ),
        .testTarget(
            name: "AWSSDKIdentityTests",
            dependencies: [.smithy, .smithyIdentity, "AWSSDKIdentity", .awsClientRuntime],
            path: "Sources/Core/aws-sdk-swift.AWSSDKIdentity/Tests/AWSSDKIdentityTests",
            resources: [.process("Resources")]
        ),
    ]
}

private func target(_ service: String) -> Target {
    .target(
        name: String(service.trimmingPrefix("aws-sdk-swift.")),
        dependencies: [
            .clientRuntime,
            .awsClientRuntime,
            .smithyRetriesAPI,
            .smithyRetries,
            .smithy,
            .smithyIdentity,
            .smithyIdentityAPI,
            .smithyEventStreamsAPI,
            .smithyEventStreamsAuthAPI,
            .smithyEventStreams,
            .smithyChecksumsAPI,
            .smithyChecksums,
            .smithyWaitersAPI,
            .awsSDKCommon,
            .awsSDKIdentity,
            .awsSDKHTTPAuth,
            .awsSDKEventStreamsAuth,
            .awsSDKChecksums,
        ],
        path: "Sources/Services/\(service)/Sources/\(service.trimmingPrefix("aws-sdk-swift."))",
        resources: [.process("Resources")]
    )
}

private func unitTestTarget(_ service: String) -> Target {
    let testName = "\(service)Tests".trimmingPrefix("aws-sdk-swift.")
    return .testTarget(
        name: "\(testName)",
        dependencies: [.clientRuntime, .awsClientRuntime, .byName(name: String(service.trimmingPrefix("aws-sdk-swift."))), .smithyTestUtils],
        path: "Sources/Services/\(service)/Tests/\(testName)"
    )
}
