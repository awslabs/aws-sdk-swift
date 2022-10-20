#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# Sets up the project to be ready for Swift build/test and codegen.

# Install Swift packages
swift package resolve

# Place smithy-swift and aws-crt-swift in edit mode, so that they can be
# easily linked and branch may be switched during CI operations.
swift package edit smithy-swift
swift package edit aws-crt-swift

# Write a local.properties file to point Kotlin to the local copy of smithy-swift.
echo "compositeProjects=$AWS_SDK_PROJECT_ROOT/Packages/smithy-swift" > local.properties
