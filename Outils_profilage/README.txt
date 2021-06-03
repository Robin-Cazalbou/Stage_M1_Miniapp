Pour profiler miniXyce :
* Compiler miniXyce.x en séquentiel ou parallèle, puis l'ajouter au PATH : export PATH=$PATH:$PWD
* Lancer run_profil.sh avec les bons paramètres : 
./run_profil.sh circuit nbrep nbproc s_p proc_base_step
avec :
    - circuit : le fichier .net contenant le circuit miniXyce à étudier
    - nbrep : le nombre de répétitions à effectuer sur les mesures
    - nbproc : le nombre total de tailles de communicateurs distinctes à mesurer
    - s_p : soit s (séquentiel), soit p (parallèle). ATTENTION : il faut avoir la bonne version compilée de miniXyce.x, sinon il y aura des mesures en trop (et donc les moyennes sont faussées)
    - proc_base_step : base du pas (step) entre deux tailles successives de communicateur

Exemple :
    ./run_profil.sh Circuits/cirRLC_100.net 10000 8 p 1
    lance les mesures sur 10000 répétitions, sur les tailles 1, 2, 3, 4, 5, 6, 7 et 8 (pas=1)

    ./run_profil.sh Circuits/cirRLC_100.net 10000 4 p 2
    lance les mesures sur les tailles 1, 2, 4 et 8
    ATTENTION : ./run_profil.sh Circuits/cirRLC_100.net 10000 8 p 2
    va lancer les mesures sur 1, 2, 4, 8, 16, 32, 64, 128 (8 tailles différentes au total)

    ./run_profil.sh Circuits/cirRLC_100.net 10000 1 s 1
    lance uniquement en séquentiel (le dernier 1 est obligatoire, mais une autre valeur entière positive aurait marché aussi, par contre ATTENTION : le 1 avant le s est obligatoire sinon le code ne se lancera pas)
