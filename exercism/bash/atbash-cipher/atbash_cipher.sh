#!/usr/bin/env bash

atbash_cipher() {

    local mode="$1"
    local args="$2"
    
    args=$(echo "$args" | tr '[:upper:]' '[:lower:]')
    
    local alphabet=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')
    local alphabet_length="${#alphabet[@]}"
    local result=""

    if [[ -z "$args" ]]; then
        echo "Error"
        return
    fi

    if [[ "$mode" == "decode" ]]; then
        args="${args// /}"
    fi

    for (( i=0; i<${#args}; i++ )); do
        local first_char="${args:i:1}"
        if [[ "${first_char}" =~ [0-9] ]]; then
            result+="${first_char}"
        elif [[ "${first_char}" =~ [a-z] ]]; then
            local position=-1
            for (( j=0; j<alphabet_length; j++ )); do
                if [[ "${alphabet[j]}" == "$first_char" ]]; then
                    position=$j
                    break
                fi
            done

            if [[ $position -ge 0 ]]; then
                local back_position=$((alphabet_length - position - 1))
                result+="${alphabet[$back_position]}"
            fi
        fi
    done

    if [[ "$mode" == "encode" ]]; then
        local real_result=""
        for (( i=0; i<${#result}; i++ )); do
            if (( i > 0 && i % 5 == 0 )); then
                real_result+=" "
            fi
            real_result+="${result:i:1}"
        done
        echo "$real_result"
    else
        echo "$result"
    fi
}




main () {
    atbash_cipher "$@"
}


main "$@"