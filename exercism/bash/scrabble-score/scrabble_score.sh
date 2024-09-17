#!/usr/bin/env bash

scrabble_score() {
    local one_point=("A" "E" "I" "O" "U" "L" "N" "R" "S" "T")
    local two_point=("D" "G")
    local three_point=("B" "C" "M" "P")
    local four_point=("F" "H" "V" "W" "Y")
    local five_point=("K")
    local eight_point=("J" "X")
    local ten_point=("Q" "Z")

    local args=$(echo "$1" | tr '[:lower:]' '[:upper:]')  # Convertir a mayúsculas
    local score=0
    for (( i=0; i<${#args}; i++ )); do
        local char="${args:i:1}"

        if [[ " ${one_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 1))
        elif [[ " ${two_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 2))
        elif [[ " ${three_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 3))
        elif [[ " ${four_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 4))
        elif [[ " ${five_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 5))
        elif [[ " ${eight_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 8))
        elif [[ " ${ten_point[@]} " =~ " ${char} " ]]; then
            score=$((score + 10))
        fi
    done

    echo "${score}"
}

main () {
    scrabble_score "$@"
}

main "$@"

