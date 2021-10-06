#!/bin/bash
usage() {
    echo "Use case 1:"
    echo " ./scripts/generateDocs release"
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

RELDIR=$1
if [ ! -d ${RELDIR} ]; then
    echo "Not a directory: ${RELDIR}"
    exit 1
fi


HAS_SWIFTDOC=`which swift-doc`
if [ $? -ne 0 ]; then
    echo "Fatal: Unable to find swift doc"
    exit 1
fi

if [ -d reference ]; then
    echo "Error: Reference direcotry already exists"
    exit 1
fi


#After testing, update the line to generate for all SDKs
#for sdk in `ls ${RELDIR} | grep -e "^AWS"`; do
for sdk in `ls ${RELDIR} |grep -e "Polly\|APIGateway"`; do
    echo "Generating ${sdk}"
    swift doc generate release/${sdk} --module-name ${sdk} --format html --base-url "/aws-sdk-swift/reference/${sdk}" --output reference/${sdk}
    if [ $? -ne 0 ]; then
	echo "Failed on ${sdk}"
	exit 1
    fi
done
