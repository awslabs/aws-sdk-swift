#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# install_dependencies_on_ci.sh should be run before this script.

# Perform codegen of test files.
./gradlew -p codegen/smithy-aws-swift-codegen build
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build

# Merge model files
./scripts/mergeModels.sh codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson/swift-codegen/AWSRestJsonTestSDK/models

# Set env var for completion of protocol test codegen
echo "AWS_SDK_PROTOCOL_CODEGEN_TESTS_BUILT=1" >> $GITHUB_ENV

# Regenerate Package.swift
AWS_SDK_PROTOCOL_CODEGEN_TESTS_BUILT=1 swift ./scripts/generatePackageSwift.swift > Package.swift
