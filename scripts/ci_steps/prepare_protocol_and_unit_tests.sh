#!/bin/bash

set -e

# Get rid of the generated services
rm -rf Sources/Services/*

# Regenerate the SDK manifest, with only runtime included
cd AWSSDKSwiftCLI
set +e
swift run AWSSDKSwiftCLI generate-package-manifest ..
cli_status=$?
set -e
if [ $cli_status -ne 0 ]; then
  ../scripts/ci_steps/diagnose_cli_failure.sh $cli_status
  exit $cli_status
fi
cd ..

# Dump the Package.swift contents to the logs
cat Package.swift

# Code-generate protocol tests
./gradlew -p codegen/smithy-aws-swift-codegen build
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build
./gradlew --stop

# Free the Kotlin compile daemon's heap; --stop above only stops Gradle's daemon
pkill -f KotlinCompileDaemon || true

# Run aws-sdk-swift protocol and unit tests as a separate step
# (allows for use of either Xcode or pure Swift toolchains)
