// swift-tools-version:5.5

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

// MARK: - Target Dependencies

extension Target.Dependency {
    static var awsClientRuntime: Self { "AWSClientRuntime" }
    static var crt: Self { .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift") }
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithyTestUtils: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
}

// MARK: - Base Package

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [.crt, .clientRuntime],
            path: "./Sources/Core/AWSClientRuntime"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [.awsClientRuntime, .clientRuntime, .smithyTestUtils],
            path: "./Tests/Core/AWSClientRuntimeTests",
            resources: [.process("Resources")]
        )
    ]
)

// MARK: - Dependencies

func addDependencies(clientRuntimeVersion: Version, crtVersion: Version) {
    addClientRuntimeDependency(clientRuntimeVersion)
    addCRTDependency(crtVersion)
}

func addClientRuntimeDependency(_ version: Version) {
    let smithySwiftURL = "https://github.com/awslabs/smithy-swift"
    let useLocalDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_LOCAL_DEPS"] != nil
    let useMainDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_MAIN_DEPS"] != nil
    switch (useLocalDeps, useMainDeps) {
    case (true, true):
        fatalError("Unable to determine which dependencies to use. Please only specify one of AWS_SWIFT_SDK_USE_LOCAL_DEPS or AWS_SWIFT_SDK_USE_MAIN_DEPS.")
    case (true, false):
        package.dependencies += [
            .package(path: "../smithy-swift")
        ]
    case (false, true):
        package.dependencies += [
            .package(url: smithySwiftURL, .branch("main"))
        ]
    case (false, false):
        package.dependencies += [
            .package(url: smithySwiftURL, .exact(version))
        ]
    }
}

func addCRTDependency(_ version: Version) {
    package.dependencies += [
        .package(url: "https://github.com/awslabs/aws-crt-swift", .exact(version))
    ]
}

// MARK: - Services

func addServiceTarget(_ name: String) {
    let testName = "\(name)Tests"
    package.products += [
        .library(name: name, targets: [name]),
    ]
    package.targets += [
        .target(
            name: name,
            dependencies: [.clientRuntime, .awsClientRuntime],
            path: "./Sources/Services/\(name)"
        ),
        .testTarget(
            name: "\(testName)",
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils],
            path: "./Tests/Services/\(testName)"
        )
    ]
}

func addIntegrationTestTarget(_ name: String) {
    let integrationTestName = "\(name)IntegrationTests"
    package.targets += [
        .testTarget(
            name: integrationTestName,
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils],
            path: "./IntegrationTests/Services/\(integrationTestName)",
            resources: [.process("Resources")]
        )
    ]
}


// MARK: - Generated

addDependencies(
    clientRuntimeVersion: "0.19.0",
    crtVersion: "0.9.0"
)

let serviceTargets: [String] = [
    "AWSACM",
    "AWSACMPCA",
    "AWSAPIGateway",
    "AWSARCZonalShift",
    "AWSAccessAnalyzer",
    "AWSAccount",
    "AWSAlexaForBusiness",
    "AWSAmp",
    "AWSAmplify",
    "AWSAmplifyBackend",
    "AWSAmplifyUIBuilder",
    "AWSApiGatewayManagementApi",
    "AWSApiGatewayV2",
    "AWSAppConfig",
    "AWSAppConfigData",
    "AWSAppIntegrations",
    "AWSAppMesh",
    "AWSAppRunner",
    "AWSAppStream",
    "AWSAppSync",
    "AWSAppflow",
    "AWSApplicationAutoScaling",
    "AWSApplicationCostProfiler",
    "AWSApplicationDiscoveryService",
    "AWSApplicationInsights",
    "AWSAthena",
    "AWSAuditManager",
    "AWSAutoScaling",
    "AWSAutoScalingPlans",
    "AWSBackup",
    "AWSBackupGateway",
    "AWSBackupStorage",
    "AWSBatch",
    "AWSBillingconductor",
    "AWSBraket",
    "AWSBudgets",
    "AWSChime",
    "AWSChimeSDKIdentity",
    "AWSChimeSDKMediaPipelines",
    "AWSChimeSDKMeetings",
    "AWSChimeSDKMessaging",
    "AWSChimeSDKVoice",
    "AWSCleanRooms",
    "AWSCloud9",
    "AWSCloudControl",
    "AWSCloudDirectory",
    "AWSCloudFormation",
    "AWSCloudFront",
    "AWSCloudHSM",
    "AWSCloudHSMV2",
    "AWSCloudSearch",
    "AWSCloudSearchDomain",
    "AWSCloudTrail",
    "AWSCloudTrailData",
    "AWSCloudWatch",
    "AWSCloudWatchEvents",
    "AWSCloudWatchLogs",
    "AWSCodeBuild",
    "AWSCodeCatalyst",
    "AWSCodeCommit",
    "AWSCodeDeploy",
    "AWSCodeGuruProfiler",
    "AWSCodeGuruReviewer",
    "AWSCodePipeline",
    "AWSCodeStar",
    "AWSCodeStarconnections",
    "AWSCodeartifact",
    "AWSCodestarnotifications",
    "AWSCognitoIdentity",
    "AWSCognitoIdentityProvider",
    "AWSCognitoSync",
    "AWSComprehend",
    "AWSComprehendMedical",
    "AWSComputeOptimizer",
    "AWSConfigService",
    "AWSConnect",
    "AWSConnectCampaigns",
    "AWSConnectCases",
    "AWSConnectContactLens",
    "AWSConnectParticipant",
    "AWSControlTower",
    "AWSCostExplorer",
    "AWSCostandUsageReportService",
    "AWSCustomerProfiles",
    "AWSDAX",
    "AWSDLM",
    "AWSDataBrew",
    "AWSDataExchange",
    "AWSDataPipeline",
    "AWSDataSync",
    "AWSDatabaseMigrationService",
    "AWSDetective",
    "AWSDevOpsGuru",
    "AWSDeviceFarm",
    "AWSDirectConnect",
    "AWSDirectoryService",
    "AWSDocDB",
    "AWSDocDBElastic",
    "AWSDrs",
    "AWSDynamoDB",
    "AWSDynamoDBStreams",
    "AWSEBS",
    "AWSEC2",
    "AWSEC2InstanceConnect",
    "AWSECR",
    "AWSECRPUBLIC",
    "AWSECS",
    "AWSEFS",
    "AWSEKS",
    "AWSEMR",
    "AWSEMRServerless",
    "AWSEMRcontainers",
    "AWSElastiCache",
    "AWSElasticBeanstalk",
    "AWSElasticInference",
    "AWSElasticLoadBalancing",
    "AWSElasticLoadBalancingv2",
    "AWSElasticTranscoder",
    "AWSElasticsearchService",
    "AWSEventBridge",
    "AWSEvidently",
    "AWSFMS",
    "AWSFSx",
    "AWSFinspace",
    "AWSFinspacedata",
    "AWSFirehose",
    "AWSFis",
    "AWSForecast",
    "AWSForecastquery",
    "AWSFraudDetector",
    "AWSGameLift",
    "AWSGameSparks",
    "AWSGlacier",
    "AWSGlobalAccelerator",
    "AWSGlue",
    "AWSGrafana",
    "AWSGreengrass",
    "AWSGreengrassV2",
    "AWSGroundStation",
    "AWSGuardDuty",
    "AWSHealth",
    "AWSHealthLake",
    "AWSHoneycode",
    "AWSIAM",
    "AWSIVSRealTime",
    "AWSIdentitystore",
    "AWSImagebuilder",
    "AWSInspector",
    "AWSInspector2",
    "AWSInternetMonitor",
    "AWSIoT",
    "AWSIoT1ClickDevicesService",
    "AWSIoT1ClickProjects",
    "AWSIoTAnalytics",
    "AWSIoTDataPlane",
    "AWSIoTEvents",
    "AWSIoTEventsData",
    "AWSIoTFleetHub",
    "AWSIoTFleetWise",
    "AWSIoTJobsDataPlane",
    "AWSIoTRoboRunner",
    "AWSIoTSecureTunneling",
    "AWSIoTSiteWise",
    "AWSIoTThingsGraph",
    "AWSIoTTwinMaker",
    "AWSIoTWireless",
    "AWSIotDeviceAdvisor",
    "AWSIvs",
    "AWSIvschat",
    "AWSKMS",
    "AWSKafka",
    "AWSKafkaConnect",
    "AWSKendra",
    "AWSKendraRanking",
    "AWSKeyspaces",
    "AWSKinesis",
    "AWSKinesisAnalytics",
    "AWSKinesisAnalyticsV2",
    "AWSKinesisVideo",
    "AWSKinesisVideoArchivedMedia",
    "AWSKinesisVideoMedia",
    "AWSKinesisVideoSignaling",
    "AWSKinesisVideoWebRTCStorage",
    "AWSLakeFormation",
    "AWSLambda",
    "AWSLexModelBuildingService",
    "AWSLexModelsV2",
    "AWSLexRuntimeService",
    "AWSLexRuntimeV2",
    "AWSLicenseManager",
    "AWSLicenseManagerLinuxSubscriptions",
    "AWSLicenseManagerUserSubscriptions",
    "AWSLightsail",
    "AWSLocation",
    "AWSLookoutEquipment",
    "AWSLookoutMetrics",
    "AWSLookoutVision",
    "AWSM2",
    "AWSMTurk",
    "AWSMWAA",
    "AWSMachineLearning",
    "AWSMacie",
    "AWSMacie2",
    "AWSManagedBlockchain",
    "AWSMarketplaceCatalog",
    "AWSMarketplaceCommerceAnalytics",
    "AWSMarketplaceEntitlementService",
    "AWSMarketplaceMetering",
    "AWSMediaConnect",
    "AWSMediaConvert",
    "AWSMediaLive",
    "AWSMediaPackage",
    "AWSMediaPackageVod",
    "AWSMediaStore",
    "AWSMediaStoreData",
    "AWSMediaTailor",
    "AWSMemoryDB",
    "AWSMgn",
    "AWSMigrationHub",
    "AWSMigrationHubConfig",
    "AWSMigrationHubOrchestrator",
    "AWSMigrationHubRefactorSpaces",
    "AWSMigrationHubStrategy",
    "AWSMobile",
    "AWSMq",
    "AWSNeptune",
    "AWSNetworkFirewall",
    "AWSNetworkManager",
    "AWSNimble",
    "AWSOAM",
    "AWSOmics",
    "AWSOpenSearch",
    "AWSOpenSearchServerless",
    "AWSOpsWorks",
    "AWSOpsWorksCM",
    "AWSOrganizations",
    "AWSOutposts",
    "AWSPI",
    "AWSPanorama",
    "AWSPersonalize",
    "AWSPersonalizeEvents",
    "AWSPersonalizeRuntime",
    "AWSPinpoint",
    "AWSPinpointEmail",
    "AWSPinpointSMSVoice",
    "AWSPinpointSMSVoiceV2",
    "AWSPipes",
    "AWSPolly",
    "AWSPricing",
    "AWSPrivateNetworks",
    "AWSProton",
    "AWSQLDB",
    "AWSQLDBSession",
    "AWSQuickSight",
    "AWSRAM",
    "AWSRDS",
    "AWSRDSData",
    "AWSRUM",
    "AWSRbin",
    "AWSRedshift",
    "AWSRedshiftData",
    "AWSRedshiftServerless",
    "AWSRekognition",
    "AWSResiliencehub",
    "AWSResourceExplorer2",
    "AWSResourceGroups",
    "AWSResourceGroupsTaggingAPI",
    "AWSRoboMaker",
    "AWSRolesAnywhere",
    "AWSRoute53",
    "AWSRoute53Domains",
    "AWSRoute53RecoveryCluster",
    "AWSRoute53RecoveryControlConfig",
    "AWSRoute53RecoveryReadiness",
    "AWSRoute53Resolver",
    "AWSS3",
    "AWSS3Control",
    "AWSS3Outposts",
    "AWSSES",
    "AWSSESv2",
    "AWSSFN",
    "AWSSMS",
    "AWSSNS",
    "AWSSQS",
    "AWSSSM",
    "AWSSSMContacts",
    "AWSSSMIncidents",
    "AWSSSO",
    "AWSSSOAdmin",
    "AWSSSOOIDC",
    "AWSSTS",
    "AWSSWF",
    "AWSSageMaker",
    "AWSSageMakerA2IRuntime",
    "AWSSageMakerFeatureStoreRuntime",
    "AWSSageMakerGeospatial",
    "AWSSageMakerMetrics",
    "AWSSageMakerRuntime",
    "AWSSagemakerEdge",
    "AWSSavingsplans",
    "AWSScheduler",
    "AWSSchemas",
    "AWSSecretsManager",
    "AWSSecurityHub",
    "AWSSecurityLake",
    "AWSServerlessApplicationRepository",
    "AWSServiceCatalog",
    "AWSServiceCatalogAppRegistry",
    "AWSServiceDiscovery",
    "AWSServiceQuotas",
    "AWSShield",
    "AWSSigner",
    "AWSSimSpaceWeaver",
    "AWSSnowDeviceManagement",
    "AWSSnowball",
    "AWSSsmSap",
    "AWSStorageGateway",
    "AWSSupport",
    "AWSSupportApp",
    "AWSSynthetics",
    "AWSTextract",
    "AWSTimestreamQuery",
    "AWSTimestreamWrite",
    "AWSTnb",
    "AWSTranscribe",
    "AWSTranscribeStreaming",
    "AWSTransfer",
    "AWSTranslate",
    "AWSVPCLattice",
    "AWSVoiceID",
    "AWSWAF",
    "AWSWAFRegional",
    "AWSWAFV2",
    "AWSWellArchitected",
    "AWSWisdom",
    "AWSWorkDocs",
    "AWSWorkLink",
    "AWSWorkMail",
    "AWSWorkMailMessageFlow",
    "AWSWorkSpaces",
    "AWSWorkSpacesWeb",
    "AWSXRay",
]

serviceTargets.forEach(addServiceTarget)

let servicesWithIntegrationTests: [String] = [
]

servicesWithIntegrationTests.forEach(addIntegrationTestTarget)