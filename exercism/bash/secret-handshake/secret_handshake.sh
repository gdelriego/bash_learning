#!/usr/bin/env

secret_handshake() {
    local args="$1"
    local binary_value=$(echo "ibase=10;obase=2;$args" | bc)
    local padded_binary_value=$(printf "%05d" "$binary_value")
    local result=()

    for (( i=${#padded_binary_value}-1; i>=0; i-- )); do
        local current_number=${padded_binary_value:i:1}
        if [[ $current_number -eq 1 ]]; then
            local action_index=$(( ${#padded_binary_value} - i - 1 ))
            if [[ $action_index -eq 0 ]]; then
                result+=("wink")
            elif [[ $action_index -eq 1 ]]; then
                result+=("double blink")
            elif [[ $action_index -eq 2 ]]; then
                result+=("close your eyes")
            elif [[ $action_index -eq 3 ]]; then
                result+=("jump")
            elif [[ $action_index -eq 4 ]]; then
                local reversed_result=()
                for (( j=${#result[@]}-1; j>=0; j-- )); do
                    reversed_result+=("${result[j]}")
                done
                result=("${reversed_result[@]}")
            fi
        fi
    done

    (IFS=', '; echo "${result[*]}")
}

main () {
    secret_handshake "$@"
}

main "$@"

