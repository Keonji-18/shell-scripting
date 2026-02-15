#!/bin/bash

#Multiline comment

<< comment
we can  write any thing in place of comment ; 
only we have to define block
comment

# Variable
name="Suyash"

echo "Name is: $name, and date is $(Date)"
echo "we can write exectuable commands in script using dollar $ and () together"

# Taking user input
echo "Enter your name :"

read username

echo "Your name is $username"


# Using arguments
echo "Arguments are $0 -> filename $1 $2 and etc. are give in runtime"
