
# Usage
With rails >= 5.2
~~~~sh
bundle
rake db:setup
rails s
~~~~

[https://ludovicl-captain-contrat.herokuapp.com](https://ludovicl-captain-contrat.herokuapp.com)


Ce fichier contient le sujet du test que passent les candidats à un poste de dévelopeur chez Captain Contrat.  
Plus d'infos sur [notre page jobs](https://jobs.captaincontrat.com/)

# Captain Challenge

Bienvenue jeune moussaillon !

Pour intégrer le navire Captain Contrat, tu dois créer une arène où deux héros pourront s'affronter !

## Résultat attendu

Le but de ce challenge est de tester ta capacité à monter une petite application [dans le respect des bonnes pratiques](https://medium.com/captain-contrat-tech).  
On te propose plusieurs étapes, avec des bonus facultatifs. Tu peux t'arrêter quand tu veux.  
Tiens-nous régulièrement informés de ta progression.

Nous nous intéresserons tout particulièrement aux choix de conception que tu feras, comment tu abordes les fonctionnalités à développer et ta connaissance des outils que tu utilises.

## Tes armes

- Ruby
- Rails
- git

## Étapes

### 1. Page d'accueil statique

C'est l'accueil de l'arène, d'où nous pourrons lancer les combats.  
Le but est donc de créer l'application et d'afficher une page dans un navigateur.

Bonus :
- Un petit texte d'introduction de ton cru. C'est plus fun.
- Joli design (mais n'y perd pas trop de temps non plus)

### 2. Pouvoir créer un personnage

Données requises :

- Nom
- Points de vie
- Points d'attaque

Assure-toi qu'il n'y ait pas de grand déséquilibre entre combattants.  

Bonus :

- L'arène n'est pas vide au premier démarrage de l'appli.
- Les persos ont une photo de profil (ou de face)
- Crud complet des personnages
- Ajouter d'autres caractéristiques aux personnages

### 3. READY? FIGHT!

Pouvoir choisir deux personnages et les faire combattre, puis afficher le gagnant avec un récapitulatif du combat.

Bonus :

- Historique des combats qui ont eu lieu
- Ajout de points d'expérience (mais pourquoi faire ?)
- Statistiques des combats : taux de victoire par perso et tout ça

### 4. Des armes

Pouvoir assigner une arme aux personnages avant le combat.

Bonus :

- Il n'y a pas que les armes dans la vie, il y a des boucliers aussi
- Pouvoir utiliser plusieurs équipements