#!/bin/bash

# Stop on any failed step of this script
set -eo pipefail

# Regenerates the SDK.  For use during development only.
# Arguments passed into this script are passed on to the manifest generator.

# May be used on Mac or Linux.
# When run on Mac, kills Xcode before codegen & restarts it after.

# Run this script from the SDK project root directory.

# Delete all previous Smithy build products
rm -rf codegen/sdk-codegen/build/smithyprojections/sdk-codegen/*

# Regenerate code
./gradlew -p codegen/sdk-codegen build

# Move generated Swift code into place in the Sources/ dir
./gradlew -p codegen/sdk-codegen stageSdks

# Regenerate the package manifest and doc index, with args passed into this script
cd AWSSDKSwiftCLI
unset AWS_SWIFT_SDK_USE_LOCAL_DEPS
swift run AWSSDKSwiftCLI generate-package-manifest "$@" ..
swift run AWSSDKSwiftCLI generate-smoke-tests-package-manifest ..
swift run AWSSDKSwiftCLI generate-doc-index ..
swift run AWSSDKSwiftCLI generate-partitions ..
# Updating package version not needed for development, and clutters PR diffs
# Uncomment for development if testing versioning
# swift run AWSSDKSwiftCLI generate-package-version ..
cd ..
