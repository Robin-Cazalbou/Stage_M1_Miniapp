#!/bin/bash

rm -f Resultats_scalabilite_forte_miniXyce.dat

for p in $(seq 1 1 4)
do
    for i in $(seq 1 1 10000)
    do
        mpirun -np ${p} miniXyce.x -c Circuits_miniXyce/cir1.net | grep -e "Parameter_parsing_time" -e "Netlist_parsing_time" -e "Matrix_setup_time" -e "DCOP_calculation_time" -e "Transient_calculation_time" -e "I/O File Time" -e "Total Simulation Time" >> Resultats_scalabilite_forte_miniXyce.dat
        rm -f *.yaml
    done
    echo "Taille communicateur terminée"
done
