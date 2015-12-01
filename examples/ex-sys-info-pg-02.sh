#!/bin/bash

# Program to output a system information page

TITLE="System Information Report $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

# _EOF_ means end of file,
cat << _EOF_
<HTML>
   <head>
      <title>$TITLE</title>
   </head>
   <body>
      <h1>$TITLE</h1>
      <p>$TIME_STAMP</p>
      $(report_uptime)
      $(report_disk_space)
      $(report_home_space)
   </body>
<HTML>
_EOF_
