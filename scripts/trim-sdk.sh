#!/bin/bash

# Trims this copy of aws-sdk-swift down to the services you actually use: the
# ones a version of amplify-swift needs, the ones you name, or both.  Xcode then
# indexes a handful of services instead of 400+, which makes debugging against a
# local copy of the SDK much faster.
#
# Unlike scripts/configure-amplify-only-sdk.sh, this doesn't run codegen: it
# deletes the unwanted service directories from Sources/Services and regenerates
# the package manifest and doc index from what's left.  So it needs only a Swift
# toolchain, no JRE or gradle, and takes well under a minute.
#
# Pass --amplify-version to work from amplify-swift: it reads the services that
# version needs from its Package.swift on GitHub, and checks out the aws-sdk-swift
# version it pins, so no amplify-swift checkout is needed.  Services your own code
# calls directly can be added with --service.
#
# Keeping amplify-swift's services is optional.  Leave --amplify-version off and
# the SDK is trimmed to just the --service names, on whatever version is checked
# out, which is how to use this on a project with no amplify-swift in it.
#
# Rerunning is how you change the set: it works out the services to keep from
# scratch, restores from git any that an earlier run deleted, and deletes the
# rest.  So list every --service you want each time, not just the new ones.
#
# Credential resolution isn't affected: it goes through the Internal* clients
# under Sources/Core/AWSSDKIdentity/InternalClients, which this doesn't touch, so
# the public AWSSTS, AWSSSO, AWSSSOOIDC and AWSSignin modules are deleted like
# any other service unless amplify-swift or --service names them.
#
# For use during development only.  Sources/Services, Package.swift and the doc
# index are tracked by git; the command to restore them is printed at the end.

set -eo pipefail

AMPLIFY_REPO="https://github.com/aws-amplify/amplify-swift"
AMPLIFY_RAW="https://raw.githubusercontent.com/aws-amplify/amplify-swift"
SMITHY_SWIFT_REPO="https://github.com/smithy-lang/smithy-swift.git"
SDK_REPO="https://github.com/awslabs/aws-sdk-swift.git"

# Where the CLI writes the doc index.  It moved between SDK versions, and the
# releases around 1.6 write both paths, so treat every one that exists as ours.
DOC_INDEXES="Sources/Core/SDKForSwift/Documentation.docc/SDKForSwift.md
Sources/Core/AWSSDKForSwift/Documentation.docc/AWSSDKForSwift.md"

# The logic lives in main(), called on the last line.  Bash parses a function
# body in full before running it, so checking out another SDK version mid-run
# can't pull this script out from under itself.

usage() {
    cat <<'EOF'
Usage: scripts/trim-sdk.sh [options]

At least one of --amplify-version and --service is required: together they are
the set of services to keep.

Options:
  -a, --amplify-version VERSION
                  Keep the services this version of amplify-swift needs, and
                  check out the aws-sdk-swift version it pins.  VERSION is the
                  one your project resolves to, e.g. 2.62.0 (Xcode shows it
                  under Package Dependencies); its Package.swift is read from
                  GitHub, so no amplify-swift checkout is needed.  Pass 'latest'
                  for amplify-swift's newest release, or the path to a local
                  checkout to read that instead.  Omit this to ignore
                  amplify-swift and keep only what --service names.
  -s, --service SERVICE
                  Also keep this AWS service, named by its module, e.g.
                  AWSDynamoDB.  Repeatable, and takes a comma separated list.
                  Rerunning rebuilds the set, so pass every service you want,
                  including ones a previous run already kept.
  -n, --dry-run   List what would be deleted and stop.
  -y, --yes       Delete without asking first.
  --no-checkout   Keep the SDK version checked out now, instead of the version
                  amplify-swift pins.
  -h, --help      Show this message.

Examples:
  # what amplify-swift 2.62.0 needs, on the SDK version it pins
  ./scripts/trim-sdk.sh -a 2.62.0

  # the same, plus DynamoDB and SQS for your own code
  ./scripts/trim-sdk.sh -a 2.62.0 -s AWSDynamoDB,AWSSQS

  # DynamoDB and SQS only, leaving the checkout on the version it's on
  ./scripts/trim-sdk.sh -s AWSDynamoDB,AWSSQS
EOF
}

main() {
    local amplify="" extra="" do_checkout=1 dry_run=0 assume_yes=0

    while [ $# -gt 0 ]; do
        case "$1" in
            -a|--amplify-version)
                [ $# -ge 2 ] || { echo "error: $1 needs a version, 'latest', or a path" >&2; return 2; }
                amplify="$2"; shift 2 ;;
            -s|--service)
                [ $# -ge 2 ] || { echo "error: $1 needs a service name" >&2; return 2; }
                extra="$extra $(echo "$2" | tr ',' ' ')"; shift 2 ;;
            -n|--dry-run) dry_run=1; shift ;;
            -y|--yes) assume_yes=1; shift ;;
            --no-checkout) do_checkout=0; shift ;;
            -h|--help) usage; return 0 ;;
            -*) echo "error: unknown option: $1" >&2; usage >&2; return 2 ;;
            *) echo "error: unexpected argument: $1" >&2; usage >&2; return 2 ;;
        esac
    done

    [ -n "$amplify" ] || [ -n "$extra" ] || {
        echo "error: nothing to keep.  Name the services you want with --service," >&2
        echo "       or pass --amplify-version to keep the ones amplify-swift needs" >&2
        return 2
    }

    # A local amplify-swift path is relative to where you ran this, so resolve it
    # before moving to the SDK root.  Everything else works from any directory.
    [ ! -d "$amplify" ] || amplify="$(cd "$amplify" && pwd)"
    cd "$(dirname "${BASH_SOURCE[0]}")/.."

    # This trims the checkout it is part of, from whatever directory you run it
    # in, so it has to be the copy that came with an aws-sdk-swift checkout.
    [ -d Sources/Services ] || {
        echo "error: $(pwd) is not an aws-sdk-swift checkout" >&2
        echo "       This script trims the checkout it lives in.  Clone one and" >&2
        echo "       run its copy: git clone $SDK_REPO" >&2
        return 1
    }

    local tmp
    tmp="$(mktemp -d)"
    # shellcheck disable=SC2064
    trap "rm -rf '$tmp'" EXIT

    # 1. Get amplify-swift's manifest, from GitHub unless given a local checkout.
    #    Without --amplify-version there's none to read: the services named with
    #    --service are the whole set, and no SDK version is pinned to check out.
    local manifest version="" products=""
    if [ -z "$amplify" ]; then
        echo "Keeping only the services given with --service."
    else
        if [ -d "$amplify" ]; then
            manifest="$amplify/Package.swift"
            [ -f "$manifest" ] || { echo "error: no Package.swift in $amplify" >&2; return 1; }
        else
            [ "$amplify" != latest ] || amplify="$(latest_amplify_version)"
            [ -n "$amplify" ] || { echo "error: couldn't list amplify-swift releases from $AMPLIFY_REPO" >&2; return 1; }
            manifest="$tmp/Package.swift"
            curl -fsSL "$AMPLIFY_RAW/$amplify/Package.swift" -o "$manifest" 2>/dev/null || {
                echo "error: couldn't read Package.swift for amplify-swift $amplify" >&2
                echo "       check the version at $AMPLIFY_REPO/tags" >&2
                return 1
            }
        fi

        # 2. Read the SDK version & services amplify-swift needs from that
        #    manifest.  The version may be pinned as exact:, from:, or
        #    .upToNextX(from:), so take the first version string after the URL.
        version="$(sed -nE 's#.*aws-sdk-swift(\.git)?",[^"]*"([^"]+)".*#\2#p' "$manifest" | head -1)"
        products="$(sed -nE 's/.*name:[[:space:]]*"(AWS[A-Za-z0-9]+)",[[:space:]]*package:[[:space:]]*"aws-sdk-swift".*/\1/p' "$manifest" | sort -u)"
        [ -n "$products" ] || { echo "error: no aws-sdk-swift products found in $manifest" >&2; return 1; }
        echo "amplify-swift $amplify requires aws-sdk-swift ${version:-(unpinned)}"
    fi

    # 3. Check out the SDK version amplify-swift pins.  Do this before deleting
    #    anything, since it needs a clean tree.
    local current previous
    current="$(git describe --tags --exact-match HEAD 2>/dev/null || true)"
    if [ -z "$version" ] || [ "$version" = "$current" ] || [ "$do_checkout" -eq 0 ]; then
        echo "Using the SDK as checked out now (${current:-untagged})."
    else
        [ -z "$(git status --porcelain -uno)" ] || {
            echo "error: this checkout has uncommitted changes; commit or stash them," >&2
            echo "       or pass --no-checkout to trim this revision as it is.  If an" >&2
            echo "       earlier run left it trimmed, undo that with:" >&2
            echo "       $(restore_command)" >&2
            return 1
        }
        git rev-parse -q --verify "refs/tags/$version" >/dev/null || git fetch --tags
        previous="$(git symbolic-ref --short -q HEAD || git rev-parse --short HEAD)"
        echo "Checking out $version; HEAD will be detached."
        echo "Come back to where you were with: git checkout $previous"
        git checkout -q "refs/tags/$version"
    fi

    # 4. Work out which service directories to keep.  Names resolve against every
    #    service tracked at HEAD rather than the ones on disk, so a rerun can name
    #    a service an earlier run deleted and get it restored instead of an error.
    local keep delete restore module keep_count delete_count restore_count
    git ls-tree -d --name-only HEAD Sources/Services/ |
        sed 's#^Sources/Services/##' | sort > "$tmp/tracked"
    [ -s "$tmp/tracked" ] || { echo "error: no services tracked at HEAD under Sources/Services" >&2; return 1; }
    ls Sources/Services | sort > "$tmp/present"

    keep="$(select_modules "$tmp/tracked" "$products" "$extra")"
    [ -n "$keep" ] || { echo "error: nothing to keep; refusing to empty Sources/Services" >&2; return 1; }
    echo "$keep" > "$tmp/keep"

    delete="$(comm -23 "$tmp/present" "$tmp/keep")"
    restore="$(comm -13 "$tmp/present" "$tmp/keep")"
    keep_count="$(wc -l < "$tmp/keep" | tr -d ' ')"
    delete_count="$(printf '%s' "$delete" | grep -c . || true)"
    restore_count="$(printf '%s' "$restore" | grep -c . || true)"

    echo "Keeping $keep_count services: $(echo "$keep" | paste -sd' ' -)"
    [ "$restore_count" -eq 0 ] || echo "Restoring $restore_count an earlier run deleted."
    [ "$delete_count" -eq 0 ] || echo "Deleting $delete_count of the $(wc -l < "$tmp/present" | tr -d ' ') now present."
    [ "$delete_count" -gt 0 ] || [ "$restore_count" -gt 0 ] ||
        echo "Sources/Services already holds exactly these."

    if [ "$dry_run" -eq 1 ]; then
        [ "$restore_count" -eq 0 ] || echo "$restore" | sed 's#^#  + Sources/Services/#'
        [ "$delete_count" -eq 0 ] || echo "$delete" | sed 's#^#  - Sources/Services/#'
        echo "Dry run; nothing changed."
        return 0
    fi

    # 5. Restore and delete.  Deletions are of tracked files, so confirm first.
    if [ "$delete_count" -gt 0 ] && [ "$assume_yes" -eq 0 ] && [ -t 0 ]; then
        local reply
        printf 'Delete %d directories from Sources/Services? [y/N] ' "$delete_count"
        read -r reply
        case "$reply" in
            [yY]|[yY][eE][sS]) ;;
            *) echo "Aborted; nothing changed."; return 1 ;;
        esac
    fi

    # Get the smithy-swift checkout the doc index needs in place before deleting
    # anything, so a failure to clone it doesn't leave a half-trimmed SDK.
    prepare_smithy_swift

    if [ "$restore_count" -gt 0 ]; then
        echo "$restore" | sed 's#^#Sources/Services/#' | tr '\n' '\0' | xargs -0 git checkout --
        echo "Restored $restore_count service directories."
    fi

    if [ "$delete_count" -gt 0 ]; then
        for module in $delete; do
            rm -rf "Sources/Services/$module"
        done
        echo "Deleted $delete_count service directories."
    fi

    # 6. Regenerate the manifest and doc index from what's left in
    #    Sources/Services, which is what both of them enumerate.
    echo "Regenerating the package manifest and doc index..."
    run_cli generate-package-manifest
    run_cli generate-doc-index

    # 7. Explain how to use it from Xcode.
    cat <<EOF

Done.  To use this SDK from your project:
  - Open the project in a workspace (File > New > Workspace if it isn't in one.)
  - Add $(pwd) to the workspace with File > Add Files To...
  - Xcode will use this local SDK in place of the one it resolved.

Restore the full set of services with:
  $(restore_command)
EOF
}

# Runs an AWSSDKSwiftCLI subcommand against the repo root.  Which SDK version is
# checked out decides how: releases from 1.8 on ship a runner script that builds
# the CLI before running it, and older ones are driven with swift run from the
# CLI's own package directory, with the repo root passed as a relative path.
# Usage: run_cli <subcommand>
run_cli() {
    if [ -x scripts/ci_steps/run_cli.sh ]; then
        ./scripts/ci_steps/run_cli.sh "$1" .
    else
        (cd AWSSDKSwiftCLI && swift run AWSSDKSwiftCLI "$1" ..)
    fi
}

# Makes sure the CLI has a smithy-swift checkout to read runtime module names
# from for the doc index.  The path is hardcoded to ../smithy-swift.
prepare_smithy_swift() {
    local dir="../smithy-swift" version
    [ ! -d "$dir" ] || return 0

    version="$(grep -A1 '<key>clientRuntimeVersion</key>' packageDependencies.plist |
        sed -nE 's#.*<string>(.*)</string>.*#\1#p')"
    [ -n "$version" ] || {
        echo "error: couldn't read the smithy-swift version from packageDependencies.plist;" >&2
        echo "       clone smithy-swift to $(cd .. && pwd)/smithy-swift and rerun" >&2
        return 1
    }
    echo "Cloning smithy-swift $version into $(cd .. && pwd)/smithy-swift;"
    echo "the doc index lists the runtime modules found there."
    git -c advice.detachedHead=false clone -q --depth 1 --branch "$version" "$SMITHY_SWIFT_REPO" "$dir"
}

# Prints the git command that puts back everything this script rewrites.
restore_command() {
    local paths="Sources/Services Package.swift" doc
    for doc in $DOC_INDEXES; do
        [ ! -f "$doc" ] || paths="$paths $doc"
    done
    echo "git checkout -- $paths"
}

# Prints amplify-swift's highest released version.
latest_amplify_version() {
    git ls-remote --tags --refs "$AMPLIFY_REPO" |
        sed -nE 's#.*refs/tags/([0-9]+\.[0-9]+\.[0-9]+)$#\1#p' |
        sort -t. -k1,1n -k2,2n -k3,3n |
        tail -1
}

# Prints the sorted module names for the given services.
# Usage: select_modules <tracked-service-listing> <services> [<services>...]
select_modules() {
    local all="$1" service module core selected=""
    shift
    # Modules under Sources/Core aren't generated services; skip them.  Products
    # read from amplify-swift's manifest include AWSClientRuntime, which is one.
    core=" $(ls Sources/Core | tr '\n' ' ')"

    for service in $*; do
        case "$core" in *" $service "*) continue ;; esac
        # Match case insensitively, but keep the directory's own spelling: on a
        # case insensitive file system a mis-cased name would otherwise pass and
        # then fail to match its directory when the two lists are compared.
        module="$(awk -v s="$service" 'tolower($0) == tolower(s) { print; exit }' "$all")"
        [ -n "$module" ] || {
            echo "error: no service named $service tracked under Sources/Services;" >&2
            echo "       expected a module name like AWSDynamoDB" >&2
            return 1
        }
        selected="$selected$module
"
    done
    printf '%s' "$selected" | sort -u
}

main "$@"; exit $?
