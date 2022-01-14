#!/bin/bash

# Use this script after pulling down a local copy of the AWS Swift SDK to your local machine.
# Doing so will allow you to build (and modify) a local copy of the AWS Swift SDK.
#
# After setting this up, you can update your executable's Package.swift to depend on a local version of the SDK via:
#
#    dependencies: [
#        .package(name: "AWSSwiftSDK", path:"~/Projects/SwiftSDK_Releases/aws-sdk-swift"),
#    ],

#
# Setup Instructions
#  Note: Versions listed below should be updated to your preference (ideally, the latest)
#
# mkdir -p ~/Projects/SwiftSDK_Releases
# cd ~/Projects/SwiftSDK_Releases
#
# git clone git@github.com:awslabs/aws-sdk-swift.git
# cd aws-sdk-swift
# git checkout -b 0.1.1
# cd ..
#
# git clone git@github.com:awslabs/smithy-swift.git
# cd smithy-swift
# git checkout -b 0.1.1
# cd ..
#
# git clone --recurse-submodules git@github.com:awslabs/aws-crt-swift.git
# cd aws-crt-swift
# git checkout -b 0.1.0
# cd ..
#
# ./aws-sdk-swift/scripts/updateReleaseToLocalDev.sh
#
#  If this script runs successfully, you can depend on a local version of the SDK


AWS_SDK_SWIFT=
SMITHY_SWIFT=
AWS_CRT_SWIFT=

determineAbsolutePath() {
    SCRIPTDIR=`dirname $1`
    pushd ${SCRIPTDIR} > /dev/null
    cd ../../
    AWS_SDK_SWIFT=$PWD/aws-sdk-swift
    SMITHY_SWIFT=$PWD/smithy-swift
    AWS_CRT_SWIFT=$PWD/aws-crt-swift
}

determineAbsolutePath $0

if [ -z ${AWS_SDK_SWIFT} ] || [ ! -d ${AWS_SDK_SWIFT} ]; then
    echo "Unable to detect aws-sdk-swift"
    exit 1
fi

if [ -z ${SMITHY_SWIFT} ] || [ ! -d ${SMITHY_SWIFT} ]; then
    echo "Unable to detect smithy-swift"
    exit 1
fi

if [ -z ${AWS_CRT_SWIFT} ] || [ ! -d ${AWS_CRT_SWIFT} ]; then
    echo "Unable to detect aws-crt-swift"
    exit 1
fi

TEMPFILE=`mktemp`
AWS_SDK_SWIFT_PACKAGE=${AWS_SDK_SWIFT}/Package.swift
cat ${AWS_SDK_SWIFT_PACKAGE} |\
    sed -e "s|\(.*\)url:\ \"https://github.com/awslabs/aws-crt-swift.*\"\(.*\)|\1path:\ \"$AWS_CRT_SWIFT\"\2|g" \
	-e "s|\(.*\)url:\ \"https://github.com/awslabs/smithy-swift.*\"\(.*\)|\1path:\ \"$SMITHY_SWIFT\"\2|g" > ${TEMPFILE}
mv ${TEMPFILE} ${AWS_SDK_SWIFT_PACKAGE}
rm -f ${TEMPFILE}
# Package.swift in 'AWSClientRuntime' needs to be removed if users are depending on the top level Package.swift to easily browse code in XCode
rm -f ${AWS_SDK_SWIFT}/AWSClientRuntime/Package.swift
echo "Updated ${AWS_SDK_SWIFT_PACKAGE}"

TEMPFILE=`mktemp`
SMITHY_SWIFT_PACKAGE=${SMITHY_SWIFT}/Package.swift
cat ${SMITHY_SWIFT_PACKAGE} |\
    sed -e "s|\(.*\)url:\ \"https://github.com/awslabs/aws-crt-swift.*\"\(.*\)|\1path:\ \"$AWS_CRT_SWIFT\"\2|g" > ${TEMPFILE}
mv ${TEMPFILE} ${SMITHY_SWIFT_PACKAGE}
rm -f ${TEMPFILE}
# Package.swift in 'Packages' needs to be removed if users are depending on the top level Package.swift to easily browse code in XCode
rm -f ${SMITHY_SWIFT}/Packages/Package.swift
echo "Updated ${SMITHY_SWIFT_PACKAGE}"
