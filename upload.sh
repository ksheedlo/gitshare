#!/bin/bash

set -e

if [[ -z "$1" ]]
then
    cat <<EOF
Usage: $0 [FILE]
    FILE is the file to be uploaded
EOF
    exit 1
fi

filename=$(basename "$1")
cp "$1" ".data/$filename"
echo "- [$filename](https://raw.github.com/ksheedlo/gitshare/master/.data/$filename)" >>README.md
git add ".data/$filename"
git add README.md
git ci -m "Upload $filename"
git push

