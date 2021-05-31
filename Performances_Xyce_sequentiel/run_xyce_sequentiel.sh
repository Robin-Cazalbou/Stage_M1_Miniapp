#!/bin/bash

rm -f Resultats_Xyce_sequentiel.dat

for i in $(seq 1 1 10000)
do
  Xyce Circuits_Xyce/cir1_xyce_CAZALBOU.net | grep -e "Problem read in" -e "DCOP time" -e "Transient Stepping time" -e "Total Simulation" -e "Total Elapsed" >> Resultats_Xyce_sequentiel.dat
done
echo "Mesures terminées"
