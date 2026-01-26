//
//  lint.sh
//  aws-sdk-swift
//
//  Created by Felix, Anthony on 1/23/26.
//
#!/bin/bash

# Ensure local Homebrew path is included for Apple Silicon and Intel Macs
export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

# Check if SwiftLint is installed
if ! command -v swiftlint > /dev/null; then
    echo "Error: SwiftLint not found. Install it using 'brew install swiftlint'."
    exit 1
fi

echo "Running SwiftLint..."

SCRIPT_DIR="$(dirname "$0")"
CONFIG_PATH="$SCRIPT_DIR/../.swiftlint.yml"

swiftlint lint --config "$CONFIG_PATH" --strict
