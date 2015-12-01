#!/bin/bash

# Script for reading and parsing command line options.

usage () {
    echo "$PROGNAME: usage: $PROGNAME [-f file | -i]" 
    return
}

# Process Command Line Options

interactive=
filename=
select_option() {
    while [[ -n $1 ]]; do
        #statements
        case $1 in
                -f | --file) shift; 
                    echo "File Selected"; 
                    local filename=$1
                    ;;
                -i | --interactive) 
                    echo "Interactive Mode Selected"; 
                    local interacive=1
                    ;;
                -h | --help ) 
                    echo "Help Selected"; 
                    usage; 
                    exit;
                    ;;
                *)
                    echo "Exiting..."
                    usage >&2
                    exit 1
                    ;;
        esac
        shift
    done
}
# interactive mode
mode_interactive () {
    if [[ -n $interactive ]]; then
        #statements
        while true ; do
            #statements
                read -p "Enter name of output file: " filename
                if [[ -e $filename ]]; then
                    #statements
                    read -p "'$filename' exists. Overwrite? [y/n/q] > "
                    case $REPLY in
                        Y|y )   break ;;
                        Q|q ) echo "Program terminated."; exit ;;
                        *)      continue ;;
                    esac
                elif [[ -z $filename ]]; then
                    #statements
                    continue
                else
                    break
                fi
        done
    fi
}