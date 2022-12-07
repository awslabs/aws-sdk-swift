#!/bin/bash

set -x

# Stops unneeded services after codegen.
# To be run after perform_test_codegen.sh or perform_release_codegen.sh
# complete.

# Stop the Gradle daemon to free up CPU & RAM for Swift compile.
./gradlew --stop

# Remove smithy from edit mode, since the link in Packages/
# is no longer needed.
swift package unedit smithy-swift

