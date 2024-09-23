#!/usr/bin/env bash

resistor_color_duo(){
    declare -A colors

    colors["black"]=0
    colors["brown"]=1
    colors["red"]=2
    colors["orange"]=3
    colors["yellow"]=4
    colors["green"]=5
    colors["blue"]=6
    colors["violet"]=7
    colors["grey"]=8
    colors["white"]=9

    local first_arg="$1"
    local second_arg="$2"
    local first_value="${colors["${first_arg}"]}"
    local second_value="${colors["${second_arg}"]}"
    local result=""

    if [[ -z "${first_value}" ]]; then
        echo "invalid color"
        exit 1
    elif [[ -z "${second_value}" ]]; then
        echo "invalid color"
        exit 1
    fi
    
    if [[ "${first_value}" -eq "0" ]]; then
        result="${second_value}"
    else
        result="${first_value}${second_value}"
    fi
    echo "${result}"
}

main () {
  resistor_color_duo "$@"
}

main "$@"

