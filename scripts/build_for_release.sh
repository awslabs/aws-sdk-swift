#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# install_dependencies_on_ci.sh should be run before this script.

# Code-generates the project, stages files in release position,
# generates a new Package.swift

rm -rf release/
./gradlew -p codegen/sdk-codegen build
./gradlew -p codegen/sdk-codegen stageSdks
./scripts/mergeModels.sh release
cat Package.swift

