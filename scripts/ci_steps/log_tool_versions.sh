#!/bin/bash

set -e

# Log location & version for swiftc, xcodebuild, java

which swiftc
swiftc --version
echo

if command -v xcodebuild &> /dev/null
then
  which xcodebuild
  xcodebuild -version
  echo
else
  echo "xcodebuild not installed"
fi

which java
java --version
