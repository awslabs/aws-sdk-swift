#!/bin/bash
# generate docs for all packages in a swift package
usage() {
    echo "Usage:"
    echo "  ./scripts/generatedocc [version] [mod]" 
    echo ""
    echo "Example:"
    echo " ./scripts/generatedocc 0.7.0 3"
}

if [ $# -ne 2 ]; then
    usage
    exit 1
fi

VERSION="$1"
MOD="$2"

# setup directory
mkdir -p ./docs/$VERSION

echo "Dumping packages"
dump=$(swift package dump-package)

echo "Finding packages"
packages=$(echo $dump |  jq '.products[].name')

# loop through each package with index
current=0
for package in $packages; do
    # skip if not in mod
    if [ $((current % MOD)) -ne 0 ]; then
        current=$((current + 1))
        continue
    fi
    # remove quotes
    package=$(echo $package | sed 's/"//g')
    # generate docs
    echo "Generating docs for $package"
    swift package --allow-writing-to-directory ./docs \
            generate-documentation --target $package \
            --disable-indexing \
            --transform-for-static-hosting \
            --hosting-base-path $VERSION/$package \
            --output-path ./docs/$VERSION/$package
    current=$((current + 1))
done