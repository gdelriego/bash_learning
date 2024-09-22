#!/usr/bin/env bash

reverse_string(){
    local arg="$@"
    local arg_len=${#arg}
    local result=""

    for (( i=${arg_len}; i>=0; i--)){
        result+="${arg:i:1}"
    }
    echo "${result}"
}

main () {
    reverse_string "$@"
}

main "$@"


