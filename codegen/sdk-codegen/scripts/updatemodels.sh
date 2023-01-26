#!/bin/bash

programname=$0
usage() {
    echo ""
    echo "Updates AWS smithy models in the aws-sdk-swift repo"
    echo ""
    echo "usage: $programname --aws_models {path to aws-models repo}"
    echo ""
    echo "  --aws-models    string?     Path to the aws-models repo"
    echo "                              (example: /Users/{username}/Developer/repos/aws-models) or ../aws-models"
    echo ""
}

# Parse command line arguments
while [ $# -gt 0 ]; do
    if [[ $1 == "--help" ]]; then
        usage
        exit 0
    elif [[ $1 == "--"* ]]; then
        v="${1/--/}"
        declare "$v"="$2"
        shift
    fi
    shift
done

BASEDIR=$(dirname "$0")
AWS_MODELS_DIR="${BASEDIR}/../aws-models"

fetchGitHubRepo() {
    mkdir -p ${aws_models}
    pushd ${aws_models}
    git clone git@github.com:aws/aws-models.git --depth 1
    #git clone https://github.com/aws/aws-models.git
    popd
}

TEMPDIR=`mktemp -d`
if [[ -z $aws_models ]]; then
    echo "aws_models is not set, using temporary directory to clone models"
    aws_models=${TEMPDIR}/aws-models
    fetchGitHubRepo
else
    # if relative path, make absolute
    if [[ $aws_models != /* ]]; then
        aws_models="${PWD}/${aws_models}"
    fi
fi

cleanup() {
    echo "Cleaning up temporary directory ${TEMPDIR}"
    rm -Rf ${TEMPDIR}
}

JSON_MODEL_FILES=`find ${aws_models} |grep -e "smithy\/model\.json$"`

for model in ${JSON_MODEL_FILES}; do
    SDKID=`cat ${model} |grep \"sdkId\": | sed 's/.*: \(.*\)/\1/g' | tr -d "\"" | tr -d "," | tr '[:upper:]' '[:lower:]' | tr " " "-"`
    NUM_VERSIONS=`cat "${model}" | grep -e "\"version\": \"[0-9]*-[0-9]*-[0-9]*\"" |wc -l |awk '{print $1}'`
    if [ ${NUM_VERSIONS} -ne 1 ]; then
	echo "FAIL: ${model} does not have 1: ${NUM_VERSIONS}"
	cleanup
	exit 1
    fi
    VERSION=`cat "${model}" | grep -e "\"version\": \"[0-9]*-[0-9]*-[0-9]*\"" |awk '{print $2}' | tr -d "\"" |tr -d ","`
    FILENAME="${SDKID}.${VERSION}.json"

    cp -v $model ${AWS_MODELS_DIR}/${FILENAME}
done

cleanup