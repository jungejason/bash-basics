#!/usr/bin/env bash

# read a b c
# echo $a
# echo $b
# echo $c

# echo $*

# String append and concat
command="echo "
for item in ${*}; do
  command+="   -"
  command+=$item
  command+=" "
done

echo command is: ${command} # command is: echo -a -bb -cc -ddd

command2="echo22 "
for item in ${*}; do
  tmp="     -"
  command2+="${tmp}${item}"
done
echo command2 is: ${command2} # command2 is: echo22 -a -bb -cc -ddd

# Concat an array of string with whitespace
declare arr=(jjj kkk lll)
echo $arr  # jjj
joined=${arr[@]}  # a hack to join the array
echo $joined # jjj kkk lll    