#!/usr/bin/env bash

# sys_info_page: program to output a system information page

PROGNAME=$(basename $0)
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () { cat << EOF
            <h2>System Uptime</h2>
            <pre>$(uptime)</pre>
EOF
    return
}

report_disk_space () {
    cat << EOF
                <h2>Disk Space Utilization</h2>
                <pre>$(df -h)</pre>
EOF
    return
}

report_home_space () {

    local format="%8s%10s%10s\n"
    local i dir_list total_files total_dirs total_size user_name

    if [[ $(id -u) -eq 0 ]]; then
        #statements
        dir_list=/Users/*
        user_name="All Users"
    else
        dir_list=$HOME
        user_name=$USER
    fi

    echo "<h2>Home Space Utilization ($user_name)</h2>"

    for index in $dir_list; do

        total_files=$(find $index -type f | wc -l)
        total_dirs=$(find $index -type d | wc -l)
        total_size=$(du -sh $index | cut -f 1)
        echo "<h3>$index</h3>"
        echo "<pre>"
        printf "$format" "Dirs" "Files" "Size"
        printf "$format" "----" "-----" "----"
        printf "$format" $total_dirs $total_files $total_size
        echo "</pre>"
    done
    return
}


usage () {
    echo "$PROGNAME: usage: $PROGNAME [-f file | -i]"
    return
}


write_html_page () {
    cat << EOF
        <html>
            <head>
                <title>$TITLE</title>
            </head>
            <body>
                <h1>$TITLE</h1>
                <p>$TIME_STAMP</p>
                $(report_uptime)
                $(report_disk_space)
                $(report_uptime)
        </body>
        </html>
EOF
        return
}


# Process Command Line Options

interactive=
filename=

while [[ -n $1 ]]; do
    #statements
    case $1 in
            -f | --file)
                shift
                $filename=$1
                ;;
            -i | --interactive)
                interactive=1
                ;;
            -h | --help)
                usage
                exit
                ;;
            *)
                usage >&2
                exit 1
                ;;
    esac
    shift
done

# interactive mode
if [[ -n $interactive ]]; then
    #statements
    while true; do
        #statements
            read -p "Enter name of output file: " filename
            if [[ -e $filename ]]; then
                #statements
                read -p "'$filename' exists. Overwrite? [y/n/q] > "
                case $REPLY in
                    Y|y)
                        break
                        ;;
                    Q|q)
                        echo "Program terminated."
                        exit
                        ;;
                    *)
                        continue
                        ;;
                esac
            elif [[ -z $filename ]]; then
                continue
            else
                break
            fi
    done
fi

# ---------------------------------------------------------------
# Process File
# This tests the existance of a filename, if found then test if it is writable using 'touch'.
#   After being tested for being writable, it is test to see if it is a regular file.
#   These tests take care of the situations where an invalid pathname is given as input.
#   And if the file already exists.
# ---------------------------------------------------------------
# Test if pathname to file is correct
if [[ -n $filename ]]; then
    # Does file exist and is file writeable?
    if touch $filename && [[ -f $filename ]]; then
        write_html_page > $filename
    else
        echo "$PROGNAME: Cannot write file '$filename'" >&2
    fi
else
    write_html_page
fi
