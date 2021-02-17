#!/bin/bash
if [[ $# -ne 2 ]]; then
    echo "script [file] [path to replace]"
    exit 1
fi
FILE=$1
if [[ ! -f $FILE ]]; then
  echo "Fail, file is not valid: ${FILE}"
  exit 1
fi
INPUT=$2
cat ${FILE}  |sed "s#~/Projects/Amplify/SwiftSDK#$INPUT#g" > ${FILE}.tmp
mv ${FILE}.tmp ${FILE}