#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
set -o errexit
set -o nounset
set -o pipefail
[[ -n "${TRACE+x}" ]] && set -o xtrace

CUR_FILE_DIR="$(cd "$( dirname "$0" )" && pwd)"

source "$CUR_FILE_DIR"/../src/logger.sh ""

function foo() {
    ENTER
    DEBUG "DEBUG message"
    INFO "INFO message"
    echo "echo message"
    WARN "WARN message"
    ERROR "ERROR message"
    EXIT
}

ENTER

foo

EXIT
