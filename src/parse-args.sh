#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
#
# Filename: parse-args.sh
# Description: parse script arguments
# Author: ADoyle <adoyle.h@gmail.com>
# LICENSE: Apache License, Version 2.0
# First Created: 2017-07-21T02:56:08Z
# Last Modified: 2017-07-21T02:56:08Z
# Version: 0.1.0
# Bash Version: 4.x
# Source:
# Project: https://github.com/adoyle-h/bash-logger

usage() {
cat <<EOF
Usage: $0 [-o <output>] [-e] [-h]
Options:
    -o <output>         Write log to <output> file
    -e                  Enable the logger
    -h                  Show help
EOF
}

while getopts ":heo:" opt ; do
    case "$opt" in
    e)
        LOG_ENABLED=yes
        ;;
    o)
        LOG_TARGET=$OPTARG
        ;;
    h)
        usage
        exit 0
        ;;
    ?)
        ERROR "Unknown option '-$OPTARG'"
        exit 1
        ;;
    :)
        ERROR "No argument value for option '-$OPTARG'"
        exit 1
        ;;
    *)
        ERROR "Unknown error while processing options"
        exit 1
        ;;
    esac
done
