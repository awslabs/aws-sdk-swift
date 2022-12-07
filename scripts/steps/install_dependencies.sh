#!/bin/bash

set -x

# Generates a new package manifest and resolves dependencies.
# When run on CI, set_references.sh should be run before this script.

# Ensure release/ is present
mkdir -p release

# Generate Package.swift with branches set, if needed.
# Unset the path vars used for CRT CI so they don't get used here
unset AWS_CRT_SWIFT_CI_DIR
unset SMITHY_SWIFT_CI_DIR
swift ./scripts/generatePackageSwift.swift > Package.swift

# Dump the manifest to the console
cat Package.swift

# Install Swift packages
swift package resolve

# Place smithy-swift into edit mode so it is linked to Packages/
swift package edit smithy-swift

# Write a local.properties file so Kotlin can resolve the location of smithy-swift
echo "compositeProjects=`pwd`/Packages/smithy-swift" >> local.properties
