#!/bin/bash
# generate index page for all packages in a swift package
usage() {
    echo "Usage:"
    echo "  ./scripts/generatedoccindex [version] [datafilepath] [ignorelist]" 
    echo ""
    echo "Example:"
    echo " ./scripts/generatedoccindex 0.7.0 docs/0.7.0/awssdkswift/data/documentation/awssdkswift.json AWSBatch,AWSIoTAnalytics"
}

if [ $# -ne 3 ]; then
    usage
    exit 1
fi

VERSION="$1"
DATAFILE="$2"
# convert comma separated list to array
IGNORE=($(echo $3 | tr ',' '\n'))

echo "Dumping packages"
dump=$(swift package dump-package)

echo "Finding packages"
packages=$(echo $dump |  jq '.products[].name')

# comma separated list of identifiers
# eg. "doc:\/\/AWSSNS\/documentation\/AWSSNS","doc:\/\/AWSSQS\/documentation\/AWSSQS"
identifiers=""

# comma separated list of references
# "doc://AWSSNS/documentation/AWSSNS/SNSClient": {
#     "title": "AWSSNS",
#     "url": "\/..\/awssns\/documentation\/awssns"
# },
# "doc://AWSSQS/documentation/AWSSQS/SQSClient": {
#     "title": "AWSSQS",
#     "url": "\/..\/awssqs\/documentation\/awssqs"
# }
references=""

for package in $packages; do
    # remove quotes
    package=$(echo $package | sed 's/"//g')

    # skip if in ignore list
    if [[ " ${IGNORE[@]} " =~ " ${package} " ]]; then
        echo "Skipping $package"
        continue
    fi

    # lowercase package name
    package_lowercase=$(echo $package | tr '[:upper:]' '[:lower:]')

    # identifier ex. "doc:\/\/awssns\/documentation\/awssns"
    identifier="doc:\/\/$package_lowercase\/documentation\/$package_lowercase"
    identifiers="$identifiers\"$identifier\","

    # url eg. "\/..\/awssns\/documentation\/awssns"
    url="\/..\/$package_lowercase\/documentation\/$package_lowercase"
    references="$references\"$identifier\": {
        \"title\": \"$package\",
        \"url\": \"$url\"
    },"
done

# remove trailing comma
identifiers=$(echo $identifiers | sed 's/,$//')

# remove trailing comma
references=$(echo $references | sed 's/,$//')

# replace variables in template
echo "Replacing IDENTIFIERS in template"
sed -i '' "s/IDENTIFIERS/$identifiers/g" $DATAFILE
echo "Replacing REFERENCES in template"
sed -i '' "s/REFERENCES/$references/g" $DATAFILE