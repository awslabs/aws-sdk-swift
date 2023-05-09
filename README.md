# AWS SDK for Swift

The **AWS SDK for Swift** is a pure Swift SDK for accessing any & all AWS services.

**The AWS SDK for Swift is currently in developer preview and is intended strictly for feedback purposes only. Do not use this SDK for production workloads. Refer to the SDK [stability guidelines](docs/stability.md) for more detail.**

## License

This library is licensed under the Apache 2.0 License. 

[![License][apache-badge]][apache-url]

[apache-badge]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[apache-url]: LICENSE

## Requirements

The AWS SDK for Swift supports the following:
- Swift 5.5 or higher
- iOS 13.0 or higher
- macOS 10.15 or higher
- Ubuntu Linux 16.04 LTS or higher
- Amazon Linux 2 or higher

Other environments (watchOS, tvOS, Windows, or others) may work but have not been verified.

These supported versions may change in the future.

## SDK Quick Start

Here are steps to quickly get the AWS SDK for Swift installed into either an existing Xcode project or an existing
Swift package.

### Installing the AWS SDK for Swift into your Xcode Project

1. Open your project in the Xcode IDE.  From the drop down menu, select File > Add Packages...

2. In the field labeled "Search or Enter Package URL", enter "https://github.com/awslabs/aws-sdk-swift".  Set the
dependency rule and project as needed, then click "Add Package". The package will download and install to your Xcode
project.

3. In the "Choose Package Products for aws-sdk-swift" popup window, check the box next to the specific AWS services you
want to access, and set the Xcode target next to each.  Click "Add Package".

4. Proceed to Provide Credentials below.

### Installing the AWS SDK for Swift into your Swift Package

1. In your package's `Package.swift`, add AWS SDK for Swift as a dependency:
```
let package = Package(
    name: "MyPackage",
    dependencies: [
+       .package(url: "https://github.com/awslabs/aws-sdk-swift.git", from: "0.16.0")
    ],
```

2. Add the specific AWS services you want to use to one of the targets in your package's `Package.swift`:
```
    targets: [
        .target(
            name: "MyTarget", 
            dependencies: [
+               .product(name: "AWSS3", package: "aws-sdk-swift"),
+               .product(name: "AWSSTS", package: "aws-sdk-swift"),
+               .product(name: "AWSTranscribe", package: "aws-sdk-swift")
            ]
        )
    ]
```
See the AWS SDK for Swift's [`Package.swift`](Package.swift) file for the names of all available AWS services.

3. Proceed to the next section. 

## Provide Credentials

For virtually all AWS operations, you must provide AWS security credentials for the SDK to use.

You can accomplish this for local development by installing and configuring the
[AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
on your development machine.  The AWS SDK for Swift will share the AWS CLI's credentials (written at
`~/.aws/credentials`) when executing on your development machine.

See your AWS account administrator to obtain your credentials if you do not already have them.

## Code
*Steps*

AWS SDKs are available under `/Sources` in a tagged branch.

We will walk you through how you can use `CognitoIdentity`  as dependency for example in the steps below.  To use it, we will create a test project called TestSdk.

```bash
mkdir TestSdk
cd TestSdk
swift package init --type executable
xed .
```

Once Xcode is open, open Package.swift.  Update the file to mirror the following.  Notice the three following changes:

* Platforms is set to `[.macOS(.v10_15), .iOS(.v13)]`,
* dependencies: - has a .package which references the `AWSCognitoIdentity` package
* the first target “TestSDK” has a dependency listed as `AWSCognitoIdentity`

```swift
// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestSdk",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-sdk-swift", from: "0.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TestSdk",
            dependencies: [.product(name: "AWSCognitoIdentity", package: "aws-sdk-swift")]),
        .testTarget(
            name: "TestSdkTests",
            dependencies: ["TestSdk"]),
    ]
)
```

Then you can open up main.swift, and instantiate CognitoIdentity as follows:

```swift
import AWSCognitoIdentity

func createIdentityPool() async throws -> CreateIdentityPoolOutputResponse {
    let cognitoIdentityClient = try CognitoIdentityClient(region: "us-east-1")
    let cognitoInputCall = CreateIdentityPoolInput(developerProviderName: "com.amazonaws.mytestapplication",
                                                    identityPoolName: "identityPoolMadeWithSwiftSDK")
    
    let result = try await cognitoIdentityClient.createIdentityPool(input: cognitoInputCall)
    return result
}
```

As a result, you should be able to:

1. Log into your [AWS console](https://console.aws.amazon.com/).
2. Use the region switcher at the top-right corner of the screen to select the region "US-East (N. Virginia)", also known as `us-east-1`. This is the default region, though you can specify another region in your code if you wish.
3. In the Services popup, click on [Cognito](https://console.aws.amazon.com/cognito) (found under the heading "Security, Identity, & Compliance").
4. Click the "Manage Identity Pools" button on the "Amazon Cognito" page.
5. Verify that you see the newly created identity pool name: `identityPoolMadeWithSwiftSDK`.

If you’ve made it this far... congratulations! 🎉

*What’s next?*
Try some other calls?  Help us better understand what you think the most critical features are next.  Run into any bugs? Give us feedback on the call-site interface. etc...

## API Reference documentation
We recommend to use the documentation generation capabilities within Xcode (Option+Click on a symbol).  Generated online
documentation will be provided soon.
