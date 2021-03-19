#!/bin/bash
mkdir -p ~/sdkBuildOutput
cd ../codegen/sdk-codegen/build/smithyprojections/sdk-codegen
for dir in `ls |grep -v "source"`; do
    pushd $dir/swift-codegen/
    swift build > ~/sdkBuildOutput/$dir.txt
    pwd
    popd
done