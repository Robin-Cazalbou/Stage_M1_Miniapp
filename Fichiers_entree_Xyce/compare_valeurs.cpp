
#include <string>
#include <fstream>
#include <iostream>
#include <cmath>
#include <vector>

#define TAILLE_INDEX 500

int main(int argc, char **argv)
{

  if(argc != 3)
  {
    std::cerr << "Mauvaise utilisation : " << argv[0] << " fichier1 fichier2" << std::endl;
    return 1;
  }

  // Ouverture premier fichier + récupération première ligne
  std::ifstream flux1(argv[1]);
  std::string ligne1;
  std::getline(flux1, ligne1);

  // Idem second fichier
  std::ifstream flux2(argv[2]);
  std::string ligne2;
  std::getline(flux2, ligne2);


  std::string v1, v2, v3, v4, v5, v6;
  double diff1, diff2, diff3;
  std::vector<double> vec_diff1, vec_diff2, vec_diff3;

  // Spécifique aux fichiers ressortis par Xyce
  for(int i = 0; i<TAILLE_INDEX+1; i++)
  {
    // Fichier 1 :
    // Récupérer la 3ième valeur
    flux1 >> v1;
    flux1 >> v1;
    flux1 >> v1;
    // Récupérer la 4ième valeur
    flux1 >> v2;
    // Récupérer la 5ième valeur
    flux1 >> v3;


    // Fichier 2 :
    // Récupérer la 3ième valeur
    flux2 >> v4;
    flux2 >> v4;
    flux2 >> v4;
    // Récupérer la 4ième valeur
    flux2 >> v5;
    // Récupérer la 5ième valeur
    flux2 >> v6;


    // Calcul différence + stockage dans un vecteur :
    diff1 = fabs( stod(v1) - stod(v4) );
    diff2 = fabs( stod(v2) - stod(v5) );
    diff3 = fabs( stod(v3) - stod(v6) );
    vec_diff1.push_back(diff1);
    vec_diff2.push_back(diff2);
    vec_diff3.push_back(diff3);
  }

  // Calcul de la moyenne sur chacun des trois vecteurs :
  double moy1 = 0, moy2 = 0, moy3 = 0;
  for(auto val : vec_diff1)
  {
    moy1 += val;
  }
  for(auto val : vec_diff2)
  {
    moy2 += val;
  }
  for(auto val : vec_diff3)
  {
    moy3 += val;
  }

  moy1 = moy1/(double)vec_diff1.size();
  moy2 = moy2/(double)vec_diff2.size();
  moy3 = moy3/(double)vec_diff3.size();

  std::cout << moy1 << " " << moy2 << " " << moy3 << std::endl;



  return 0;
}
