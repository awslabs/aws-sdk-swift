#!/bin/bash

set -e

# Delete all generated services & their tests
rm -rf Sources/Services/*
rm -rf Tests/Services/*

# Regenerate the SDK Package.swift without the services
cd AWSSDKSwiftCLI
swift run AWSSDKSwiftCLI generate-package-manifest --include-protocol-tests ..
cd ..

# Dump the Package.swift contents to the logs
cat Package.swift

# Code-generate protocol tests
./gradlew -p codegen/smithy-aws-swift-codegen build
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build
./gradlew --stop
./scripts/mergeModels.sh codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson/swift-codegen/AWSRestJsonTestSDK/models

# Run aws-sdk-swift protocol and unit tests
swift test
