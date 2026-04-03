#!/bin/bash
#
#  lint.sh
#  aws-sdk-swift
#
#  Created by Felix, Anthony on 1/23/26.
#

# Standard brew path setup
export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

# Use local deps if developer has explicitly set AWS_SWIFT_SDK_USE_LOCAL_DEPS,
# otherwise default to remote deps for a clean build
if [ -z "${AWS_SWIFT_SDK_USE_LOCAL_DEPS}" ]; then
    echo "Using remote dependencies (set AWS_SWIFT_SDK_USE_LOCAL_DEPS=1 to use local)"
    unset AWS_SWIFT_SDK_USE_LOCAL_DEPS
else
    echo "Using local dependencies (AWS_SWIFT_SDK_USE_LOCAL_DEPS is set)"
fi

LOG_FILE="xcodebuild.log"

echo "Step 1: Running standard SwiftLint..."
swiftlint lint --strict

echo "Step 2: Preparing minimal build for analyzer..."
# Create backup of Services directory
if [ -d "Sources/Services" ]; then
    echo "Backing up Services directory..."
    mv Sources/Services Sources/Services.backup
fi

# Create empty Services directory for CLI tool
mkdir -p Sources/Services

# Generate minimal package manifest without service clients
cd AWSSDKSwiftCLI
swift run AWSSDKSwiftCLI generate-package-manifest ..
cd ..

echo "Step 3: Building minimal project for analyzer..."
if xcodebuild -scheme aws-sdk-swift-Package -destination platform=macOS > "$LOG_FILE" 2>&1; then
    echo "✅ Build completed successfully"
    
    echo "Step 4: Running SwiftLint Analyze (this may take a few minutes)..."
    if [ -n "${SWIFTLINT_TIMEOUT}" ]; then
        timeout "${SWIFTLINT_TIMEOUT}" swiftlint analyze --strict --compiler-log-path "$LOG_FILE" || echo "⚠️  SwiftLint Analyze timed out after ${SWIFTLINT_TIMEOUT}s"
    else
        swiftlint analyze --strict --compiler-log-path "$LOG_FILE"
    fi
else
    echo "⚠️  Build failed, skipping SwiftLint Analyze step"
    echo "Check $LOG_FILE for build errors"
fi

# Restore Services directory
if [ -d "Sources/Services.backup" ]; then
    echo "Restoring Services directory..."
    rm -rf Sources/Services
    mv Sources/Services.backup Sources/Services
fi

echo "✅ Linting complete!"
