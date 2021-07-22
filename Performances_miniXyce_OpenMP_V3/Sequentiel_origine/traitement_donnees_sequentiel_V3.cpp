
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cmath>


#define NB_PROC 1
#define NB_REP 100


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

  while(valeurs.size() != NB_PROC*NB_REP)
  {
    flux >> val_string;
    flux >> val_string;
    val = std::stod(val_string);
    valeurs.push_back(val);
  }



  // ----- Traitement des données récupérées -----
  std::vector<double> moyennes(NB_PROC, 0.0), ecarts_types(NB_PROC, 0.0);

  // Moyennes :
  for(int i = 0; i<NB_PROC; i++)
  {
    for(int j = 0; j<1; j++)
    {
      for(int k = 0; k<NB_REP; k++)
      {
        moyennes[i+j] += valeurs[i*NB_REP + j + k];
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
    for(int j = 0; j<1; j++)
    {
      for(int k = 0; k<NB_REP; k++)
      {
        ecarts_types[i+j] += (valeurs[i*NB_REP + j + k] - moyennes[i+j]) * (valeurs[i*NB_REP + j + k] - moyennes[i+j]);
      }
    }
  }

  for(auto& v : ecarts_types)
  {
    v = v/(double)NB_REP;
    v = std::sqrt(v);
  }

  flux.close();



  // ------- Stockage des résultats dans un fichier -------
  std::string str;
  std::string dat = ".dat";
  for(int p = 0; p<NB_PROC; p++)
  {
    str = "Traitement_donnees_thread" + std::to_string(p+1) + dat;
    std::ofstream flux_sortie(str);
    if(!flux_sortie)
    {
      std::cerr << "Erreur avec le fichier de sortie" << std::endl;
      return 1;
    }

    flux_sortie << "#\tMesure\tTemps_moyen\tEcart_type" << std::endl;
    flux_sortie << "Transient calc\t" << moyennes[p] << "\t" << ecarts_types[p] << std::endl;

    flux_sortie.close();
  }



  // ------- Affichage résultats -------
  std::cout << std::endl << "=========== Traitement des données ============" << std::endl << std::endl;
  for(int p = 0; p<NB_PROC; p++)
  {
    std::cout << "* Moyennes/écart-types pour la " << p+1 << "-ième taille de communicateur :" << std::endl;
    std::cout << "\t- Transient calc : \t" << moyennes[p] << " / " << ecarts_types[p] << std::endl;
  }
  std::cout << std::endl << "=========== Fin de traitement des données ===========" << std::endl << std::endl;


  return 0;
}
