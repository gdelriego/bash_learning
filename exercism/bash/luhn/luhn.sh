#!/usr/bin/env bash

luhn() {
    local args="${*//[[:space:]]/}"
    local args_length=${#args}
    
    if [[ ${args_length} -lt 2 ]]; then
        echo false
        exit 0
    elif ! [[ "$args" =~ ^[0-9]+$ ]]; then
        echo false
        exit 0
    else
        local sum=0
        local double_digit=0

        for (( i=${args_length}-1; i>=0; i-- )); do
            local digit=${args:i:1}

            digit=$((digit))

            if [[ $(( (args_length - i) % 2 )) -eq 0 ]]; then
                double_digit=$((digit * 2))

                if [[ ${double_digit} -gt 9 ]]; then
                    double_digit=$((double_digit - 9))
                fi

                sum=$((sum + double_digit))
            else
                sum=$((sum + digit))
            fi
        done

        if [[ $((sum % 10)) -eq 0 ]]; then
            echo true
        else
            echo false
        fi
    fi
}

main() {
    luhn "$@"
}

main "$@"