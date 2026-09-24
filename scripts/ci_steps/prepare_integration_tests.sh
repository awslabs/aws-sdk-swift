#!/bin/bash

set -e

# Only enable codegen for integration test services
cp scripts/integration-test-sdk.properties sdk.properties

# Delete all staged, generated code
rm -rf Sources/Services/*

# Code-generate all enabled AWS services
./gradlew -p codegen/sdk-codegen build
./gradlew -p codegen/sdk-codegen stageSdks
./gradlew --stop

# Regenerate the SDK Package.swift to run only integration tests
./scripts/ci_steps/run_cli.sh generate-package-manifest --exclude-runtime-tests .

# Dump the Package.swift contents to the logs
cat Package.swift

# Run aws-sdk-swift integration tests as a separate step
# (allows for use of either Xcode or pure Swift toolchains)
