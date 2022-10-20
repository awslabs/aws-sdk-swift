#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# install_dependencies_on_ci.sh should be run before this script.
#
# Sets smithy-swift and aws-crt-swift to the same branchname as the
# aws-sdk-swift branch, if those repos have a branch with that name

# First, switch the smithy-swift working copy, if needed
cd Packages/smithy-swift
git checkout $AWS_SDK_REF_TO_BUILD || true
cd ../..

# Next, switch the aws-crt-swift working copy, if needed
cd Packages/aws-crt-swift
git checkout $AWS_SDK_REF_TO_BUILD || true

# Because aws-crt-swift has submodules, deinit then update them
# recursively after switching branches
git submodule deinit
git submodule init
git submodule update --recursive

cd ../..
