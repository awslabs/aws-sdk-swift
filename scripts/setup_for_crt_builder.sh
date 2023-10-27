#!/bin/bash

set -x

# Generates the Package.swift file, configured to work properly when building
# with the CRT builder script (see https://github.com/awslabs/aws-crt-builder).
# For use only as a pre-build step when using the CRT builder script on CI.

# Symlink the SMITHY_SWIFT_CI_DIR to be in the same directory as this project's
# home directory.
ln -s $SMITHY_SWIFT_CI_DIR ../smithy-swift

# Regenerate the Package.swift file.
cd AWSSDKSwiftCLI
swift run AWSSDKSwiftCLI generate-package-manifest ../
cd ..

# Dump the Package.swift to logs for troubleshooting.
cat Package.swift
