#!/usr/bin/env bash

declare -A arr1
arr1[fruit]=Mango
arr1[bird]=Cockatail

echo ${arr1[bird]}
echo ${arr1[fruit]}

echo "iterating arr1"
for key in "${!arr1[@]}"; do
  echo key: $key value: ${arr1[$key]}
done

declare -A arr2=([fruit]=Mango [bird]=Cocktail)

echo "iterating arr2"
for key in "${!arr2[@]}"; do
  echo key: $key value: ${arr2[$key]}
done