#! /bin/bash

# In case someone wanted to know how I split up the original file, it is only
# one command really.

# Script takes an input file represented by the full text file of weapon stats
# and splits them into a bunch of smaller files with the file extentsion that
# the main bash script can use to make an HTML Table.

# Script assumes that input file has a new weapon listed every 27 lines

# Usage: WeaponSplit.bash <inFile>

inFile=$1
usage='WeaponSplit.bash'

if [ -z inFile ]; then
    echo $usage
fi

split $inFile -l 27 --additional-suffix='.weapon'
