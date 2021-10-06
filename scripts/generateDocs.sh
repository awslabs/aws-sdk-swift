#!/bin/bash
usage() {
    echo "Usage:"
    echo "  ./scripts/generateDocs [releaseDir] [outputDirPrefix]" 
    echo ""
    echo "Example:"
    echo " ./scripts/generateDocs release reference/0.x"
}

if [ $# -ne 2 ]; then
    usage
    exit 1
fi

RELDIR=$1
if [ ! -d ${RELDIR} ]; then
    echo "Not a directory: ${RELDIR}"
    exit 1
fi

OUTDIR_PREFIX="$2"


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
    OUTDIR="${OUTDIR_PREFIX}/${sdk}"
    echo "Generating ${sdk}: ${OUTDIR}"
    swift doc generate ${RELDIR}/${sdk} --module-name ${sdk} --format html --base-url "/aws-sdk-swift/${OUTDIR}" --output ${OUTDIR}
    if [ $? -ne 0 ]; then
	echo "Failed on ${sdk}"
	exit 1
    fi
done
