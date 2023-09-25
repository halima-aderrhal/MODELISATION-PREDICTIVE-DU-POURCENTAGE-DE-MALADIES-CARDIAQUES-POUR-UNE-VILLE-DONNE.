# MODELISATION-PREDICTIVE-DU-POURCENTAGE-DE-MALADIES-CARDIAQUES-POUR-UNE-VILLE-DONNE.
c'est un projet de modélisation statistique de prédiction des maladies cardiaques
# Introduction
En statistique, la régression linéaire est utilisée pour modéliser une relation entre une variable dépendante continue et une ou plusieurs variables indépendantes. La variable indépendante peut être catégorielle ou numérique. Le cas où nous n’avons qu’une seule variable indépendante, cela s’appelle une régression linéaire simple. Si nous avons plus d’une
variable indépendante, cela s’appelle une régression multivariée ou multiple. Une représentation mathématique d’un modèle de régression linéaire multiple est la suivante : Yi = β0 + β1×X1 + β2×X2 + ... + βn×Xn + εi
Dans l’équation ci-dessus, le coefficient β0 représente l’interception et le coefficient βi représente la pente.
# Base de donnée
## data.heart.csv
Cet ensemble de données contient des informations sur la maladie cardiaque, fournies par le site connu KAGGLE. Il comprend deux variables telles que le tabagisme (smoking)et faire du vélo (biking) .
Cet ensemble de données peut être utilisé pour étudier la maladie cardiaque et comprendre les facteurs qui influencent cette variable. Il peut être utilisé par des chercheurs, des scientifiques de la données, et toute personne intéressée par l'analyse de données sur la santé.
## Motivation
L'ensemble de données vise à répondre aux questions clés suivantes:
1. Les différents facteurs prédictifs choisis initialement ont-ils vraiment un impact sur la maladie cardiaque? Quels sont les variables prédictives qui affectent réellement la maladie cardiaque?
2. La maladie cardiaque a-t-elle une corrélation positive ou négative avec le tabagisme et l’utilisation du vélo?
## Variables
Deux variables explicatives quantitatives :
● Biking : le pourcentage de personnes se rendant au travail à vélo chaque jour.
● Smoking : le pourcentage de fumeurs.
Et la variable à expliquer :
● Heart Disease : le pourcentage de personnes souffrant de maladies cardiaques.
# Conclusion
Nous avons grâce au logiciel R pu mettre en oeuvre les techniques de statistiques descriptives, tests d’hypothèses et d’analyse de données vues lors du cours. Nous avons découvert quelles sont les variables qui sont significatives dans notre jeu de données grâce au processus de modélisation.
Etant donné tout ce qui précède nous validons notre modèle ,et nous avons pu déduire une diminution de 0,2 % (± 0,0013) de la fréquence des maladies cardiaques pour chaque augmentation de 1 % de la pratique du vélo et une augmentation de 0,177 % (± 0,0033) de la fréquence des maladies cardiaques pour chaque augmentation de 1% du tabagisme.
