#!/bin/bash

set -x

# Runs protocol tests on this machine.
# May be used on Mac or Linux with Swift and a JDK installed.

# Attempt to clean up common states that affect this repo
swift package unedit smithy-swift || true
swift package unedit aws-crt-swift || true

# Set the branches to use for dependencies.
# Change the specified branches as desired before running.
# Unset these branch env vars to use published versions.
export AWS_SDK_SMITHY_SWIFT_BRANCH_OVERRIDE=main
export AWS_SDK_AWS_CRT_SWIFT_BRANCH_OVERRIDE=main

# Perform the steps needed to complete protocol tests
./scripts/steps/install_dependencies.sh
./scripts/steps/perform_release_codegen.sh
./scripts/steps/post_codegen_cleanup.sh
./scripts/steps/build_and_test_with_swift_cli.sh

