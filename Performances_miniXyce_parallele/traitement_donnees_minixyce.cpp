
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cmath>


#define NB_PROC 4
#define NB_REP 1000


// Ce code extrait les données sorties par miniXyce après application du script
// "run_scalabilite_forte_minixyce.sh" (7 lignes de mesures de temps pour un
// processus et une répétition) pour NB_PROC processus, chacun étant lancé
// NB_REP fois

int main(int argc, char **argv)
{
  // Vérification que le fichier est passé en argument
  if(argc != 2)
  {
    std::cerr << "Mauvaise utilisation : " << argv[0] << " fichier" << std::endl;
    return 1;
  }

  // Ouverture flux vers le fichier
  std::ifstream flux(argv[1]);
  if(!flux)
  {
    std::cerr << "Fichier non ouvert" << std::endl;
    return 1;
  }

  // ----- Parcours fichier, récupération valeur, stockage vecteur -----
  std::string val_string;
  double val;
  std::vector<double> valeurs;

  while(valeurs.size() != 7*NB_PROC*NB_REP)
  {
    // Boucle sur les 5 premières lignes d'un paquet de 7
    for(int i = 0; i<5; i++)
    {
      flux >> val_string;
      flux >> val_string;
      val = std::stod(val_string);
      valeurs.push_back(val);
    }
    // Boucle à part à cause des espaces dans "I/O File Time" et "Total Simulation Time"
    for(int i = 0; i<2; i++)
    {
      flux >> val_string;
      flux >> val_string;
      flux >> val_string;
      flux >> val_string;
      val = std::stod(val_string);
      valeurs.push_back(val);
    }
  }



  // ----- Traitement des données récupérées -----
  std::vector<double> moyennes(7*NB_PROC, 0.0), ecarts_types(7*NB_PROC, 0.0);

  // Moyennes :
  for(int i = 0; i<NB_PROC; i++)
  {
    for(int j = 0; j<7; j++)
    {
      for(int k = 0; k<NB_REP; k++)
      {
        moyennes[i*7+j] += valeurs[i*7*NB_REP + j + k*7];
      }
    }
  }

  for(auto& v : moyennes)
  {
    v = v/(double)NB_REP;
  }

  // Ecarts-types :
  for(int i = 0; i<NB_PROC; i++)
  {
    for(int j = 0; j<7; j++)
    {
      for(int k = 0; k<NB_REP; k++)
      {
        ecarts_types[i*7+j] += (valeurs[i*7*NB_REP + j + k*7] - moyennes[i*7+j]) * (valeurs[i*7*NB_REP + j + k*7] - moyennes[i*7+j]);
      }
    }
  }

  for(auto& v : ecarts_types)
  {
    v = v/(double)NB_REP;
    v = std::sqrt(v);
  }


  // ------- Affichage résultats -------
  std::cout << std::endl << "=========== Traitement des données ============" << std::endl << std::endl;
  for(int p = 0; p<NB_PROC; p++)
  {
    std::cout << "* Moyennes/écart-types pour la " << p+1 << "-ième taille de communicateur :" << std::endl;
    std::cout << "\t- Parameter parsing : \t" << moyennes[7*p] << " / " << ecarts_types[7*p] << std::endl;
    std::cout << "\t- Netlist parsing : \t" << moyennes[7*p+1] << " / " << ecarts_types[7*p+1] << std::endl;
    std::cout << "\t- DCOP calculation : \t" << moyennes[7*p+2] << " / " << ecarts_types[7*p+2] << std::endl;
    std::cout << "\t- Matrix setup : \t" << moyennes[7*p+3] << " / " << ecarts_types[7*p+3] << std::endl;
    std::cout << "\t- Transient calc : \t" << moyennes[7*p+4] << " / " << ecarts_types[7*p+4] << std::endl;
    std::cout << "\t- I/O File : \t\t" << moyennes[7*p+5] << " / " << ecarts_types[7*p+5] << std::endl;
    std::cout << "\t- Total Simulation : \t" << moyennes[7*p+6] << " / " << ecarts_types[7*p+6] << std::endl << std::endl;
  }
  std::cout << "=========== Fin de traitement des données ===========" << std::endl << std::endl;


  return 0;
}
