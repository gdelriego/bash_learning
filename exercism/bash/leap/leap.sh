#!/usr/bin/env bash

leap(){
    local arg="$@"
    local arg_number=$#
    if [[ -z "${arg}"  || "${arg}" =~ [a-z] || "${arg}" =~ ^-?[0-9]*\.[0-9]+$ || ${arg_number} > 1 ]]; then
        echo "Usage: leap.sh <year>"
        exit 1
    fi

    if (( arg%4 == 0 )); then
        if (( arg%100 == 0 )); then
            if (( arg%400 == 0 )); then
                echo true
                exit 0
            else
                echo false
                exit 0
            fi
        else
            echo true
            exit 0
        fi
    else
        echo false
        exit 0
    fi
    
}

main () {
    leap "$@"
}

main "$@"

