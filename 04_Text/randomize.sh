#!/bin/bash

delay=${1:-0.1}

coords=()
pic=()

line_num=0
while IFS= read -r line
do
    pic+=("$line")

    for char_num in $(seq 0 $((${#line}-1)))
    do
        if [[ ${line:$char_num:1} != " " ]]
        then
            coords+=("$line_num.$char_num")
        fi
    done
    ((line_num++))
done

tput clear
for char_coords in $(shuf -e "${coords[@]}")
do
    line_num=$(echo ${char_coords} | cut -f 1 -d ".")
    char_num=$(echo ${char_coords} | cut -f 2 -d ".")
    char=${pic[$line_num]:$char_num:1}

    tput cup $line_num $char_num
    echo -ne $char

    sleep $delay
done

tput cup "$(tput lines)" 0
