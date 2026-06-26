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
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson/swift-codegen/AWSRestJsonTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-restjson-validation/swift-codegen/AWSRestJsonValidationTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-json-10/swift-codegen/AWSJson1_0TestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-json-11/swift-codegen/AWSJson1_1TestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/rest-xml/swift-codegen/RestXmlTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/rest-xml-xmlns/swift-codegen/RestXmlWithNamespaceTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/ec2-query/swift-codegen/Ec2QueryTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-query/swift-codegen/AWSQueryTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/apigateway/swift-codegen/APIGatewayTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/glacier/swift-codegen/GlacierTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/machinelearning/swift-codegen/MachineLearningTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/s3/swift-codegen/S3TestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/smithy-rpcv2-cbor/swift-codegen/RPCV2CBORTestSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/smithy-rpcv2-cbor-non-query-compat/swift-codegen/RPCV2CBORTestNonQueryCompatSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/smithy-rpcv2-cbor-query-compat/swift-codegen/RPCV2CBORTestQueryCompatSDK/Package.swift
rm -f codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen/aws-json-10-query-compat/swift-codegen/AWSJson1_0TestQueryCompatSDK/Package.swift

# Now do the same for local protocol tests
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/rest_json_extras/swift-codegen/rest_json_extras/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/AwsQueryExtras/swift-codegen/AwsQueryExtras/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/EventStream/swift-codegen/EventStream/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/RPCEventStream/swift-codegen/RPCEventStream/Package.swift
rm -f codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local/StringArrayEndpointParam/swift-codegen/StringArrayEndpointParam/Package.swift

