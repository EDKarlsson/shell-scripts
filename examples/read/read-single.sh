#!/usr/bin/env bash

# read-single: read multiple values into default variable
 

echo '-----------------------------------'
echo 'echo -n "Enter one or more values > "'
echo 'read'
echo '-----------------------------------'
echo -n "Enter one or more values > "
read

echo '-----------------------------------'
echo 'echo "REPLY = $REPLY"'
echo '-----------------------------------'
echo "REPLY = '$REPLY'"


echo '-----------------------------------'
echo 'read-single: read multiple values into default variable using prompt.'
echo '-----------------------------------'

read -p "Enter one or more values > "

echo "REPLY = '$REPLY'"