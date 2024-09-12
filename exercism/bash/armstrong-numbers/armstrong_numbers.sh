#!/usr/bin/env bash
 
is_armstrong(){
    local arg=$1
    local length=${#arg}
    local digit=0
    local sum=0
    local res=false
    
    for (( i=0; i<${length}; i++ )); do
        digit=${arg:i:1}
        digit=$(echo "$digit^$length" | bc)
        sum=$((sum + digit))
    done

    if (( sum == arg )); then
        res=true
    else
        res=false
    fi
    
    echo "${res}"
}

main () {
    is_armstrong "$@"
}


main "$@"


