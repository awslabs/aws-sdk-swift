#!/bin/bash

set -x

# Builds the project as "pure Swift" (i.e. with no destination platform)
# and runs tests using Swift command-line tools.

# Build the Swift project and its tests.
swift build --build-tests

# Run Swift tests on the build that was just completed.
swift test --skip-build
