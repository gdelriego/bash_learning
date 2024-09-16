#/usr/bin/env bash

bob(){
    local arg="${*//[[:space:]]/}"  
    local trimmed="${*}"
    local cleaned="${trimmed%"${trimmed##*[![:space:]]}"}"
    local last_char="${cleaned: -1}"

    if [[ -z "$arg" ]]; then
        echo "Fine. Be that way!"
    elif [[ "$last_char" == "?" && "$cleaned" =~ [[:upper:]] && ! "$cleaned" =~ [a-z] ]]; then
        echo "Calm down, I know what I'm doing!"
    elif [[ "$last_char" == "?" ]]; then
        echo "Sure."
    elif [[ "$cleaned" =~ [[:upper:]] && ! "$cleaned" =~ [a-z] ]]; then
        echo "Whoa, chill out!"
    else
        echo "Whatever."
    fi
}

main () {
  bob "$@"
}

main "$@"
