#!/usr/bin/env bash

echo Hello World

# tutorial 1: https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
# tutorial 2: https://stackoverflow.com/a/16496491
# ref: https://docs.oracle.com/cd/E19253-01/816-5165/getopts-1/index.html
#
# Each time it is invoked, the getopts utility
# * places the value of the next option in the shell variable specified (opt in the example)
# by the name operand and the index of the next argument to be processed in the shell variable OPTIND.
# Whenever the shell is invoked, OPTIND is initialized to 1.
#
# The leading `:` in the opstring:
# *  if the first character in optstring is a colon (:, the shell variable OPTARG is set to the option character found,
#    but no output is written to standard error
# *  otherwise, the shell variable OPTARG is unset and a diagnostic message is written to standard error
while getopts "t:m:" opt; do
  case ${opt} in
  t)
    target=$OPTARG
    ;;
  m)
    module=$OPTARG
    ;;
  \?)
    echo "Invalid option: $OPTARG" 1>&2
    ;;
  :)
    echo "Invalid option: $OPTARG requires an argument" 1>&2
    ;;
  esac
done

echo target is $target
echo module is $module

# OPTIND is the index of the
echo $OPTIND
echo $((OPTIND - 1))

shift $((OPTIND - 1))

#for value in ${*}; do
#  echo $value
#done

argument=$*
echo argument is $argument

### ╰─ ./getopt.sh -t 3 -m 10 23
### Hello World
### target is 3
### module is 10
### 5
### 4
### argument is 23



