#!/bin/bash

# Displays higlighted code in the console window.
# Requires less and source-highlight (should be in your distro's repo).

# Installation: copy-paste function below to your shell's init script (e.g. .bashrc)
# Usage: highlight-code example.py 

highlight-code() {
    source-highlight -fesc --failsafe -i $1 -o STDOUT | less -R
}
