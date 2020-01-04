#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
#
# Filename: logger.sh
# Description: A simple bash logger utility
# Author: ADoyle <adoyle.h@gmail.com>
# LICENSE: Apache License, Version 2.0
# First Created: 2017-06-30T07:09:59Z
# Last Modified: 2017-06-30T07:09:59Z
# Version: 0.2.0
# Bash Version: 4.x
# Source: https://github.com/adoyle-h/bash-logger
# Inspired by:
#   - http://www.cubicrace.com/2016/03/efficient-logging-mechnism-in-shell.html


#######################################################################
#                           Constants                                 #
#######################################################################
BASH_COLOR_CODE_RED="\e[31m"
BASH_COLOR_CODE_YELLOW="\e[33m"
BASH_COLOR_CODE_GREEN="\e[32m"
BASH_COLOR_CODE_BLUE="\e[34m"
BASH_COLOR_CODE_DEFAULT="\e[39m"

declare -A ARRAY_LEVEL_COLOR=( \
	[ENTER]=$BASH_COLOR_CODE_DEFAULT \
	[EXIT]=$BASH_COLOR_CODE_DEFAULT \
	[DEBUG]=$BASH_COLOR_CODE_DEFAULT \
	[INFO]=$BASH_COLOR_CODE_BLUE \
	[WARN]=$BASH_COLOR_CODE_YELLOW \
	[ERROR]=$BASH_COLOR_CODE_RED \
	[SUCCESS]=$BASH_COLOR_CODE_GREEN \
)

#######################################################################
#                           initialization                            #
#######################################################################

LOG_TARGET=${1-}

if [[ -n "$LOG_TARGET" ]] ;then
    touch "$LOG_TARGET"
fi


#######################################################################
#                           private methods                           #
#######################################################################

function _echo() {
    local msg=$2
	local level=$1

    if [[ -n "$LOG_TARGET" ]] ;then
        echo "$msg" | tee >> "$LOG_TARGET"
    else
		local levelColor=$(_getLevelColor $level)
        echo -e "${levelColor}${msg}${BASH_COLOR_CODE_DEFAULT}"
    fi
}

function _date_time() {
    date +"%Y/%m/%d %H:%M:%S"
}

function _utc_date_time() {
    date -u +"%Y/%m/%dT%H:%M:%SZ"
}

function _log() {
    local function_name date_time msg level
    msg="$1"
    level="${2-${FUNCNAME[1]}}"
    date_time=$(_date_time)
    function_name="${FUNCNAME[2]}"
    _echo $level "[$date_time][$level]($function_name) $msg" 
}

function _CTX() {
    local ctx ctx_name ctx_type

    ctx_name="${FUNCNAME[2]}"

    if [[ $ctx_name == main ]]; then
        ctx_name=$0
        ctx_type="script"
    else
        ctx_type="function"
    fi

    ctx=($ctx_name $ctx_type)

    echo "${ctx[@]}"
}

function _levelExists(){
	local level=$1
	if [[ "${ARRAY_LEVEL_COLOR[$level]+isset}" ]]; then
        return 0
    else
		return 1
	fi
}

function _getLevelColor(){
	local level=$1
	_levelExists $level
	local levelExists=$?
	
	if [[ "$levelExists" == "0" ]]; then
		echo ${ARRAY_LEVEL_COLOR["$level"]}
	else
		echo $BASH_COLOR_CODE_DEFAULT
	fi

	
}
#######################################################################
#                           public methods                            #
#######################################################################

function ENTER() {
    local ctx ctx_name date_time
    ctx=($(_CTX))
    DEBUG "${ctx[1]}: ${ctx[0]}"
}

function EXIT() {
    local ctx date_time
    ctx=($(_CTX))
    DEBUG "${ctx[1]}: ${ctx[0]}"
}

function DEBUG() {
    _log "$1"
}

function INFO() {
    _log "$1"
}

function WARN() {
    _log "$1"
}

function ERROR() {
    _log "$1"
}

function SUCCESS() {
    _log "$1"
}

