#!/bin/bash

set -e

# Regenerate the SDK Package.swift to run only protocol tests and runtime unit tests
cd AWSSDKSwiftCLI
swift run AWSSDKSwiftCLI generate-package-manifest --include-protocol-tests --exclude-aws-services ..
cd ..

# Dump the Package.swift contents to the logs
cat Package.swift

# Code-generate protocol tests
./gradlew -p codegen/smithy-aws-swift-codegen build
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build
./gradlew --stop
./scripts/mergeModels.sh codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson/swift-codegen/AWSRestJsonTestSDK/models

# Run aws-sdk-swift protocol and unit tests as a separate step
# (allows for use of either Xcode or pure Swift toolchains)
