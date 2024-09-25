#!/usr/bin/env bash

matching_brackets() {
    local args="$@"
    if [[ -z $args ]]; then
        echo true
        exit 0
    fi

    local stack=()
    
    local open_brackets="({["
    local close_brackets=")}]"
    
    for (( i=0; i<${#args}; i++ )); do
        local char=${args:i:1}
        if [[ $open_brackets == *"$char"* ]]; then
            stack+=("$char")
        elif [[ $close_brackets == *"$char"* ]]; then
            if [[ ${#stack[@]} -eq 0 ]] || ! ( [[ "$char" == ")" && "${stack[-1]}" == "(" ]] || \
                                               [[ "$char" == "}" && "${stack[-1]}" == "{" ]] || \
                                               [[ "$char" == "]" && "${stack[-1]}" == "[" ]] ); then
                echo false
                return
            else
                unset 'stack[-1]'
            fi
        fi
    done
    if [[ ${#stack[@]} -eq 0 ]]; then
        echo true
    else
        echo false
    fi
}


main () {
    matching_brackets "$@"
}
main "$@"
