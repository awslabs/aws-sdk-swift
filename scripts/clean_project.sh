#!/bin/bash

# Deletes known build products, caches, and temporary storage from the project.
# Useful for reclaiming storage space or before archiving.
#
# Run this script from the root of the project.

rm -rf .gradle
rm -rf .build
rm -rf build
rm -rf AWSSDKSwiftCLI/.build
rm -rf IntegrationTests/.build
rm -rf codegen/.build
rm -rf codegen/sdk-codegen/build
rm -rf codegen/protocol-test-codegen/build
rm -rf codegen/protocol-test-codegen-local/build
rm -rf codegen/smithy-aws-swift-codegen/build

