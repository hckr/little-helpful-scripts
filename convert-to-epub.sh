#!/bin/bash

# Requires pandoc.

cd manuscript # directory with book chapters

TITLE="Title of the book"
AUTHOR="John Doe"
COVER="images/title_page.png"
OUTFILE="book.epub"

# where:
# Book.txt in subsequent lines contains names of files (e.q. Markdown formatted) that should make up the book

echo "$HEADER" | cat - `cat Book.txt` <<EOF | pandoc -o ../$OUTFILE --epub-cover-image=$COVER
% $TITLE
% $AUTHOR

EOF
