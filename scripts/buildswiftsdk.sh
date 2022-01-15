#!/bin/bash

#  Pre-requisite:
#    - Clone the following github repositories to a __single directory__:
#        mkdir ~/Projects/SwiftSDK
#        cd  ~/Projects/SwiftSDK
#        git clone git@github.com:awslabs/aws-sdk-swift.git
#        git clone git@github.com:awslabs/smithy-swift.git
#        git clone --recurse-submodules git@github.com:awslabs/aws-crt-swift.git
#
#  Setup Instructions:
#    1. Ensure buildswiftsdk.sh is in your PATH
#    2. Export the environment variable BUILDSWIFTSDK_DIR to point to where you cloned aws-sdk-swift
#      For example:
#        emacs ~/.bashrc
#        export BUILDSWIFTSDK_DIR=/path/to/aws-sdk-swift
#  
#  Run:
#    buildswiftsdk.sh <recipe>
#
#  Suggestion:
#    You may want to create an alias for this script
#      For example:
#        alias bss=buildswiftsdk.sh
# 

usage() {
    echo "Usage:"
    echo " buildswiftsdk <recipe>"
}

pushdir() {
    if [[ ! -d "${1}" ]]; then
	echo "Error: pushdir: invalid directory: ${1}"
	exit 1
    fi
    pushd "${1}" > /dev/null 2>&1
}

popdir() {
    popd > /dev/null 2>&1
}

RETURNVAL=
dereference() {
    local VAR=$1
    if [[ $IS_ZSH -eq 1 ]]; then
	RETURNVAL="${(P)VAR}"
    else
	RETURNVAL="${!VAR}"
    fi
}

setupPaths() {
    pushdir "${AWS_SDK_SWIFT_DIR_REL}"
    AWS_SDK_SWIFT_DIR="${PWD}"
    SMITHY_SWIFT_DIR_REL="${PWD}/../smithy-swift"
    if [[ -d "${SMITHY_SWIFT_DIR_REL}" ]]; then
	pushdir "${SMITHY_SWIFT_DIR_REL}"
	SMITHY_SWIFT_DIR="${PWD}"
	popdir
    fi
    CLIENT_RUNTIME_DIR="${SMITHY_SWIFT_DIR}/Packages"
    AWS_CLIENT_RUNTIME_DIR="${AWS_SDK_SWIFT_DIR}/AWSClientRuntime"
    popdir
    BASEPCG="${AWS_SDK_SWIFT_DIR}/codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
    BASEPCGL="${AWS_SDK_SWIFT_DIR}/codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"
    REST_JSON="${BASEPCG}/aws-restjson/swift-codegen"
    AWSJSON10="${BASEPCG}/aws-json-10/swift-codegen"
    AWSJSON11="${BASEPCG}/aws-json-11/swift-codegen"
    REST_XML="${BASEPCG}/rest-xml/swift-codegen"
    AWSQUERY="${BASEPCG}/aws-query/swift-codegen"
    EC2QUERY="${BASEPCG}/ec2-query/swift-codegen"
}

checkPaths() {
    error=0
    if [[ ! -d "${SMITHY_SWIFT_DIR}" ]]; then
	echo "Was unable to detect smithy-swift"
	error=1
    fi
    if [[ ! -d "${AWS_SDK_SWIFT_DIR}" ]]; then
	echo "Was unable to detect where aws-sdk-swift"
	error=1
    fi
    if [[ ${error} -eq 1 ]]; then
	exit 1
    fi
}
SWIFTLINT=
swiftlintSetup() {
    SWIFTLINT=`which swiftlint`
}

AWS_SDK_SWIFT_DIR=""
SMITHY_SWIFT_DIR=""
BASEPCG=""
if [[ -z "${BUILDSWIFTSDK_DIR}" ]]; then
    AWS_SDK_SWIFT_DIR_REL=`dirname ${0}`/../
else
    AWS_SDK_SWIFT_DIR_REL="${BUILDSWIFTSDK_DIR}"
fi
setupPaths
checkPaths
swiftlintSetup


checkReturn() {
    if [ $1 -ne 0 ]; then
	echo ""
	echo $2
	exit 1
    fi
}

buildall() {
    cd "${SMITHY_SWIFT_DIR}" && ./gradlew build
    checkReturn $? "Failed on: ./gradlew build in ${SMITHY_SWIFT_DIR}"	
    cd "${SMITHY_SWIFT_DIR}/Packages" && swift test
    checkReturn $? "Failed on: swift test in ${SMITHY_SWIFT_DIR}/Packages"
    cd "${AWS_SDK_SWIFT_DIR}" && ./gradlew build    
    checkReturn $? "Failed on: ./gradlew build in ${AWS_SDK_SWIFT_DIR}"
    cd "${CLIENT_RUNTIME_DIR}" && swift test
    checkReturn $? "Failed on: swift test in ${CLIENT_RUNTIME_DIR}"
    cd "${AWS_CLIENT_RUNTIME_DIR}" && swift test
    checkReturn $? "Failed on: swift test in ${AWS_CLIENT_RUNTIME_DIR}"
    cd "${AWS_SDK_SWIFT_DIR}/codegen" && swift test
    checkReturn $? "Failed on: swift test in codegen"
}


pcg() {
    cd "${SMITHY_SWIFT_DIR}" && \
	./gradlew -p smithy-swift-codegen assemble && \
	cd "${AWS_SDK_SWIFT_DIR}" && \
	./gradlew -p codegen/protocol-test-codegen clean &&\
	./gradlew -p codegen/protocol-test-codegen-local clean &&\
	./gradlew -p codegen/protocol-test-codegen build &&
	./gradlew -p codegen/protocol-test-codegen-local build
    echo "Generated files should be in both:"
    echo "${BASEPCG}"
    echo "${BASEPCGL}"
}

rpcg() {    
    if [ -z $1 ]; then
	RUNDIRS="${AWS_SDK_SWIFT_DIR}/codegen"
    elif [ x$1 == x"rj" ]; then
	RUNDIRS="${REST_JSON}"
    elif [ x$1 == x"10" ]; then
	RUNDIRS="${AWSJSON10}"
    elif [ x$1 == x"11" ]; then
	RUNDIRS="${AWSJSON11}"
    elif [ x$1 == x"rx" ]; then
	RUNDIRS="${REST_XML}"
    elif [ x$1 == x"aq" ]; then
	RUNDIRS="${AWSQUERY}"
    elif [ x$1 == x"e2" ]; then
	RUNDIRS="${EC2QUERY}"
    fi

    FAILEDDIRS=""
    for codegendir in ${RUNDIRS}; do
	echo "entering: ${codegendir}"
	cd ${codegendir} && swift test
	RETVAL=$?
	if [ $RETVAL -ne 0 ]; then
	    temp="${FAILEDDIRS} ${codegendir}"
	    FAILEDDIRS="${temp}"
	fi
    done

    ATTEMPTED_DISPLAYDIRS_ABS=`echo ${RUNDIRS}|tr ' ' '\n'`
    ATTEMPTED_DISPLAYDIRS=`echo ${RUNDIRS}|tr ' ' '\n' |sed "s/.*protocol-test-codegen\/\(.*\)\/swift-codegen/\1/g"`
    FAILED_DISPLAYDIRS=`echo ${FAILEDDIRS}|tr ' ' '\n' |sed "s/.*protocol-test-codegen\/\(.*\)\/swift-codegen/\1/g"`

    echo ""
    echo ""
    echo "SUMMARY:"
    echo ""
    echo "Attempted (Absolute Path):"
    echo "${ATTEMPTED_DISPLAYDIRS_ABS}"
    echo ""
    echo "Attempted (friendly names):"
    echo "${ATTEMPTED_DISPLAYDIRS}"
    echo ""
    if [[ x"${FAILEDDIRS}" != x"" ]]; then
	echo "FAILED for:"
	echo "${FAILED_DISPLAYDIRS}"
    else
	echo "SUCCESS!"
    fi    
}

SDK_cognito=cognito-identity.2014-06-30
SDK_lambda=lambda.2015-03-31
SDK_s3=s3.2006-03-01
SDK_swf=swf.2012-01-25
SDK_ssm=ssm-incidents.2018-05-10
sdk() {
    SDKREF=$1
    SDK_POINTER="SDK_${SDKREF}"
    dereference "${SDK_POINTER}"
    SDK_ONLY="${RETURNVAL}"

    if [[ ! -z "${SDK_ONLY}" ]]; then
	PROPFILE=${AWS_SDK_SWIFT_DIR}/local.properties
	cat "${PROPFILE}" | grep -e "^onlyIncludeModels" | tail -1 | grep -e "^onlyIncludeModels=${SDK_ONLY}" > /dev/null 2>&1
	if [ $? -ne 0 ]; then
	    cat "${PROPFILE}" | grep -e "^onlyIncludeModels" > /dev/null 2>&1
	    HAS_INCLUDE_MODELS=$?
	    LOCAL_PROPS_FILE="${AWS_SDK_SWIFT_DIR}/local.properties"
	    if [ ${HAS_INCLUDE_MODELS} -eq 0 ]; then
		LOCALTEMP=/tmp/.buildswiftsdktemp
		sed  "s/^onlyIncludeModels=.*/onlyIncludeModels=${SDK_ONLY}/g" "${LOCAL_PROPS_FILE}" > ${LOCALTEMP}
		echo "" >> ${LOCALTEMP}
		SUFFIX=`date "+%Y%m%d%H%M%S"`
		mv "${LOCAL_PROPS_FILE}" "${LOCAL_PROPS_FILE}.${SUFFIX}"
		mv "${LOCALTEMP}" "${LOCAL_PROPS_FILE}"
	    else
		echo "onlyIncludeModels=${SDK_ONLY}" >> ${LOCAL_PROPS_FILE}
		echo "" >> ${LOCAL_PROPS_FILE}
	    fi
	fi
    fi    

    cd "${AWS_SDK_SWIFT_DIR}" && \
	./gradlew -p codegen/sdk-codegen build

    CODEGEN_OUTPUT_DIR="${AWS_SDK_SWIFT_DIR}/codegen/sdk-codegen/build/smithyprojections/sdk-codegen"
    SDK_OUTPUT=`ls ${CODEGEN_OUTPUT_DIR} |grep -v "source"`
    if [ ! -z "${SDK_OUTPUT}" ]; then	
	echo "Artifacts folder(s):"
	for sdk in ${SDK_OUTPUT}; do
	    echo "${CODEGEN_OUTPUT_DIR}/${sdk}/swift-codegen"
	done
    else
	echo "Build folder:"
	echo "${CODEGEN_OUTPUT_DIR}"
    fi
    link
}

link() {
    PROJ_DIR="${AWS_SDK_SWIFT_DIR}/codegen/sdk-codegen/build/smithyprojections/sdk-codegen"
    PROJECTIONS=`ls ${PROJ_DIR}|grep -v source`
    for projection in ${PROJECTIONS}; do
	projName=`echo ${projection} | tr '.' ' '| awk '{print $1}'`
	cd ${PROJ_DIR}/${projection} && ln -vs swift-codegen ${projName}
    done
}

lint() {
    klint
    slint
}

klint() {
    cd "${AWS_SDK_SWIFT_DIR}" && \
	./gradlew ktlintFormat
    cd "${SMITHY_SWIFT_DIR}" && \
	./gradlew ktlintFormat
}

slint() {
    if [[ ! -z "${SWIFTLINT}" ]]; then
	cd "${AWS_CLIENT_RUNTIME_DIR}" && "${SWIFTLINT}" autocorrect
	cd "${CLIENT_RUNTIME_DIR}"     && "${SWIFTLINT}" autocorrect
    else
	echo "swiftlint not installed, skipping"
    fi
}

ssclean() {
    cd "${SMITHY_SWIFT_DIR}" && \
	./gradlew clean
}

sdkclean() {
    cd "${AWS_SDK_SWIFT_DIR}" && \
	./gradlew clean    
}

clean() {
    ssclean && sdkclean
}

checkIfServiceDefined() {
    SDKREF=$1
    SDK_POINTER="SDK_${SDKREF}"
    dereference "${SDK_POINTER}"
    SDK_ONLY="${RETURNVAL}"
    if [ x"" != x"${SDK_ONLY}" ]; then
	RETURNVAL=0
    else
	RETURNVAL=1
    fi

}

interpretArgs() {
    case "$1" in
	"b")
	    buildall
	    ;;
	"pcg")
	    pcg
	    ;;
	"rpcg")
	    rpcg $2
	    ;;
	"clean")
	    clean
	    ;;
	"sdk")
	    sdk $2
	    ;;
	"link")
	    link
	    ;;
	"lint")
	    lint
	    ;;
	"klint")
	    klint
	    ;;
	"slint")
	    slint
	    ;;
	"ssclean")
	    ssclean
	    ;;
	"sdkclean")
	    sdkclean
	    ;;
	*)
	    usage
	    ;;
    esac
}

checkIfServiceDefined $1
if [ ${RETURNVAL} -eq 0 ]; then
    sdk $1
else
    interpretArgs $*
fi

