#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# perform_test_codegen_on_ci.sh should be run before this script.
#
# Builds the main project plus tests residing in codegen/.
mkdir -p release
swift test
./scripts/mergeModels.sh $AWS_SDK_PROJECT_ROOT/codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson/swift-codegen/AWSRestJsonTestSDK/models
cd codegen && swift test
cd ..
