#!/bin/bash

set -e

REF=`git ls-remote --exit-code --heads https://github.com/awslabs/smithy-swift.git "refs/heads/$GITHUB_REF_NAME" | awk '{print $1}'`
if [[ ! -z "${REF}" ]]; then
    echo "Ref on smithy-swift is $REF"
else
    echo "Ref is unset"
fi
