#!/usr/bin/env bash
#
# Arithmetic Evaluation and Expandsion
# Basic form of arithmetic operations on integers.
# 
#    $((expression))


echo '------------------------------------------------'
echo '               Number Bases'
echo '------------------------------------------------'
cat << EOF
    Notation       |    Description
    ---------------|--------------------------------------------------------
    Number         |    Numbers without notation are treated 
                   |    as decimal (base 10) integers.
    ---------------|--------------------------------------------------------
    0number        |    Arithmetic expression, numbers with leading zero are considered octal.
    ---------------|--------------------------------------------------------
    0xnumber       |    Hexadecimal notation
    ---------------|--------------------------------------------------------
    base#number    |    number is in base.
    ---------------|--------------------------------------------------------
EOF

echo 'echo $((0xff))'
echo $((0xff))

echo 'echo $((2#11111111))'
echo $((2#11111111))

echo '------------------------------------------------'
echo '              Uranary Operators'
echo '------------------------------------------------'
echo '+ and - are unary operators'
echo '------------------------------------------------'
echo '              Simple Arithmetic'

cat << EOF
    Operator       |    Description
    ---------------|--------------------------------------------------------
    +              |    Addition
    ---------------|--------------------------------------------------------
    -              |    Subtraction
    ---------------|--------------------------------------------------------
    *              |    Multiplication
    ---------------|--------------------------------------------------------
    /              |    Integer division.  
    ---------------|--------------------------------------------------------
    **             |    Exponentiation.  
    ---------------|--------------------------------------------------------
    %              |    Modulo (remainder).  
    ---------------|--------------------------------------------------------
EOF

echo 'echo $(( 5 / 2 ))'
echo $(( 5 / 2 ))

echo 'echo $(( 5 % 2 ))'
echo $(( 5 % 2 ))