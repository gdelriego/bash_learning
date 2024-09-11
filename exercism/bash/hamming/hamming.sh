#!/usr/bin/env bash

hamming_distance(){
    local strand_1="$1"
    local strand_2="$2"
    local distance=0

    if [[ $# -eq 0 ]]; then
        echo "Usage: hamming.sh <string1> <string2>"
        return 1
    elif [[ $# -eq 1 ]]; then
        echo "Usage: hamming.sh <string1> <string2>"
        return 1
    fi


    if (( ${#strand_1} == ${#strand_2} )); then
        for (( i=0; i<${#strand_1}; i++ )); do
            if [[ "${strand_1:i:1}" != "${strand_2:i:1}" ]]; then
                ((distance++))
            fi
        done
    else
        echo "strands must be of equal length"
        return 1
    fi
    
    echo $distance
}

main () {
  hamming_distance "$@"
}

main "$@"

