#!/usr/bin/env bash

darts(){
    local x="$1"
    local y="$2"
    local sum=$(echo "$x^2 + $y^2" | bc)
    local distance=$(echo "scale=4; sqrt($sum)" | bc)
    if [[ -z $x || -z $y || $x =~ [a-z] || $y =~ [a-z] ]]; then
        echo "Error"
        exit 1
    fi

    if (( $(echo "$distance <= 1" | bc -l) )); then
        echo 10
    elif (( $(echo "$distance > 1 && $distance <= 5" | bc -l) )); then
        echo 5
    elif (( $(echo "$distance > 5 && $distance <= 10" | bc -l) )); then
        echo 1
    else
        echo 0
    fi
}

main () {
    darts "$@"
}


main "$@"


