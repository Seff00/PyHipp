#!/bin/bash

echo
echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="

echo "Start Times"
find . -name "rplpl-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; head -n 1 {}'
echo
find . -name "rs1-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; head -n 1 {}'
echo
find . -name "rs2-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; head -n 1 {}'
echo
find . -name "rs3-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; head -n 1 {}'
echo
find . -name "rs4-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; head -n 1 {}'

echo "End Times"
find . -name "rplpl-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; tail -n 5 {}'
echo
find . -name "rs1-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; tail -n 5 {}'
echo
find . -name "rs2-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; tail -n 5 {}'
echo
find . -name "rs3-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; tail -n 5 {}'
echo
find . -name "rs4-slurm*.out" | xargs -I {} sh -c 'echo -e "==> $(basename {}) <=="; tail -n 5 {}'


echo "#==========================================================="

