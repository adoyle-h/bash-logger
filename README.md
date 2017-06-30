# bash-logger

A simple bash logger utility

## Install

TODO: Available as a [bpkg](http://www.bpkg.io/)

```sh
bpkg install adoyle/shell-logger
```

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
