#!/usr/bin/env bash

# Command parameter shift
echo $# # number of parameters
echo $1 $2 $3 # positonal parameters
echo $* # all parameters
echo $0 # script name
### 3
### a b c
### a b c
### ./main.sh

for value in ${*}; do
  echo $value
done

## Double semicolon
answer=no
case $answer in
  yes) echo 'yay';;
  no) echo 'boo!';;
esac

## Function

function_foo () {
   echo "Parameter #1 is $1"
   echo "Parameter #2 is $2"
   echo "Parameter #3 is $3"
}

function_foo "aaa" ,  bb