#!/bin/bash

:'
create a script which will pirnt a random word. There is a file containing
list of words on system
Hint: Piping of linux will helpful
'

:'
steps:
1. read a file
2. print a random word
3. how do i order by bash script to order only one word??
'

# this will print the number of words lines and charactes in the given text file
lines=$( wc -mwl test.txt )

echo $lines

#use cat command to read the file and print numnbers to the line
#then we use these numbers to print a random number

# cat command is used to print the contents of the file
numbers=$( cat -n test.txt )
echo $numbers

:'
pass a number through command line a print the words that has the number of characters
'

:'
let use length of a character'
