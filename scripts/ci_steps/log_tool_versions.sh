#!/bin/bash

set -e

# Log location & version for swiftc, xcodebuild, java

if command -v swiftc &> /dev/null
then
  which swiftc
  swiftc --version
  echo
else
  echo "swiftc not installed"
fi

if command -v xcodebuild &> /dev/null
then
  which xcodebuild
  xcodebuild -version
  echo
else
  echo "xcodebuild not installed"
fi

if command -v java &> /dev/null
then
  which java
  java --version
  echo
else
  echo "java not installed"
fi

