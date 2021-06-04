#!/bin/bash


# Vérification nombre de variables :
if [[ $# -ne 5 ]]; then
  echo "Mauvaise utilisation de $0 : $0 circuit nbrep nbproc s_p procstep"
  exit 1
fi

# Vérification que miniXyce.x est dans le PATH :
path_test=$(which miniXyce.x)
if ! [[ -x "$path_test" ]]; then
  echo 'Exécutable miniXyce.x non trouvé. Ajouter miniXyce.x au PATH depuis son répertoire : export PATH=$PATH:$PWD'
  exit 1
fi


# Variables :
fich_res='Resultats_profil_miniXyce_brut.dat'
fich_trai='Profil_miniXyce.dat'
trai_cpp='Traitement_profil_miniXyce'
circuit=$1
nbrep=$2
nbproc=$3
seq_par=$4
proc_base_step=$5

# Cas séquentiel ou parallèle ?
if [[ $seq_par = 's' ]]; then
  echo "MiniXyce en Séquentiel"
  command="miniXyce.x -c $circuit --pf params.txt"
  if [[ $nbproc != 1 ]]; then
    echo "ERREUR : vous lancez miniXyce.x en séquentiel avec nbproc = $nbproc > 1 !"
    exit 1
  fi
elif [[ $seq_par = 'p' ]]; then
  echo "MiniXyce en Parallèle"
else
  echo "Mauvaise utilisation de $0 : s_p = s (séquentiel) ou p (parallèle)"
  exit 1
fi


# Suppression des anciens fichiers de résultats et de traitement, s'il y en a
echo 'Suppression des anciens fichiers de résultats ...'
echo 'rm -f' "$fich_res $fich_trai"
rm -f $fich_res $fich_trai
echo 'Suppression terminée'


# Lancement mesures brutes
echo 'Lancement des mesures ...'
np=1
for proc in $(seq 1 1 $nbproc)
do
    # Mise à jour de la commande avec le bon nombre de processus pour MPI
    if [[ $seq_par = 'p' ]]; then
      if [[ $proc -eq 1 ]]; then
        command="mpirun -np $np miniXyce.x -c $circuit --pf params.txt"
      else
        (( np=$np+$(( $proc_base_step** ($proc -2) )) ))
        command="mpirun -np $np miniXyce.x -c $circuit --pf params.txt"
      fi
    fi

    for i in $(seq 1 1 $nbrep)
    do
        $command | grep -e "Parameter_parsing_time" -e "Netlist_parsing_time" -e "Matrix_setup_time" -e "DCOP_calculation_time" -e "Transient_calculation_time" -e "I/O File Time" -e "Total Simulation Time" >> $fich_res
        rm -f *.yaml
        if [[ $(( $i % 10 )) -eq 0 ]]; then
          echo "$i / $nbrep"
        fi
    done
    echo "Taille communicateur terminée"
done
echo 'Mesures terminées'


# Traitement des mesures brutes
echo 'Compilation code C++ de traitement ...'
g++ $trai_cpp.cpp -o $trai_cpp.exe
echo 'Compilation terminée'
echo 'Traitement des mesures brutes ...'
echo "./$trai_cpp.exe $fich_res $nbrep $nbproc"
./$trai_cpp.exe $fich_res $nbrep $nbproc
echo 'Traitement terminé'
