#!/usr/bin/env bash

# ref:  https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays

array=(1 2 abc)
echo $array

allThreads=(1 2 4)
echo $allThreads # echo only the first item
echo $allThreads[2] # print an item doesn't work. Prints 1[2]
echo ${allThreads[2]} # works. prints 4
echo ${#allThreads[@]} # size of aaray. print 3

# Get a slice of an array
new=${allThreads[@]:1:2}
echo here
for value in ${new[@]}; do
  echo $value
done
echo here end


# Loop through the values of the array
# ${allThreads[@]} represents all the elements in our array
for value in ${allThreads[@]}; do
  echo $value
done
### 1
### 2
### 4

# Loop throough the array by index
# ${!allThreads[$index] gets the index of the array
for index in ${!allThreads[@]}; do
  echo index: $index value: ${allThreads[$index]}
done
### index: 0 value: 1
### index: 1 value: 2
### index: 2 value: 4

# Append
allThreads+=(8 16)
for value in ${allThreads[@]}; do
  echo $value
done
### 1
### 2
### 4
### 8
### 16

# overwrite an item
allThreads[3]=999 # note that there can't be whitespaces
echo ${allThreads[3]} # prints out 999