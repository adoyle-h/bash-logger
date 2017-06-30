# bash-logger

A simple bash logger utility

## TOC

<!-- MarkdownTOC GFM -->

- [Install](#install)
- [Usage](#usage)
- [API](#api)
    - [ENTER/EXIT](#enterexit)
    - [DEBUG/INFO/WARN/ERROR](#debuginfowarnerror)
- [Example](#example)

<!-- /MarkdownTOC -->

## Install

TODO: Available as a [bpkg](http://www.bpkg.io/)

```sh
bpkg install adoyle/shell-logger
```

## Usage

Only print message to `stdout`: `source logger.sh ""`.

Print message to `stdout` and write it to a file: `source logger.sh "<output-path>"`.

## API

### ENTER/EXIT

Used in script entry and final exit.
Used in function entry and final exit.

```sh
ENTER "message"
```

printed format: `[<local-date-time>][DEBUG](<ENTER-or-EXIT>) <script-or-function>: <script-path-or-function-name>`

### DEBUG/INFO/WARN/ERROR

Support 4 levels:

- DEBUG
- INFO
- WARN
- ERROR

Use `DEBUG` as example.

```sh
DEBUG "message"
```

printed format: `[<local-date-time>][<level>](<main-or-method-name>) <message>`



## Example

```sh
# file: ./test/logger.sh
# import the logger script
source "<path>/logger.sh ""

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
```

It will print:

```
[2017/06/30 15:36:07][DEBUG](ENTER) script: ./test/logger.sh
[2017/06/30 15:36:07][DEBUG](ENTER) function: foo
[2017/06/30 15:36:07][DEBUG](foo) DEBUG message
[2017/06/30 15:36:07][INFO](foo) INFO message
echo message
[2017/06/30 15:36:07][WARN](foo) WARN message
[2017/06/30 15:36:07][ERROR](foo) ERROR message
[2017/06/30 15:36:07][DEBUG](EXIT) function: foo
[2017/06/30 15:36:07][DEBUG](EXIT) script: ./test/logger.sh
```
