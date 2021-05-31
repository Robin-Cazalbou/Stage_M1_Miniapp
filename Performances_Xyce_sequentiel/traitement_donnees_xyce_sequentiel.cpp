
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cmath>


#define NB_PROC 1
#define NB_REP 10000


// Idem que le code de traitement des données pour miniXyce, mais adapté avec
// la sortie de Xyce

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
  std::string ligne, val_string;
  double val;
  std::vector<double> valeurs;
  std::size_t deb, fin;

  while(valeurs.size() != 5*NB_PROC*NB_REP) // 5 mesures de temps récupérées
  {
    // Récupère une ligne
    getline(flux, ligne);
    // Extraction du nombre dans cette ligne
    deb = ligne.find_first_of("0123456789"); // première apparition d'un chiffre
    fin = ligne.find_first_not_of("0123456789e-.", deb); // recherche fin du nombre
    val_string = ligne.substr(deb, fin-deb); // extraction

    // Transformation string en double, stockage vecteur
    val = std::stod(val_string);
    valeurs.push_back(val);
  }



  // ----- Traitement des données récupérées -----
  std::vector<double> moyennes(5*NB_PROC, 0.0), ecarts_types(5*NB_PROC, 0.0);

  // Moyennes :
  for(int i = 0; i<NB_PROC; i++)
  {
    for(int j = 0; j<5; j++)
    {
      for(int k = 0; k<NB_REP; k++)
      {
        moyennes[i*5+j] += valeurs[i*5*NB_REP + j + k*5];
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
    for(int j = 0; j<5; j++)
    {
      for(int k = 0; k<NB_REP; k++)
      {
        ecarts_types[i*5+j] += (valeurs[i*5*NB_REP + j + k*5] - moyennes[i*5+j]) * (valeurs[i*5*NB_REP + j + k*5] - moyennes[i*5+j]);
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
    str = "Traitement_donnees_proc" + std::to_string(p+1) + dat;
    std::ofstream flux_sortie(str);
    if(!flux_sortie)
    {
      std::cerr << "Erreur avec le fichier de sortie" << std::endl;
      return 1;
    }

    flux_sortie << "#\tMesure\tTemps_moyen\tEcart_type\t Pourcentage_temps_total" << std::endl;
    flux_sortie << "Problem set up\t" << moyennes[5*p] << "\t" << ecarts_types[5*p] << "\t" << 100*moyennes[5*p]/moyennes[5*p+4] << "%" << std::endl;
    flux_sortie << "DCOP calc\t" << moyennes[5*p+1] << "\t" << ecarts_types[5*p+1] << "\t" << 100*moyennes[5*p+1]/moyennes[5*p+4] << "%" << std::endl;
    flux_sortie << "Transient calc\t" << moyennes[5*p+2] << "\t" << ecarts_types[5*p+2] << "\t" << 100*moyennes[5*p+2]/moyennes[5*p+4] << "%" << std::endl;
    flux_sortie << "Total Solvers\t" << moyennes[5*p+3] << "\t" << ecarts_types[5*p+3] << "\t" << 100*moyennes[5*p+3]/moyennes[5*p+4] << "%" << std::endl;
    flux_sortie << "Total Simulation\t" << moyennes[5*p+4] << "\t" << ecarts_types[5*p+4] << "\t" << 100*moyennes[5*p+4]/moyennes[5*p+4] << "%" << std::endl;

    flux_sortie.close();
  }



  // ------- Affichage résultats -------
  std::cout << std::endl << "=========== Traitement des données Xyce ============" << std::endl << std::endl;
  for(int p = 0; p<NB_PROC; p++)
  {
    std::cout << "* Moyennes/écart-types/pourcentage temps total pour la " << p+1 << "-ième taille de communicateur :" << std::endl;
    std::cout << "\t- Problem set up : \t" << moyennes[5*p] << " / " << ecarts_types[5*p] << " / " << 100*moyennes[5*p]/moyennes[5*p+4] << "%" << std::endl;
    std::cout << "\t- DCOP calculation : \t" << moyennes[5*p+1] << " / " << ecarts_types[5*p+1] << " / " << 100*moyennes[5*p+1]/moyennes[5*p+4] << "%" << std::endl;
    std::cout << "\t- Transient calc : \t" << moyennes[5*p+2] << " / " << ecarts_types[5*p+2] << " / " << 100*moyennes[5*p+2]/moyennes[5*p+4] << "%" << std::endl;
    std::cout << "\t- Total Solvers : \t" << moyennes[5*p+3] << " / " << ecarts_types[5*p+3] << " / " << 100*moyennes[5*p+3]/moyennes[5*p+4] << "%" << std::endl;
    std::cout << "\t- Total Simulation : \t" << moyennes[5*p+4] << " / " << ecarts_types[5*p+4] << " / " << 100*moyennes[5*p+4]/moyennes[5*p+4] << "%" << std::endl;
  }
  std::cout << "=========== Fin de traitement des données Xyce ===========" << std::endl << std::endl;


  return 0;
}
