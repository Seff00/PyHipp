#!/bin/bash

#channels with path
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs.txt

#channels without path
cut -d '/' -f 4 chs.txt > chs-only.txt

#successful mda channels
find . -name "firings.mda" | sort | cut -d "/" -f 3 > mda-chs.txt

#missing mda channels
comm -23 chs-only.txt mda-chs.txt > missing-mda-chs.txt

for channel in $(cat missing-mda-chs.txt); do
    # Use grep to find the path of each missing channel from chs.txt
    echo $channel
    grep $channel chs.txt >> missing-mda-paths.txt
done
cwd=`pwd`; for i in `cat missing-mda-paths.txt`; do echo $i; cd $i; sbatch /data/src/PyHipp/rplhighpass-sort-slurm.sh; cd $cwd; done

rm mda-chs.txt missing-mda-chs.txt missing-mda-paths.txt
