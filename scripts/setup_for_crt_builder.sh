#!/bin/bash

set -x

# Generates the Package.swift file, configured to work properly when building
# with the CRT builder script (see https://github.com/awslabs/aws-crt-builder).
# For use only as a pre-build step when using the CRT builder script on CI.

# Ensure that the release/ directory is present.
mkdir -p release

# Regenerate the Package.swift file.
# The env vars AWS_CRT_SWIFT_CI_DIR and SMITHY_SWIFT_CI_DIR must be defined by
# the CI environment, and will be used as the local paths to those dependencies.
swift ./scripts/generatePackageSwift.swift > Package.swift

# Dump the Package.swift to logs for troubleshooting.
cat Package.swift
