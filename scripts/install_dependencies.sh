#!/bin/bash

set -x

# Intended to be run as part of a Github Actions job only.
# Sets up the project to be ready for Swift build/test and codegen.

# Determine if the current branch name exists on smithy-swift.
# If so, set the env var with that branch name.
# If no smithy-swift branch name matches the aws-sdk-swift branch name, default to main.
if git ls-remote --exit-code --heads https://github.com/awslabs/smithy-swift.git "$AWS_SDK_REF_TO_BUILD"
then
  echo "AWS_SDK_SMITHY_SWIFT_BRANCH_OVERRIDE=$AWS_SDK_REF_TO_BUILD" >> $GITHUB_ENV
else
  echo "AWS_SDK_SMITHY_SWIFT_BRANCH_OVERRIDE=main" >> $GITHUB_ENV
fi

# Determine if the current branch name exists on aws-crt-swift.
# If so, set the env var with that branch name.
# If no aws-sdk-swift branch name matches the aws-sdk-swift branch name, default to main.
if git ls-remote --exit-code --heads https://github.com/awslabs/aws-crt-swift.git "$AWS_SDK_REF_TO_BUILD"
then
  echo "AWS_SDK_AWS_CRT_SWIFT_BRANCH_OVERRIDE=$AWS_SDK_REF_TO_BUILD" >> $GITHUB_ENV
else
  echo "AWS_SDK_AWS_CRT_SWIFT_BRANCH_OVERRIDE=main" >> $GITHUB_ENV
fi

# Generate Package.swift with branches set, if needed.
swift ./scripts/generatePackageSwift.swift > Package.swift

# Install Swift packages
swift package resolve

