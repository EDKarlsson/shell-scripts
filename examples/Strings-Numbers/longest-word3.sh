#!/usr/bin/env bash

# Longest-word3 : find the longest string in a file

for index; do
    if [[ -r $index ]]; then
        max_word=
        max_len=
        for inner_index in $(strings $index); do
            len=${#inner_index}
            if (( len > max_len )); then
                max_len=$len
                max_word=$inner_index
            fi
        done
        echo "$index: '$max_word' ($max_len characters)"
    fi
    shift
done

