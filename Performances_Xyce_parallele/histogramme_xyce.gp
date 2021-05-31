# Script Gnuplot de génération de l'histogramme des performances de miniXyce, obtenu grâce aux autres scripts de lancement et de traitement des données

# Reset les paramètres de gnuplot
reset

# Echelle logarithmique en y, affichage des valeurs de l'échelle en format flottant court
set logscale y 10
set format y "%g"

# Pas d'affichage de l'échelle de l'autre côté du graphique
set ytics nomirror
set xtics nomirror

# Affichage grille mais uniquement selon y
set grid ytics

# Hauteur du graphique (étendue de y)
set yrange [:0.3]

# Epaisseur des barres de l'histogramme
set boxwidth 1.5

# Remplir les barres de l'histogramme avec une couleur, définir la transparence
set style fill solid 0.7

# Définir l'affichage comme étant un histogramme avec des barres d'erreurs
set style histogram errorbars gap 2 lw 1.5
set style data histograms

# Pour faire un affichage des légendes de chaque barre de façon inclinée
set xtics rotate by -45

# Séparateur des données dans le fichier de données brutes transféré à gnuplot
set datafile separator "\t"

# Désactiver l'affichage de la légende (i.e. association couleur de courbe avec son nom)
unset key

# Titre du graphique, légende selon y
set title "Temps moyen d'exécution pour chaque sous-partie de Xyce\n4 Processus" font "Helvetica,16"
set ylabel "Temps moyen d'exécution (en s)"


# Création du graphique en utilisant les colonnes 2 et 3, et la colonne 1 en tant que légende
# la deuxième partie (après la virgule) est une astuce pour afficher des valeurs au dessus des
# barres (ici, le pourcentage du temps par rapport au temps total)
plot 'Resultats_mesures/Traitement_donnees_proc4.dat' using 2:3:xtic(1) lc "red", '' using 0:2:4 with labels offset 0, char 1 font ",8"
