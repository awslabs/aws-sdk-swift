#!/bin/bash

# Diagnostics for the intermittent "Killed: 9" (exit 137) failures of
# `swift run AWSSDKSwiftCLI` seen on the macos-14 / Xcode 16.1 CI runners.
#
# The build completes and the binary is killed within a few milliseconds of
# being exec'd, before it writes any output.  This dumps the code signature of
# the binary that was about to run, plus the system log and memory state, to
# distinguish a code signing rejection from memory pressure.
#
# Invoked by the prepare scripts with the CLI's exit status, from within the
# AWSSDKSwiftCLI directory.  Never fails the build itself.

status="$1"

echo "::group::AWSSDKSwiftCLI failure diagnostics (exit ${status})"

bin_path="$(swift build --product AWSSDKSwiftCLI --show-bin-path 2>/dev/null)"
bin="${bin_path}/AWSSDKSwiftCLI"
echo "binary: ${bin}"
ls -l "${bin}"

if [ "$(uname)" = "Darwin" ]; then
  shasum -a 256 "${bin}"

  echo "--- codesign --verify ---"
  codesign --verify --verbose=4 --strict "${bin}"
  echo "codesign --verify exit: $?"

  echo "--- codesign --display ---"
  codesign --display --verbose=4 "${bin}"

  echo "--- memory ---"
  sysctl -n hw.memsize
  vm_stat

  echo "--- system log: AWSSDKSwiftCLI ---"
  log show --last 5m --style compact \
    --predicate 'eventMessage CONTAINS "AWSSDKSwiftCLI"' | tail -50

  echo "--- system log: code signing & memory kills ---"
  log show --last 5m --style compact \
    --predicate 'eventMessage CONTAINS "code signature" OR eventMessage CONTAINS "AMFI" OR eventMessage CONTAINS "jetsam" OR eventMessage CONTAINS "Killing process"' | tail -50
else
  # `free` is absent and `dmesg` is not permitted in some container images
  echo "--- memory ---"
  grep -E "^(MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree)" /proc/meminfo || true
  echo "--- OOM kills & crashes ---"
  dmesg 2>/dev/null | tail -40 || echo "dmesg unavailable in this container"
  echo "--- core dumps ---"
  cat /proc/sys/kernel/core_pattern 2>/dev/null || true
  ls -l ./core* 2>/dev/null || echo "no core file in $(pwd)"
fi

echo "::endgroup::"

exit 0
