#! /bin/bash

# "Author": MelBrooksKA
# Simple Bash program that takes a bunch of text files containing information
# on guns in Battlefield 1914 and converts them from text to text with html
# tags that put them in a neat table (very useful, shut up).

# Script assumes that each input file contains the File Extension ".weapon", is
# in a UNIX format (when you hit enter in UNIX it uses the character "\n" to
# tell the computer to go to the next line, MS-DOS and Windows use "\r\n", and
# this is important), are all in the same directory as this script, and
# organized in the same way as done in this redit post (where I got the idea)
# https://www.reddit.com/r/battlefield_one/comments/4qzj9x/battlefield_1_alpha_weapon_stats/

# Variables
rowTagOpen='<tr>'
rowTagClose='</tr>'
headTagOpen='<th>'
headTagClose='</th>'
infoTagOpen='<td>'
infoTagClose='</td>'
tableTagOpen='<table>'
tableTagClose='</table>'

# Here so that when I cut up the files later, the program only splits up text
# based on just the newline character and not any other kind of whitespace.
IFS=$'\n'

echo $tableTagOpen

echo '    '$rowTagOpen
for x in $(cat heads); do
    # I don't really know what sed does, I just looked up how to remove leading
    # and trailing whitespace in Bash and got sed as one of the best ones.
    # 
    clean=$(echo $x | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
    echo '        '"$headTagOpen""$clean""$headTagClose"
done
echo '    '$rowTagClose

for x in $(ls *.weapon); do
    echo '    '$rowTagOpen
    for y in $(cut $x -d'=' -f2); do
        clean=$(echo $y | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        echo '        '"$infoTagOpen""$clean""$infoTagClose"
    done
    echo '    '$rowTagClose
done
echo $tableTagClose
