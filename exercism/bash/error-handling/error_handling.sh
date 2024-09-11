#!/usr/bin/env bash

get_error(){
    if [ $# -eq 1 ]; then
        echo "Hello, $1"
    else
        echo "Usage: error_handling.sh <person>"
        exit 1
    fi
}

main () {
  get_error "$@"
}

main "$@"

