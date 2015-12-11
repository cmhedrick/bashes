#!/bin/bash

# while loop keeps the prompt running
# as long as filefind is not EXIT it will continue
while [ "$filefind" != "EXIT" ]; do
    # give instructions
    echo "Enter file name to find followed by [ENTER]:"
    echo -e "Or type EXIT followed by [ENTER] to quit \n"
    # read promps for user input
    read filefind
    # if statement to catch EXIT before being looked for as file
    if [ "$filefind" == "EXIT" ]
        then
            break
    fi
    # path to file is stored in found using the find command
    found=$(find /home -iname "$filefind")
    if [ $found ]
        then
            # when the file is found it decided the type and stores it
            filetype=$(file -b "$found")
            # echo path to file and it's filetype
            echo "The File Found: $filefind is a $filetype"
        else
            # if file not found return error message
            echo "File Not Found!"
    fi
done
