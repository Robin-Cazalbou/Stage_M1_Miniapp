
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cmath>


#define NB_PROC 1
#define NB_REP 1000


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

  while(valeurs.size() != 2*NB_PROC*NB_REP)
  {
    flux >> val_string;
    flux >> val_string;
    val = std::stod(val_string);
    valeurs.push_back(val);

    // A part à cause des espaces dans "I/O File Time"
    flux >> val_string;
    flux >> val_string;
    flux >> val_string;
    flux >> val_string;
    val = std::stod(val_string);
    valeurs.push_back(val);
  }

  flux.close();


  // ----- Calcul des différences entre Temps_transient et Temps_IO (= Temps_calcul_transient) -----
  std::vector<double> valeurs_temps_calcul;
  for(unsigned int i = 0; i<valeurs.size(); i+=2)
  {
    valeurs_temps_calcul.push_back(valeurs[i]-valeurs[i+1]);
  }


  // ----- Moyenne et écart-type pour le temps de calcul -----
  double moyenne_temps_calcul = 0.0, ecart_type_temps_calcul = 0.0;

  for(auto& v : valeurs_temps_calcul)
  {
    moyenne_temps_calcul += v;
  }
  moyenne_temps_calcul /= NB_REP;

  for(auto& v : valeurs_temps_calcul)
  {
    ecart_type_temps_calcul += (v-moyenne_temps_calcul)*(v-moyenne_temps_calcul);
  }
  ecart_type_temps_calcul /= NB_REP;
  ecart_type_temps_calcul = std::sqrt(ecart_type_temps_calcul);



  // ------- Affichage résultats -------
  std::cout << "Temps calcul : " << std::endl;
  std::cout << "Moyenne : " << moyenne_temps_calcul << " , Ecart-type : " << ecart_type_temps_calcul << std::endl;


  return 0;
}
