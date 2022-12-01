#!/bin/bash

osascript -e 'quit app "Xcode"'
rm -rf codegen/protocol-test-codegen/build
rm -rf codegen/protocol-test-codegen-local/build
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build
rm codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/Waiters/swift-codegen/Package.swift
open -a Xcode
