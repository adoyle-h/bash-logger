# bash-logger

A simple bash logger utility

## Install

TODO: Available as a [bpkg](http://www.bpkg.io/)

```sh
bpkg install adoyle/shell-logger
```

## Usage

```sh
# import the script
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
[2017/06/30 15:27:21][DEBUG](ENTER) script: logger
[2017/06/30 15:27:21][DEBUG](ENTER) function: foo
[2017/06/30 15:27:21][DEBUG](foo) DEBUG message
[2017/06/30 15:27:21][INFO](foo) INFO message
echo message
[2017/06/30 15:27:21][WARN](foo) WARN message
[2017/06/30 15:27:21][ERROR](foo) ERROR message
[2017/06/30 15:27:21][DEBUG](EXIT) function: foo
[2017/06/30 15:27:21][DEBUG](EXIT) script: logger
```
