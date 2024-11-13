#!/bin/bash

print_header() {
  local header=$1
  print_empty_line
  echo "##### $header #####"
  print_empty_line
}

print_empty_line() {
  echo ""
}

print_header "SETTING UP SMOKE TESTS"

# This script must be run from . that contains smoke test runner executables under ./Executables.
SMOKE_TESTS_DIR="./Executables"
if [[ -d "$SMOKE_TESTS_DIR" ]]; then
    echo "INFO: Directory '$SMOKE_TESTS_DIR' exists in $(pwd)."
else
    echo "ERROR: Directory '$SMOKE_TESTS_DIR' does not exist in $(pwd)."
    exit 1
fi

# Expect comma-separated sdkId's from AWS_SMOKE_TEST_SERVICE_IDS environment variable.
# Each sdkId is processed following same logic as in Swift codegen.
# The resulting array will be in the format "AWSNameSmokeTestRunner", e.g., "AWSS3SmokeTestRunner".
if [ -z "$AWS_SMOKE_TEST_SERVICE_IDS" ]; then
  # If env var isn't set, exit script
  echo "INFO: The environment variable AWS_SMOKE_TEST_SERVICE_IDS is not set or is empty."
  echo "INFO: Exiting run-smoke-tests.sh with exit code 0."
  exit 0
else
  IFS=',' read -r -a testRunnerNames <<< "$AWS_SMOKE_TEST_SERVICE_IDS"
  for i in "${!testRunnerNames[@]}"; do
    # Remove whitespace from sdkId
    value="${testRunnerNames[$i]// /}"

    # Capitalize the first letter of sdkId
    value="$(echo "${value:0:1}" | tr '[:lower:]' '[:upper:]')${value:1}"

    # Remove "Service" suffix from sdkId if it exists
    value="${value%Service}"

    # Add "AWS" prefix and "SmokeTestRunner" suffix to the modified value
    value="AWS${value}SmokeTestRunner"

    # Update the original array with the modified value
    testRunnerNames[$i]="$value"
  done
  echo "INFO: Retrieved value of \$AWS_SMOKE_TEST_SERVICE_IDS env var: \"$AWS_SMOKE_TEST_SERVICE_IDS\""
  IFS=','; echo "INFO: Constructed test runner names: [${testRunnerNames[*]}]"
fi

print_header "RUNNING SMOKE TESTS"

for testRunnerName in "${testRunnerNames[@]}"; do
  # If test runner executable exists under ./Executables/
  if [ -x "./Executables/$testRunnerName" ]; then
    echo "INFO: Running ${testRunnerName}..."
    # Run executable
    ./Executables/"$testRunnerName"
    print_empty_line
  # If no smoke tests were generated, no-op
  else
    echo "INFO: ${testRunnerName} not found. Skipping..."
    print_empty_line
  fi
done
