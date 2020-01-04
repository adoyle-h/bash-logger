#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
set -o errexit
set -o nounset
set -o pipefail
[[ -n "${TRACE+x}" ]] && set -o xtrace

CUR_FILE_DIR="$(cd "$( dirname "$0" )" && pwd)"



function loggerShCheck()
{
	# bash -n check the syntax of logger.sh. 
	# If there is an error, it will stop the test script right now.
	bash -n "$CUR_FILE_DIR"/../src/logger.sh ""

	if [[ "$?" == 0 ]]; then
		echo "logger.sh does not have syntax error"
	fi
}

loggerShCheck




source "$CUR_FILE_DIR"/../src/logger.sh ""

function foo() {
    ENTER
    DEBUG "DEBUG message"
    INFO "INFO message"
    echo "echo message"
    WARN "WARN message"
    ERROR "ERROR message"
	SUCCESS "SUCCESS message"
    EXIT
}




function colorCheck() {
	local levelColor=$(_getLevelColor EXIT)
	echo "EXIT has color code $levelColor"

	levelColor=$(_getLevelColor ENTER)
	echo "ENTER has color code $levelColor"

	levelColor=$(_getLevelColor DEBUG)
	echo "DEBUG has color code $levelColor"

	levelColor=$(_getLevelColor INFO)
	echo "INFO has color code $levelColor"

	levelColor=$(_getLevelColor WARN)
	echo "WARN has color code $levelColor"

	levelColor=$(_getLevelColor ERROR)
	echo "ERROR has color code $levelColor"

	local levelColor=$(_getLevelColor "unexpectedLevel")
	echo "unexpectedLevel has color code $levelColor"
}



colorCheck


ENTER

foo

EXIT
