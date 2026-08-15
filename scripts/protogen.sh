#!/bin/bash

# Stop on any failed step of this script
set -eo pipefail

# This script may be used to regenerate protocol tests during development.
# May be used on Mac or Linux.
# Run this script from the SDK project's root dir.

# Delete the build products from any previous run of protocol tests.
rm -rf codegen/protocol-test-codegen/build
rm -rf codegen/protocol-test-codegen-local/build

# Regenerate protocol tests
./gradlew -p codegen/protocol-test-codegen build
./gradlew -p codegen/protocol-test-codegen-local build

# Delete the generated Package.swift for protocol test packages so they may be seen in Xcode
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/AWSRestJsonTestSDK/swift-codegen/AWSRestJsonTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/AWSRestJsonValidationTestSDK/swift-codegen/AWSRestJsonValidationTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/AWSJson10TestSDK/swift-codegen/AWSJson10TestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/AWSJson11TestSDK/swift-codegen/AWSJson11TestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/RestXmlTestSDK/swift-codegen/RestXmlTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/RestXmlWithNamespaceTestSDK/swift-codegen/RestXmlWithNamespaceTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/Ec2QueryTestSDK/swift-codegen/Ec2QueryTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/AWSQueryTestSDK/swift-codegen/AWSQueryTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/APIGatewayTestSDK/swift-codegen/APIGatewayTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/GlacierTestSDK/swift-codegen/GlacierTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/MachineLearningTestSDK/swift-codegen/MachineLearningTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/S3TestSDK/swift-codegen/S3TestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/RPCV2CBORTestSDK/swift-codegen/RPCV2CBORTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/RPCV2CBORTestNonQueryCompatSDK/swift-codegen/RPCV2CBORTestNonQueryCompatSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/RPCV2CBORTestQueryCompatSDK/swift-codegen/RPCV2CBORTestQueryCompatSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/AWSJson10TestQueryCompatSDK/swift-codegen/AWSJson10TestQueryCompatSDK/Package.swift

# Now do the same for local protocol tests
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/RestJsonExtras/swift-codegen/RestJsonExtras/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/AwsQueryExtras/swift-codegen/AwsQueryExtras/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/EventStream/swift-codegen/EventStream/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/RPCEventStream/swift-codegen/RPCEventStream/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/StringArrayEndpointParam/swift-codegen/StringArrayEndpointParam/Package.swift

