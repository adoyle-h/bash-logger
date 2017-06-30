#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
#
# Filename: logger.sh
# Description: A simple bash logger utility
# Author: ADoyle <adoyle.h@gmail.com>
# First Created: 2017-06-30T07:09:59Z
# Last Modified: 2017-06-30T07:09:59Z
# Version: 0.2.0
# Bash Version: 4.x
# Source: https://github.com/adoyle-h/bash-logger
# Inspired by:
#   - http://www.cubicrace.com/2016/03/efficient-logging-mechnism-in-shell.html


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
    local msg=$1
    if [[ -n "$LOG_TARGET" ]] ;then
        echo "$msg" | tee >> "$LOG_TARGET"
    else
        echo "$msg"
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
    _echo "[$date_time][$level]($function_name) $msg"
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
