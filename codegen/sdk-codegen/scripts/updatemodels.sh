#!/bin/bash

OUTPUT_DIR="../aws-models"

if [ ! -d ${OUTPUT_DIR} ]; then
    echo "Could not find ${OUTPUT_DIR}"
    echo "  Are you running the script in the right location?"
    exit 1
fi

TEMPDIR=`mktemp -d`
fetchGitHubRepo() {
    mkdir -p ${TEMPDIR}
    pushd ${TEMPDIR}
    git clone git@github.com:aws/aws-models.git
    #git clone https://github.com/aws/aws-models.git
    popd
}
cleanup() {
    rm -Rf ${TEMPDIR}
}


#if [ ! -d ${TEMPDIR} ]; then
fetchGitHubRepo
#else
#    echo "No need to fetch new models"
#fi

JSON_MODEL_FILES=`find ${TEMPDIR}/aws-models |grep -e "smithy\/model\.json$"`

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

    cp -v $model ${OUTPUT_DIR}/${FILENAME}
done

cleanup

