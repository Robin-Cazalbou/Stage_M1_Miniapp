#!/bin/bash

for i in $(seq 1 1 1000)
do
    ./miniXyce.x -c ../cirRLC1000.net --pf ../params.txt | grep -e "Transient_calculation_time" -e "I/O File Time" >> Mesures_sequentiel.dat
    rm -f *.yaml last_used_params.txt *.prn
done
echo "Mesures terminées. Début du traitement des mesures"
./traitement_donnees_mesures_sequentiel.exe Mesures_sequentiel.dat
