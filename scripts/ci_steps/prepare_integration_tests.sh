#!/bin/bash

set -e

# Code-generate all enabled AWS services
./gradlew -p codegen/sdk-codegen build
./gradlew -p codegen/sdk-codegen stageSdks
./gradlew --stop

# Merge model files
./scripts/mergeModels.sh Sources/Services

# Regenerate the SDK Package.swift to run only integration tests
cd AWSSDKSwiftCLI
swift run AWSSDKSwiftCLI generate-package-manifest --include-integration-tests --exclude-aws-services --exclude-runtime-tests ..
cd ..

# Dump the Package.swift contents to the logs
cat Package.swift

# Run aws-sdk-swift integration tests as a separate step
# (allows for use of either Xcode or pure Swift toolchains)
