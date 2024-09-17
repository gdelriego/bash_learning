#!/usr/bin/env bash

grains(){
    local arg="$1"
    local result=1

    if [[ ${arg} == 1 ]]; then
        echo "${result}"
        exit 0
    elif [[ "${arg}" == "total" ]]; then
        result=$(echo "2^64 - 1" | bc)
        echo "${result}"
        exit 0
    elif [[ ${arg} -eq 0 || ${arg} -gt 64 || ${arg} -lt 0 ]]; then
        echo "Error: invalid input"
        exit 1
    else
        result=$(echo "2^($arg - 1)" | bc)
    fi

    echo "${result}"
}

main () {
    grains "$@"
}
main "$@"


