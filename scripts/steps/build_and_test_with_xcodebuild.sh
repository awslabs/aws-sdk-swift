#!/bin/bash

set -x

# Builds, then tests the project using the specified destination
# using the Xcode command line tools (xcodebuild).

# Remove any Swift/SPM build artifacts
# (these have been causing conflicts in recent Xcode versions)
rm -rf .build

# Perform the build using the xcodebuild CLI tool.
# Create a temp dir for derived data (this seems to help
# with certain spurious Xcode failures.)
# Pipe the build logs through xcpretty.
# On build failure, fail on Xcode's status code
xcodebuild \
  -scheme AWSSwiftSDK-Package \
  -destination "$AWS_SDK_XCODEBUILD_DESTINATION" \
  -derivedDataPath `mktemp -d`
  build test \
  | xcpretty && exit ${PIPESTATUS[0]}
