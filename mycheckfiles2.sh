#!/bin/bash

echo
echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="

echo "Start Times"
find . -name "*-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; head -n 1 {}'

echo "End Times"
find . -name "*-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; tail -n 5 {}'

echo "#==========================================================="

