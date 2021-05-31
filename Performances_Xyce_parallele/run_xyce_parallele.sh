#!/bin/bash

rm -f Resultats_Xyce_parallele.dat

for p in $(seq 1 1 4)
do
    for i in $(seq 1 1 10000)
    do
        mpirun -np ${p} Xyce Circuits_Xyce/cir1_xyce_CAZALBOU.net | grep -e "Problem read in" -e "DCOP time" -e "Transient Stepping time" -e "Total Simulation" -e "Total Elapsed" >> Resultats_Xyce_parallele.dat
    done
    echo "Taille communicateur terminée"
done
