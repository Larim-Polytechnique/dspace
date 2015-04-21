# dspace
## Création de conteneurs pour un serveur institutionnel dspace
Les services postgres et dspace sont lancés sur deux conteneurs différents pour mener à une meilleure isolation des environnements. Ils deviennent par conséquent plus modulaire et il devient plus aisé de modifier l'un d'entre eux ou de complètement le recommencer sans affecter l'autre, ni le système hôte.

## Initialisation du conteneur.
Les services en tant que tels sont assez faciles à lancer. L'utilitaire docker-compose pourra lire le fichier docker-compose.yml à la racine du projet et s'assurer de lancer les conteneurs avec toutes les options nécessaires.

### Première commande à lancer
Il faut commencer par compiler l'image. Ce n'est à faire qu'une fois et c'est l'étape la plus longue. Alternativement, ça pourrait être une image qu'on télécharge.
