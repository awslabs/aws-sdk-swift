#!/bin/bash

# This script may be used to regenerate protocol tests during development.
# Run this script from the SDK project's root dir.

# Quit Xcode since it tends to get hung up when files are being changed for a local project.
osascript -e 'quit app "Xcode"'

# Delete the build products from any previous run of protocol tests.
rm -rf codegen/protocol-test-codegen/build
rm -rf codegen/protocol-test-codegen-local/build

# Regenerate protocol tests
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build

# Delete the generated Package.swift for protocol test packages so they may be seen in Xcode
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-json-10/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-json-11/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/rest-xml/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/rest-xml-xmlns/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/ec2-query/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-query/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/apigateway/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/glacier/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/machinelearning/swift-codegen/Package.swift
rm codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/s3/swift-codegen/Package.swift

# Now do the same for local protocol tests
rm codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/aws-restjson/swift-codegen/Package.swift
rm codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/rest_json_extras/swift-codegen/Package.swift
rm codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/Waiters/swift-codegen/Package.swift

# Work's done, reopen Xcode to the refreshed tests
open -a Xcode
