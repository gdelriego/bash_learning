#!/usr/bin/env bash

proverb() {
    local args="$@"
    if [[ -z $args ]]; then
        echo ""
    else
        local args_list=("$@")
        local args_length=${#args_list[@]}

        if  [[ $args_length -eq 1 ]]; then
            echo "And all for the want of a ${args_list[0]}."
            exit
        else
            for (( i=0; i<$args_length; i++ )); do
                local character="${args_list[i]}"
                local next_character="${args_list[i+1]}"
                
                if [[ $next_character != "" ]]; then
                    echo "For want of a $character the $next_character was lost."
                fi
            done
            echo "And all for the want of a ${args_list[0]}."
        fi
    fi
}

main () {
    proverb "$@"
}
main "$@"


