#!/usr/bin/env bash

# Declare and assign
declare -A assArray1
assArray1[fruit]=Mango
assArray1[bird]=Cockatail
assArray1[flower]=Rose
assArray1[animal]=Tiger

# Print all values
echo ${assArray1[@]}  # Rose Mango Tiger Cockatail

# Another way of initialization
declare -A assArray2=([aa]=bb [ccc]=3)
echo ${assArray2[@]}  # 3 bb   Note that the order is not guaranteed

# Add new item
assArray2[kkk]=mmm
echo ${assArray2[@]}  # mmm 3 bb  

# Loop through key:value
# flower: Rose
# fruit: Mango
# animal: Tiger
# bird: Cockatail
for key in ${!assArray1[@]}; do
  echo $key: ${assArray1[$key]}
done

# Unset
# flower: Rose
# animal: Tiger
# bird: Cockatail
unset assArray1[fruit] # note that there's no ${}
for key in ${!assArray1[@]}; do
  echo $key: ${assArray1[$key]}
done



