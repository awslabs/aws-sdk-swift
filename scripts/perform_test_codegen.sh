#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# install_dependencies_on_ci.sh should be run before this script.
#
# Performs codegen needed to run tests.
./gradlew -p codegen/smithy-aws-swift-codegen build
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build
