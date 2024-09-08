#!/bin/bash

cut -d '/' -f 4 chs.txt > chs-only.txt

find . -name "firings.mda" | sort | cut -d "/" -f 3 > mda-chs.txt

comm -23 chs-only.txt mda-chs.txt > missing-mda-chs.txt

for channel in $(cat missing-mda-chs.txt); do
    # Use grep to find the path of each missing channel from chs.txt
    echo $channel
    grep $channel chs.txt >> missing-mda-paths.txt
done
