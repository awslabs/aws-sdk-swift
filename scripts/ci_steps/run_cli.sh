#!/bin/bash

# Builds AWSSDKSwiftCLI, then runs it as a separate command.
#
# `swift run` execs the product in place the instant the build finishes, so the
# CLI starts up while the build is still at its peak memory.  On the 3-core /
# 7 GB macos-14 runners that exec is intermittently SIGKILLed before the CLI
# writes a single line.  Building first lets the build's memory be released
# before the CLI starts, and makes a build failure distinguishable from a run
# failure.
#
# Run from the repo root; all arguments are passed through to the CLI.

set -e

cd AWSSDKSwiftCLI

swift build --product AWSSDKSwiftCLI

cli="$(swift build --product AWSSDKSwiftCLI --show-bin-path)/AWSSDKSwiftCLI"

"$cli" "$@"
