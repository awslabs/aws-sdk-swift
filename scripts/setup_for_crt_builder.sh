#!/bin/bash

set -x

# Generates the Package.swift file
# For use only as a pre-build step when using the CRT builder script on CI.

# Find the location of this script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# cd to the root of the aws-sdk-swift project (this file will be in the
# scripts/ subdirectory.)
cd "$SCRIPT_DIR" && cd ..

# Regenerate the Package.swift file.
# The env vars AWS_CRT_SWIFT_CI_DIR and SMITHY_SWIFT_CI_DIR will be
# used as the paths to those dependencies.
swift ./scripts/generatePackageSwift.swift > Package.swift

# Dump the Package.swift to logs for troubleshooting.
cat Package.swift
