#!/bin/bash
# generate docs for all packages in a swift package
usage() {
    echo "Usage:"
    echo "  ./scripts/generatedocc [version] [currentJob] [totalJobs] [ignorelist]" 
    echo ""
    echo "Example:"
    echo " ./scripts/generatedocc 0.7.0 0 16 AWSBatch,AWSIoTAnalytics"
}

generateDocs() {
    package=$1
    VERSION=$2

    # lowercase package name
    package_lowercase=$(echo $package | tr '[:upper:]' '[:lower:]')

    # create output-path
    mkdir -p ./docs/$package_lowercase/$VERSION

    # generate docs for version
    echo "Generating docs for $package $VERSION"
    swift package --allow-writing-to-directory $OUTPUT_DIR \
            generate-documentation --target $package \
            --disable-indexing \
            --transform-for-static-hosting \
            --output-path $OUTPUT_DIR/$package_lowercase-$VERSION.doccarchive \
            --hosting-base-path swift/$package_lowercase/$VERSION

    # break if swift package generate-documentation fails
    if [ $? -ne 0 ]; then
        echo "Failed to generate docs for $package $VERSION"
        exit 1
    else
        echo "Generating docs complete"
    fi

    # sync to AWSS3, adding the new version
    echo "Syncing doccarchive to S3 for $package $VERSION"
    aws s3 sync --quiet $OUTPUT_DIR/$package_lowercase-$VERSION.doccarchive s3://docs-spike/$package_lowercase-$VERSION.doccarchive
    echo "Syncing complete"

    # create output-path
    mkdir -p ./docs/$package_lowercase/latest

    # generate docs for latest
    echo "Generating docs for $package latest..."
    swift package --allow-writing-to-directory $OUTPUT_DIR \
            generate-documentation --target $package \
            --disable-indexing \
            --transform-for-static-hosting \
            --output-path $OUTPUT_DIR/$package_lowercase-latest.doccarchive \
            --hosting-base-path swift/$package_lowercase/latest

    # break if swift package generate-documentation fails
    if [ $? -ne 0 ]; then
        echo "Failed to generate docs for $package latest"
        exit 1
    else
        echo "Generating docs complete"
    fi

    # sync to AWSS3, replacing the previous "latest"
    echo "Syncing doccarchive to S3 for $package latest"
    aws s3 sync --delete --quiet $OUTPUT_DIR/$package_lowercase-latest.doccarchive s3://docs-spike/$package_lowercase-latest.doccarchive

    # break if S3 sync fails
    if [ $? -ne 0 ]; then
        echo "Failed to sync $package latest to S3"
        exit 1
    else
        echo "Syncing complete"
    fi

    # generate invalidation for latest
    echo "Invalidating $package latest..."
    aws cloudfront create-invalidation --distribution-id "$DISTRIBUTION_ID" --paths "/$package_lowercase-latest.doccarchive/*"

    # break if invalidation fails
    if [ $? -ne 0 ]; then
        echo "Failed to invalidate $package latest"
        exit 1
    else
        echo "Invalidation created"
    fi
}

if [ $# -ne 4 ]; then
    usage
    exit 1
fi

VERSION="$1"
CURRENT_JOB="$2"
TOTAL_JOBS="$3"

# convert comma separated list to array
IGNORE=($(echo $4 | tr ',' '\n'))

# setup output directory, ensure it exists & is empty
OUTPUT_DIR=./docs
mkdir -p $OUTPUT_DIR
rm -rf $OUTPUT_DIR/*

echo "Dumping packages"
dump=$(swift package dump-package)

echo "Finding packages"
packages=$(echo $dump |  jq '.products[].name')

# loop through each package with index
current=0
for package in $packages; do
    # skip if not current job
    if [ $((current % TOTAL_JOBS)) -ne $CURRENT_JOB ]; then
        current=$((current + 1))
        continue
    fi

    # remove quotes
    package=$(echo $package | sed 's/"//g')

    # skip if in ignore list
    if [[ " ${IGNORE[@]} " =~ " ${package} " ]]; then
        echo "Skipping $package"
        current=$((current + 1))
        continue
    fi

    generateDocs "$package" "$VERSION"

    current=$((current + 1))
done

# Write the index last
if [ $CURRENT_JOB -eq 0 ]; then
  generateDocs "AWSSDKForSwift" "$VERSION"
fi

