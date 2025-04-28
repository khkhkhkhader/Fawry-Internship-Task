#!/bin/bash

invert=0
show_line_numbers=0

if [[ "$1" == "--help" ]]; then
    echo "Usage: $0 [-v] [-n] <search_string> <filename>"
    exit 0
fi

while getopts "vn" opt; do
    case $opt in
        v) invert=1 ;;
        n) show_line_numbers=1 ;;
        \?) 
            echo "Usage: $0 [-v] [-n] <search_string> <filename>"
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

if [ $# -ne 2 ]; then
    echo "INVALID INPUT"
    echo "Usage: $0 [-v] [-n] <search_string> <filename>"
    exit 1
fi

search="$1"
file="$2"

if [ ! -f "$file" ] || [ ! -r "$file" ]; then
    echo "Error: File '$file' does not exist or is not readable."
    exit 1
fi

grep_options="-i"

if [ "$invert" -eq 1 ]; then
    grep_options="$grep_options -v"
fi

if [ "$show_line_numbers" -eq 1 ]; then
    grep_options="$grep_options -n"
fi

grep $grep_options "$search" "$file"

