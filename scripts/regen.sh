#!/bin/bash

osascript -e 'quit app "Xcode"'
rm -rf release/
./gradlew -p codegen/sdk-codegen build
./gradlew -p codegen/sdk-codegen stageSdks
./scripts/mergeModels.sh release
./scripts/generatePackageSwift.swift > Package.swift
open -a Xcode
