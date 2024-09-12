#!/usr/bin/env bash

get_acronym(){
    local sentence="$1"
    local acronym=""
    local should_pick_next=true


    for(( i=0; i<${#sentence}; i++)); do
        char=${sentence:i:1}
        if [[ "$char" =~ [A-Za-z] ]]; then
            if $should_pick_next; then
                acronym+=${char}
                should_pick_next=false
            fi
        elif [[ "$char" =~ [-\ \_] ]]; then
            should_pick_next=true
        fi
    done

    echo "${acronym^^}"
}

main () {
    get_acronym "$@"
}
main "$@"