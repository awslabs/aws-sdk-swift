#!/bin/bash

set -x

# Code-generates the project, stages files in release position,
# generates a new Package.swift
# install_dependencies_on_ci.sh should be run before this script.

# Clear the contents of the release folder so it can be rebuilt clean
rm -rf release/*

# Build the SDK components
./gradlew -p codegen/sdk-codegen build

# Move SDK components into place
./gradlew -p codegen/sdk-codegen stageSdks

# Merge models into single model files
./scripts/mergeModels.sh release

# Regenerate the manifest with the models just built
swift scripts/generatePackageSwift.swift > Package.swift

# Dump the manifest to the logs
cat Package.swift
