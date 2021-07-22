#!/bin/bash

for i in $(seq 1 1 1000)
do
    ../miniXyce.x -c ../../cirRLC1000.net --pf ../../params.txt >> Mesures_omp_multithread.dat
done
./traitement_donnees_sequentiel_V3.exe Mesures_omp_multithread.dat
