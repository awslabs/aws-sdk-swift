#!/bin/bash

set -x

# Generates the Package.swift file, configured to work properly when building
# with the CRT builder script (see https://github.com/awslabs/aws-crt-builder).
# For use only as a pre-build step when using the CRT builder script on CI.

# Enables the use of local dependencies, which are required when building with
# the CRT builder script.
export AWS_SWIFT_SDK_USE_LOCAL_DEPS=1

# Regenerate the Package.swift file.
# The env vars AWS_CRT_SWIFT_CI_DIR and SMITHY_SWIFT_CI_DIR must be defined by
# the CI environment, and will be used as the local paths to those dependencies.
swift ./scripts/generatePackageSwift.swift > Package.swift

# Dump the Package.swift to logs for troubleshooting.
cat Package.swift
