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
    if [[ $(id -u) -eq 0 ]]; then
        #statements
        cat << EOF
                    <h2>Home Space Utilization (All Users)</h2>
                    <pre>$(du -sh /home/*)</pre>
EOF
    else
        cat << EOF
                    <h2>Home Space Utilization ($USER)</h2>
                    <pre>$(du -sh $HOME)</pre>
EOF
    fi
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
