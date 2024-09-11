#!/usr/bin/env bash
get_name(){
    if [ -z "$1" ]; then
        echo "you"
    else 
        echo "$1"
    fi
}
get_dialogue(){
    echo "One for $(get_name "$1"), one for me."
}
main () {
    get_dialogue "$1"
}

main "$@"

