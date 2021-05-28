#!/bin/bash

rm -f Resultats_miniXyce_sequentiel.dat

for i in $(seq 1 1 1000)
do
  miniXyce.x -c Circuits_miniXyce/cir1.net | grep -e "Parameter_parsing_time" -e "Netlist_parsing_time" -e "Matrix_setup_time" -e "DCOP_calculation_time" -e "Transient_calculation_time" -e "I/O File Time" -e "Total Simulation Time" >> Resultats_miniXyce_sequentiel.dat
  rm -f *.yaml
done
echo "Mesures terminées"
