#!/bin/bash
# generate docs for all packages in a swift package
usage() {
    echo "Usage:"
    echo "  ./scripts/generatedocc [version]" 
    echo ""
    echo "Example:"
    echo " ./scripts/generatedocc 0.7.0"
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

VERSION="$1"

# setup directory
mkdir -p ./docs/$VERSION

# dump all packages to a variable
dump=$(swift package dump-package)

packages=$(echo $dump |  jq '.products[].name')

# loop through each package
for package in $packages; do
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
done