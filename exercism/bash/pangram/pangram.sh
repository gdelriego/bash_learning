#!/usr/bin/env bash

pangram(){
    local alphabet=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')
    local args="${1,,}"
    local pangram=()
    local is_pangram=false


    if [[ -z "${args}" ]]; then
        echo "${is_pangram}"
        return
    fi 

    for (( i=0; i<${#args}; i++ )); do
        local char=${args:i:1}

        if [[ "$char" =~ [a-z] ]]; then
            if [[ ! " ${pangram[@]} " =~ " ${char} " ]]; then
                pangram+=("${char}")
            fi
        fi
    done

    if [[ ${#pangram[@]} -eq ${#alphabet[@]} ]]; then
        is_pangram=true
    fi

    echo "${is_pangram}"
}

main () {
    pangram "$@"
}
main "$@"

