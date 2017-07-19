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
    - [Output](#output)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)

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

### Output

(If GNU-date referenced) It will print:

```
[2017/07/19 13:10:54.539][DEBUG](ENTER) script: ./test/logger.sh
[2017/07/19 13:10:54.547][DEBUG](ENTER) function: foo
[2017/07/19 13:10:54.555][DEBUG](foo) DEBUG message
[2017/07/19 13:10:54.562][INFO](foo) INFO message
echo message
[2017/07/19 13:10:54.569][WARN](foo) WARN message
[2017/07/19 13:10:54.575][ERROR](foo) ERROR message
[2017/07/19 13:10:54.582][DEBUG](EXIT) function: foo
[2017/07/19 13:10:54.588][DEBUG](EXIT) script: ./test/logger.sh
```

(If Mac-date referenced) It will print:

```
[2017/07/19 13:11:14.3N][DEBUG](ENTER) script: ./test/logger.sh
[2017/07/19 13:11:14.3N][DEBUG](ENTER) function: foo
[2017/07/19 13:11:14.3N][DEBUG](foo) DEBUG message
[2017/07/19 13:11:14.3N][INFO](foo) INFO message
echo message
[2017/07/19 13:11:14.3N][WARN](foo) WARN message
[2017/07/19 13:11:14.3N][ERROR](foo) ERROR message
[2017/07/19 13:11:14.3N][DEBUG](EXIT) function: foo
[2017/07/19 13:11:14.3N][DEBUG](EXIT) script: ./test/logger.sh
```

So GNU-date is recommended.

## Versioning

The versioning follows the rules of SemVer 2.0.0.

**Attentions**: anything may have **BREAKING CHANGES** at **ANY TIME** when major version is zero (0.y.z), which is for initial development and the public API should be considered unstable.

For more information on SemVer, please visit http://semver.org/.


## Copyright and License

Copyright (c) 2017 ADoyle. The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
