#!/bin/bash

# Lists incomplete downloaded media files (e.g. mp4).
# Requires find and mediainfo (should be in your distro's repo).

# Installation: copy-paste function below to your shell's init script (e.g. .bashrc)
# Usage: find-incomplete-downloaded-videos [dir]

find-incomplete-downloaded-videos() {
    for name in `find $1 -type f`; do mediainfo $name | grep Truncated > /dev/null; test $? -eq 0 && echo $name; done
}
