#!/bin/bash
# input "location:page"
str="$1"
echo $str
IFS=':' read -ra strarr <<< "$str"
okular -p ${strarr[1]} ${strarr[0]} &>/dev/null &
