#!/bin/bash

set -e

# Log CPU for hardware in use, if running on Mac

if command -v sysctl &> /dev/null
then
  sysctl -a | grep machdep.cpu
  echo
else
  echo "sysctl not installed (not a Mac)"
fi

# Log location & version for swiftc, xcodebuild, java, xcbeautify

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

if command -v xcbeautify &> /dev/null
then
  which xcbeautify
  xcbeautify --version
  echo
else
  echo "xcbeautify not installed"
fi
