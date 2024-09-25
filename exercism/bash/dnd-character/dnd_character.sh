#!/usr/bin/env bash

score_calc(){
    local scores=()
    for (( i=0; i<4; i++ )); do
        scores+=($(( RANDOM % 6 + 1 )))
    done

    sorted_scores=($(printf "%s\n" "${scores[@]}" | sort -nr))
    sum=$((sorted_scores[0] + sorted_scores[1] + sorted_scores[2]))
    echo $sum
}

constitution_modifier(){
    local constitution=$1
    local constitution_modifier=$(( (constitution - 10) / 2 ))

    if (( (constitution - 10) % 2 != 0 )) && (( constitution < 10 )); then
        constitution_modifier=$(( constitution_modifier - 1 ))
    fi

    echo $constitution_modifier
}

dnd_character(){
    local mode="$1"
    
    if [[ $mode == "modifier" ]]; then
        local constitution=$2
        echo "$(constitution_modifier "$constitution")"
    elif [[ $mode == "generate" ]]; then
        declare -A player
        player["strength"]=$(score_calc)
        player["dexterity"]=$(score_calc)
        player["constitution"]=$(score_calc)
        player["intelligence"]=$(score_calc)
        player["wisdom"]=$(score_calc)
        player["charisma"]=$(score_calc)
        
        local constitution_modifier_score=$(constitution_modifier "${player["constitution"]}")
        local hitpoints=$(( 10 + constitution_modifier_score ))
        player["hitpoints"]=$hitpoints
        
        for stat in "${!player[@]}"; do
            echo "$stat ${player[$stat]}"
        done
    fi
}

main () {
    dnd_character "$@"
}

main "$@"

