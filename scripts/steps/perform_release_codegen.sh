#!/bin/bash

set -x

# Code-generates the project, stages files in release position,
# generates a new Package.swift
# install_dependencies_on_ci.sh should be run before this script.

rm -rf release/*
./gradlew -p codegen/sdk-codegen build
./gradlew -p codegen/sdk-codegen stageSdks
./scripts/mergeModels.sh release
cat Package.swift
