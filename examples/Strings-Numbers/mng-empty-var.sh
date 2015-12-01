#!/usr/bin/env bash

# Expansions to manage empty variables
# Expansions are hand for handling missing positional parameters and assigning default values to parameters.
#   
#   Example: ${parameter:-word}
#   
#   If parameter is unset (does not exist or empty), set the parameter to the value of word.
foo=
echo "foo="
echo '-----------'
echo 'echo ${foo:-"substitute value if unset"}'
echo ${foo:-"substitute value if unset"}
echo '-----------'
echo 'echo $foo'
echo $foo
foo=bar
echo '-----------'
echo "foo=bar"
echo 'echo ${foo:-"substitute value if unset"}'
echo ${foo:-"substitute value if unset"}
echo '-----------'
echo 'echo $foo'
echo $foo


# Using equal sign instead of a dash
# 
#   Example: ${parameter:=word}
#   
#   If parameter is unset or empty, results in the value of word. 
#   If parameter is not empty then it will result in the value of parameter.
cat << EOF

 Using equal sign instead of a dash
 
   Example: ${parameter:=word}
   
   If parameter is unset or empty, results in the value of word. 
   If parameter is not empty then it will result in the value of parameter.
EOF
foo=
echo "foo="
echo '----------'
echo ${foo:="substitute value if unset"}
echo 'echo ${foo:="substitute value if unset"}'
echo '----------'
echo 'echo $foo'
echo $foo
echo '----------'
foo=bar
echo "foo=bar"
echo '----------'
echo 'echo ${foo:="substitute value if unset"}'
echo ${foo:="substitute value if unset"}
echo '----------'
echo 'echo $foo'
echo $foo
echo '----------'


# Question Mark
#   ${parameter:?word}
#   if unset or empty, the script will exit with an error. The contents of word
#   is send to standard error.

echo '------------------------------'
echo 'Question Mark'
echo '------------------------------'
echo '${parameter:?word}'
echo 'if unset or empty, the script will exit with an error. The contents of word'
echo 'is send to standard error.'
echo '------------------------------'
echo 'foo='
foo=