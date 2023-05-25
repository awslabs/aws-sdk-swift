#!/bin/bash

set -e

# Log location & version for swiftc, xcodebuild, java
which swiftc
swiftc --version
echo
which xcodebuild
xcodebuild -version
echo
which java
java --version
