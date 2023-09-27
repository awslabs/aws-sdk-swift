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
- Swift 5.7 or higher
- iOS & iPadOS 13.0 or higher
- macOS 10.15 or higher
- Ubuntu Linux 16.04 LTS or higher
- Amazon Linux 2 or higher

Other environments (watchOS, tvOS, Windows, or others) may work but have not been verified.

These supported versions may change in the future.

## Provide Credentials

For virtually all AWS operations, you must provide AWS security credentials for the SDK to use.

You can accomplish this for local development by installing and configuring the
[AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
on your development machine.  The AWS SDK for Swift will share the AWS CLI's credentials (written at
`~/.aws/credentials`) when executing on your development machine.

See your AWS account administrator to obtain your credentials if you do not already have them.

## Test the AWS SDK for Swift with your credentials

Here, we'll be creating a simple Swift package to show you how the SDK is used, and verify that the SDK can use your
credentials to access a live AWS service.

You can perform this on either Mac or Linux on any supported OS version, but must have a supported version of either
Xcode (for Mac) or the Swift toolchain (for Linux) installed.

Be sure you've set up AWS credentials on your development machine, per the section above.

1. On your command line, create a new, executable Swift package:
```
$ mkdir AWSCredentialTester
$ cd AWSCredentialTester
$ swift package init --type executable
```

2. Edit your new package's `Package.swift` file to read:
```
// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AWSCredentialTester",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-sdk-swift.git", from: "0.16.0")
    ],
    targets: [
        .executableTarget(
            name: "AWSCredentialTester",
            dependencies: [
                .product(name: "AWSSTS", package: "aws-sdk-swift")
            ],
            path: "Sources"
        )
    ]
)
```

3. Edit your project's `Sources/main.swift` file to read:
```
import AWSSTS

let client = try STSClient(region: "us-east-1")
let input = GetCallerIdentityInput()
let output = try await client.getCallerIdentity(input: input)
let userID = output.userId ?? "not known"
print("Caller's AWS user ID is \(userID)")
```

4. Execute your Swift package from the command line:
```
$ swift run
```
Your package will resolve dependencies, compile, and run.

In the terminal output, you will see (after a number of log statements):
```
Caller's AWS user ID is <an alphanumeric string>
```
(this user ID should match your AWS Access Key ID for your AWS credentials.)

If you’ve made it this far... congratulations! 🎉

## Integrating Into an Existing Xcode Project or Package

Now that you've tested the SDK and your credentials in a simple project, here are steps to quickly get the AWS SDK for
Swift installed into either your existing Xcode project or Swift package.

### Installing the AWS SDK for Swift into your Xcode Project

1. Open your project in the Xcode IDE.  From the drop down menu, select File > Add Packages...

2. In the field labeled "Search or Enter Package URL", enter "https://github.com/awslabs/aws-sdk-swift".  Set the
dependency rule and project as needed, then click "Add Package". The package will download and install to your Xcode
project.

3. In the "Choose Package Products for aws-sdk-swift" popup window, check the box next to the specific AWS services you
want to access, and set the Xcode target next to each service.  Click "Add Package".

### Installing the AWS SDK for Swift into your Swift Package

1. In your package's `Package.swift`, add AWS SDK for Swift as a package dependency:
```
let package = Package(
    name: "MyPackage",
    dependencies: [
+       .package(url: "https://github.com/awslabs/aws-sdk-swift", from: "0.16.0")
    ],
```

2. Add the specific AWS services you plan to use into the `dependencies` of one of the targets in your package's
`Package.swift`.  To finish this example, you will need to add at least `AWS Secure Token Service (STS)` :
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

*What’s next?*
Try some other AWS services.  Help us better understand what you think the most critical features are next.  Give us
feedback on your experience. etc...

*Run into a bug?*
Please file a Github issue on this project.  We try to respond within a business day. 

## API Reference documentation
We recommend that you use the documentation generation capabilities within Xcode (Option+Click on a symbol); if you run
across an API that is not documented, please file an issue in this project.

Generated online documentation will be provided soon.
