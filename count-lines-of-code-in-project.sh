#!/bin/bash

# Counts all lines of code in project

# Location of project files (will be searched recursively):
PROJECT_PATH="/home/user/path/to/project"

# List of extensions of files that contain code:
FILE_EXTENSIONS="cpp h"

# If true, counts only non-empty lines:
NOT_EMPTY=true

find_command="find $PROJECT_PATH"
find_command+=" -type f"
first_ext=true
for ext in $FILE_EXTENSIONS
do
    if [ $first_ext != true ]
    then
        find_command+=" -o"
    fi
    find_command+=" -name '*.$ext'"
    first_ext=false
done

eval $find_command | (
    sum_lines=0
    while read -r file_path
    do
        echo -ne '\033[1K''\r'"Processing: `basename $file_path`"
        if [ $NOT_EMPTY = true ]
        then
            count=`grep -v -e '^$' "$file_path" | wc -l`
        else
            count=`cat "$file_path" | wc -l`
        fi
        sum_lines=`expr $sum_lines + $count`
    done
    echo -ne '\033[1K''\r'
    if [ $NOT_EMPTY = true ]
    then
        echo "Non-empty lines found: $sum_lines"
    else
        echo "Lines found: $sum_lines"
    fi
)
