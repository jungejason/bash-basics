#!/bin/bash

# this is good example:
# note that the `function` keyword is optional
usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

# The leading `:` in the opstring makes the invalid option to go to the `*` switch case
while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))
argument=$*

# Have to check the parameters as getopts doesn't have a way to force parameter, and the next parameter
# can be mistaken as the value of the previous option.
if [ -z "${s}" ] || [ -z "${p}" ]; then
    usage
fi

echo "s = ${s}"
echo "p = ${p}"
echo "argument = ${argument}"

### ╰─ ./getopt-good.sh
### Usage: ./getopt-good.sh [-s <45|90>] [-p <string>]
### ╭─ ~/a/apt-api-plus  I   pull/1820/APIP-812_script_for_heroku→origin/APIP-812_script 1 ↵  10130  17:42:53
### ╰─ ./getopt-good.sh -s 45 -m
### Usage: ./getopt-good.sh [-s <45|90>] [-p <string>]
### ╭─ ~/a/apt-api-plus  I   pull/1820/APIP-812_script_for_heroku→origin/APIP-812_script 1 ↵  10131  17:43:01
### ╰─ ./getopt-good.sh -s 45 -m 3
### Usage: ./getopt-good.sh [-s <45|90>] [-p <string>]
### ╭─ ~/a/apt-api-plus  I   pull/1820/APIP-812_script_for_heroku→origin/APIP-812_script 1 ↵  10132  17:43:05
### ╰─ ./getopt-good.sh -s 45 -p
### Usage: ./getopt-good.sh [-s <45|90>] [-p <string>]
### ╭─ ~/a/apt-api-plus  I   pull/1820/APIP-812_script_for_heroku→origin/APIP-812_script 1 ↵  10133  17:43:08
### ╰─ ./getopt-good.sh -s 45 -p 3
### s = 45
### p = 3
### argument =
### ╭─ ~/a/apt-api-plus  I   pull/1820/APIP-812_script_for_heroku→origin/APIP-812_script_f ✔  10134  17:43:10
### ╰─ ./getopt-good.sh -s 45 -p 3 88
### s = 45
### p = 3
### argument = 88