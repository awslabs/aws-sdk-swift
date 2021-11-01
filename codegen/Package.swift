// swift-tools-version:5.4.0

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
 
import PackageDescription
import class Foundation.ProcessInfo
import class Foundation.FileManager

let baseDir = "./protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
let baseDirLocal = "./protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"

var package = Package(
    name: "ProtocolCodegenTests",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
    ],
    targets: [
    ]
)

appendLibTarget(name: "AWSRestJsonTestSDK", path: "\(baseDir)/aws-restjson")
appendTstTarget(name: "AWSRestJsonTestSDKTests", path: "\(baseDir)/aws-restjson", dependency: "AWSRestJsonTestSDK")

appendLibTarget(name: "AWSJson1_0TestSDK", path: "\(baseDir)/aws-json-10")
appendTstTarget(name: "AWSJson1_0TestSDKTests", path: "\(baseDir)/aws-json-10", dependency: "AWSJson1_0TestSDK")

appendLibTarget(name: "AWSJson1_1TestSDK", path: "\(baseDir)/aws-json-11")
appendTstTarget(name: "AWSJson1_1TestSDKTests", path: "\(baseDir)/aws-json-11", dependency: "AWSJson1_1TestSDK")

appendLibTarget(name: "RestXmlTestSDK", path: "\(baseDir)/rest-xml")
appendTstTarget(name: "RestXmlTestSDKTests", path: "\(baseDir)/rest-xml", dependency: "RestXmlTestSDK")

appendLibTarget(name: "RestXmlWithNamespaceTestSDK", path: "\(baseDir)/rest-xml-xmlns")
appendTstTarget(name: "RestXmlWithNamespaceTestSDKTests", path: "\(baseDir)/rest-xml-xmlns", dependency: "RestXmlWithNamespaceTestSDK")

appendLibTarget(name: "Ec2QueryTestSDK", path: "\(baseDir)/ec2-query")
appendTstTarget(name: "Ec2QueryTestSDKTests", path: "\(baseDir)/ec2-query", dependency: "Ec2QueryTestSDK")

appendLibTarget(name: "AWSQueryTestSDK", path: "\(baseDir)/aws-query")
appendTstTarget(name: "AWSQueryTestSDKTests", path: "\(baseDir)/aws-query", dependency: "AWSQueryTestSDK")

//Service specific
appendLibTarget(name: "APIGatewayTestSDK", path: "\(baseDir)/apigateway")
appendTstTarget(name: "APIGatewayTestSDKTests", path: "\(baseDir)/apigateway", dependency: "APIGatewayTestSDK")
appendLibTarget(name: "GlacierTestSDK", path: "\(baseDir)/glacier")
appendTstTarget(name: "GlacierTestSDKTests", path: "\(baseDir)/glacier", dependency: "GlacierTestSDK")
appendLibTarget(name: "MachineLearningTestSDK", path: "\(baseDir)/machinelearning")
appendTstTarget(name: "MachineLearningTestSDKTests", path: "\(baseDir)/machinelearning", dependency: "MachineLearningTestSDK")
appendLibTarget(name: "S3TestSDK", path: "\(baseDir)/s3")
appendTstTarget(name: "S3TestSDKTests", path: "\(baseDir)/s3", dependency: "S3TestSDK")

//Local tests
appendLibTarget(name: "aws_restjson", path: "\(baseDirLocal)/aws-restjson")
appendTstTarget(name: "aws_restjsonTests", path: "\(baseDirLocal)/aws-restjson", dependency: "aws_restjson")
appendLibTarget(name: "rest_json_extras", path: "\(baseDirLocal)/rest_json_extras")
appendTstTarget(name: "rest_json_extrasTests", path: "\(baseDirLocal)/rest_json_extras", dependency: "rest_json_extras")

func appendLibTarget(name: String, path: String) {
    package.targets.append(
        .target(name: name,
                dependencies:  [
                    .product(
                        name: "ClientRuntime",
                        package: "ClientRuntime"
                    ),
                    .product(
                        name: "AWSClientRuntime",
                        package: "AWSClientRuntime"
                    ),
                ],
                path: "\(path)/swift-codegen/\(name)")
    )
    package.products.append(
        .library(name: name, targets: [name])
    )
}

func appendTstTarget(name: String, path: String, dependency: String) {
    var dependencies: [Target.Dependency]  = [.product(name: "SmithyTestUtil", package: "ClientRuntime")]
#if swift(>=5.5)
    dependencies.append(.byNameItem(name: dependency, condition: nil))
#else
    dependencies.append(._byNameItem(name: dependency, condition: nil))
#endif
    package.targets.append(.testTarget(name: name,
                                       dependencies:  dependencies,
                                       path: "\(path)/swift-codegen/\(name)")
    )
}



if let smithySwiftDir = ProcessInfo.processInfo.environment["SMITHY_SWIFT_CI_DIR"],
   let sdkDir = ProcessInfo.processInfo.environment["AWS_SDK_SWIFT_CI_DIR"] {
    package.dependencies += [
        .package(name: "ClientRuntime", path: "\(smithySwiftDir)/Packages"),
        .package(name: "AWSClientRuntime", path: "\(sdkDir)/AWSClientRuntime"),
    ]
} else {
    package.dependencies += [
        .package(name: "ClientRuntime", path: "~/Projects/Amplify/SwiftSDK/smithy-swift/Packages"),
        .package(name: "AWSClientRuntime", path: "~/Projects/Amplify/SwiftSDK/aws-sdk-swift/AWSClientRuntime"),
    ]
}
