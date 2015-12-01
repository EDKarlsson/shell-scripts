#!/usr/bin/env bash

# Tools for navigating the terminal.
current-path=
get-pwd () {
    echo "Current in $PWD"
    current-path=$PWD
}