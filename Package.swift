// swift-tools-version:5.7

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
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
    ],
    targets: [
        .target(
            name: "AWSSDKForSwift",
            path: "Sources/Core/AWSSDKForSwift",
            exclude: ["Documentation.docc/AWSSDKForSwift.md"]
        ),
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
    addDoccDependency()
}

func addClientRuntimeDependency(_ version: Version) {
    let smithySwiftURL = "https://github.com/smithy-lang/smithy-swift"
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
            .package(url: smithySwiftURL, branch: "main")
        ]
    case (false, false):
        package.dependencies += [
            .package(url: smithySwiftURL, exact: version)
        ]
    }
}

func addCRTDependency(_ version: Version) {
    package.dependencies += [
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: version)
    ]
}

func addDoccDependency() {
    package.dependencies += [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ]
}

// MARK: - Services

func addServiceTarget(_ name: String) {
    package.products += [
        .library(name: name, targets: [name]),
    ]
    package.targets += [
        .target(
            name: name,
            dependencies: [.clientRuntime, .awsClientRuntime],
            path: "./Sources/Services/\(name)"
        )
    ]
}

func addServiceUnitTestTarget(_ name: String) {
    let testName = "\(name)Tests"
    package.targets += [
        .testTarget(
            name: "\(testName)",
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils],
            path: "./Tests/Services/\(testName)"
        )
    ]
}

func addIntegrationTestTarget(_ name: String) {
    let integrationTestName = "\(name)IntegrationTests"
    var additionalDependencies: [String] = []
    var exclusions: [String] = []
    switch name {
    case "AWSEC2":
        additionalDependencies = ["AWSIAM", "AWSSTS", "AWSCloudWatchLogs"]
        exclusions = [
            "Resources/IMDSIntegTestApp"
        ]
    case "AWSECS":
        additionalDependencies = ["AWSCloudWatchLogs", "AWSEC2",  "AWSIAM", "AWSSTS"]
        exclusions = [
            "README.md",
            "Resources/ECSIntegTestApp/"
        ]
    case "AWSS3":
        additionalDependencies = ["AWSSSOAdmin", "AWSS3Control", "AWSSTS"]
    case "AWSEventBridge":
        additionalDependencies = ["AWSRoute53"]
    case "AWSCloudFrontKeyValueStore":
        additionalDependencies = ["AWSCloudFront"]
    case "AWSSTS":
        additionalDependencies = ["AWSIAM", "AWSCognitoIdentity"]
    default:
        break
    }
    integrationTestServices.insert(name)
    additionalDependencies.forEach { integrationTestServices.insert($0) }
    package.targets += [
        .testTarget(
            name: integrationTestName,
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils] + additionalDependencies.map { Target.Dependency.target(name: $0, condition: nil) },
            path: "./IntegrationTests/Services/\(integrationTestName)",
            exclude: exclusions,
            resources: [.process("Resources")]
        )
    ]
}

var enabledServices = Set<String>()

var enabledServiceUnitTests = Set<String>()

func addAllServices() {
    enabledServices = Set(serviceTargets)
    enabledServiceUnitTests = Set(serviceTargets)
}

var integrationTestServices = Set<String>()

func addIntegrationTests() {
    servicesWithIntegrationTests.forEach { addIntegrationTestTarget($0) }
}

func excludeRuntimeUnitTests() {
    package.targets.removeAll { $0.name == "AWSClientRuntimeTests" }
}

func addProtocolTests() {

    struct ProtocolTest {
        let name: String
        let sourcePath: String
        let testPath: String?

        init(name: String, sourcePath: String, testPath: String? = nil) {
            self.name = name
            self.sourcePath = sourcePath
            self.testPath = testPath
        }
    }

    let baseDir = "codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
    let baseDirLocal = "codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"

    let protocolTests: [ProtocolTest] = [
        .init(name: "AWSRestJsonTestSDK", sourcePath: "\(baseDir)/aws-restjson"),
        .init(name: "AWSRestJsonValidationTestSDK", sourcePath: "\(baseDir)/aws-restjson-validation"),
        .init(name: "AWSJson1_0TestSDK", sourcePath: "\(baseDir)/aws-json-10"),
        .init(name: "AWSJson1_1TestSDK", sourcePath: "\(baseDir)/aws-json-11"),
        .init(name: "RestXmlTestSDK", sourcePath: "\(baseDir)/rest-xml"),
        .init(name: "RestXmlWithNamespaceTestSDK", sourcePath: "\(baseDir)/rest-xml-xmlns"),
        .init(name: "Ec2QueryTestSDK", sourcePath: "\(baseDir)/ec2-query"),
        .init(name: "AWSQueryTestSDK", sourcePath: "\(baseDir)/aws-query"),
        .init(name: "APIGatewayTestSDK", sourcePath: "\(baseDir)/apigateway"),
        .init(name: "GlacierTestSDK", sourcePath: "\(baseDir)/glacier"),
        .init(name: "MachineLearningTestSDK", sourcePath: "\(baseDir)/machinelearning"),
        .init(name: "S3TestSDK", sourcePath: "\(baseDir)/s3"),
        .init(name: "rest_json_extras", sourcePath: "\(baseDirLocal)/rest_json_extras"),
        .init(name: "AwsQueryExtras", sourcePath: "\(baseDirLocal)/AwsQueryExtras"),
        .init(name: "Waiters", sourcePath: "\(baseDirLocal)/Waiters", testPath: "codegen/protocol-test-codegen-local/Tests"),
    ]
    for protocolTest in protocolTests {
        package.targets += [
            .target(
                name: protocolTest.name,
                dependencies: [.clientRuntime, .awsClientRuntime],
                path: "\(protocolTest.sourcePath)/swift-codegen/\(protocolTest.name)"
            ),
            .testTarget(
                name: "\(protocolTest.name)Tests",
                dependencies: [.smithyTestUtils, .byNameItem(name: protocolTest.name, condition: nil)],
                path: "\(protocolTest.testPath ?? protocolTest.sourcePath)/swift-codegen/\(protocolTest.name)Tests"
            )
        ]
    }
}

func addResolvedTargets() {
    enabledServices.union(integrationTestServices).forEach(addServiceTarget)
    enabledServiceUnitTests.forEach(addServiceUnitTestTarget)
}


// MARK: - Generated

addDependencies(
    clientRuntimeVersion: "0.44.0",
    crtVersion: "0.29.0"
)

// Uncomment this line to exclude runtime unit tests
// excludeRuntimeUnitTests()

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
    "AWSAppFabric",
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
    "AWSArtifact",
    "AWSAthena",
    "AWSAuditManager",
    "AWSAutoScaling",
    "AWSAutoScalingPlans",
    "AWSB2bi",
    "AWSBCMDataExports",
    "AWSBackup",
    "AWSBackupGateway",
    "AWSBackupStorage",
    "AWSBatch",
    "AWSBedrock",
    "AWSBedrockAgent",
    "AWSBedrockAgentRuntime",
    "AWSBedrockRuntime",
    "AWSBillingconductor",
    "AWSBraket",
    "AWSBudgets",
    "AWSChatbot",
    "AWSChime",
    "AWSChimeSDKIdentity",
    "AWSChimeSDKMediaPipelines",
    "AWSChimeSDKMeetings",
    "AWSChimeSDKMessaging",
    "AWSChimeSDKVoice",
    "AWSCleanRooms",
    "AWSCleanRoomsML",
    "AWSCloud9",
    "AWSCloudControl",
    "AWSCloudDirectory",
    "AWSCloudFormation",
    "AWSCloudFront",
    "AWSCloudFrontKeyValueStore",
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
    "AWSCodeGuruSecurity",
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
    "AWSCostOptimizationHub",
    "AWSCostandUsageReportService",
    "AWSCustomerProfiles",
    "AWSDAX",
    "AWSDLM",
    "AWSDataBrew",
    "AWSDataExchange",
    "AWSDataPipeline",
    "AWSDataSync",
    "AWSDataZone",
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
    "AWSEKSAuth",
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
    "AWSEntityResolution",
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
    "AWSFreeTier",
    "AWSGameLift",
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
    "AWSInspectorScan",
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
    "AWSLaunchWizard",
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
    "AWSMacie2",
    "AWSManagedBlockchain",
    "AWSManagedBlockchainQuery",
    "AWSMarketplaceAgreement",
    "AWSMarketplaceCatalog",
    "AWSMarketplaceCommerceAnalytics",
    "AWSMarketplaceDeployment",
    "AWSMarketplaceEntitlementService",
    "AWSMarketplaceMetering",
    "AWSMediaConnect",
    "AWSMediaConvert",
    "AWSMediaLive",
    "AWSMediaPackage",
    "AWSMediaPackageV2",
    "AWSMediaPackageVod",
    "AWSMediaStore",
    "AWSMediaStoreData",
    "AWSMediaTailor",
    "AWSMedicalImaging",
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
    "AWSNeptuneGraph",
    "AWSNeptunedata",
    "AWSNetworkFirewall",
    "AWSNetworkManager",
    "AWSNetworkMonitor",
    "AWSNimble",
    "AWSOAM",
    "AWSOSIS",
    "AWSOmics",
    "AWSOpenSearch",
    "AWSOpenSearchServerless",
    "AWSOpsWorks",
    "AWSOpsWorksCM",
    "AWSOrganizations",
    "AWSOutposts",
    "AWSPI",
    "AWSPanorama",
    "AWSPaymentCryptography",
    "AWSPaymentCryptographyData",
    "AWSPcaConnectorAd",
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
    "AWSQBusiness",
    "AWSQConnect",
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
    "AWSRepostspace",
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
    "AWSSupplyChain",
    "AWSSupport",
    "AWSSupportApp",
    "AWSSynthetics",
    "AWSTextract",
    "AWSTimestreamInfluxDB",
    "AWSTimestreamQuery",
    "AWSTimestreamWrite",
    "AWSTnb",
    "AWSTranscribe",
    "AWSTranscribeStreaming",
    "AWSTransfer",
    "AWSTranslate",
    "AWSTrustedAdvisor",
    "AWSVPCLattice",
    "AWSVerifiedPermissions",
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
    "AWSWorkSpacesThinClient",
    "AWSWorkSpacesWeb",
    "AWSXRay",
]

// Uncomment this line to enable all services
addAllServices()

let servicesWithIntegrationTests: [String] = [
    "AWSCloudFrontKeyValueStore",
    "AWSEC2",
    "AWSECS",
    "AWSEventBridge",
    "AWSKinesis",
    "AWSMediaConvert",
    "AWSS3",
    "AWSSQS",
    "AWSSTS",
    "AWSTranscribeStreaming",
]

// Uncomment this line to enable integration tests
// addIntegrationTests()

// Uncomment this line to enable protocol tests
// addProtocolTests()

addResolvedTargets()

