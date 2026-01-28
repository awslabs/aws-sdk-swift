//
//  lint.sh
//  aws-sdk-swift
//
//  Created by Felix, Anthony on 1/23/26.
//
#!/bin/bash

# Standard brew path setup
export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

LOG_FILE="spm_build.log"

echo "Step 1: Generating verbose build log via SPM..."
swift build --clean
swift build -v > "$LOG_FILE"

echo "Step 2: Running SwiftLint Analyze..."
swiftlint analyze --compiler-log-path "$LOG_FILE"

echo "Step 3: Running standard SwiftLint..."
swiftlint lint --strict
