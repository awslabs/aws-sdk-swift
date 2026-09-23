#!/bin/bash

# Diagnostics for xcodebuild failures whose cause xcbeautify does not print.
#
# The simulator integration test jobs exit 65 after "Resolved source packages"
# without any error line reaching the log; the diagnostic only exists in the
# raw xcodebuild output and the result bundle.  Run this as an `if: failure()`
# step after an xcodebuild step that tees its raw output to
# ${RUNNER_TEMP}/xcodebuild-raw.log and writes a result bundle to
# ${RUNNER_TEMP}/IntegrationTests.xcresult.
#
# Never fails the build itself.

raw_log="${RUNNER_TEMP}/xcodebuild-raw.log"
result_bundle="${RUNNER_TEMP}/IntegrationTests.xcresult"

echo "::group::Raw xcodebuild errors"
if [ -f "${raw_log}" ]; then
  grep -nE "error:|error!|\*\* .* FAILED \*\*|Unable to|not supported|requires minimum" "${raw_log}" | head -50
  echo "--- last 60 lines of raw output ---"
  tail -60 "${raw_log}"
else
  echo "no raw log at ${raw_log}"
fi
echo "::endgroup::"

echo "::group::Result bundle"
if [ -d "${result_bundle}" ]; then
  xcrun xcresulttool get build-results summary --path "${result_bundle}" 2>/dev/null \
    || xcrun xcresulttool get --format json --path "${result_bundle}" --legacy 2>/dev/null \
    | head -200
else
  echo "no result bundle at ${result_bundle}"
fi
echo "::endgroup::"

exit 0
