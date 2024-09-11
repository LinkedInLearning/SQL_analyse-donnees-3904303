# Utiliser SQL pour l'analyse de données

Ce dossier Repository est lié au cours `Utiliser SQL pour l'analyse de données`. Le cours entier est disponible sur [LinkedIn Learning][lil-course-url].

![Nom final de la formation][lil-thumbnail-url] 

Avec Rudi Bruchez, apprenez à utiliser SQL pour l'analyse de données. Dans cette formation, vous assimilerez la syntaxe SQL, vérifierez les résultats de vos requêtes et gérerez les données de mauvaise qualité. Vous approfondirez le sujet en manipulant et en recherchant des chaînes, en traitant des dates et en travaillant avec des tables temporaires. Enfin, vous explorerez les fonctions de fenêtrage, vous appliquerez des analyses statistiques et vous aborderez la distribution des données et les écarts.		

## Instructions

Ce dossier Repository contient des dossiers pour chacun des chapitres de la formation. Dans ces dossiers, vous trouverez simplement les fichiers `.sql` numérotés selon la numéro de la vidéo dans le chapitre. 

## Installation

1. Pour utiliser ces fichiers d’exercice, vous avez besoin de : 
   - [PostgreSQL](https://www.postgresql.org/download/) 
   - [DBeaver](https://dbeaver.io/) ou tout autre outil de requête qui se connecte à PostgreSQL
2. Clonez ce dossier Repository sur votre machine locale (Mac), CMD (Windows), ou sur un outil GUI tel que SourceTree
   - `git clone https://github.com/LinkedInLearning/SQL_analyse-donnees-3904303.git`
4. Pour restaurer la sauvegarde de la base de données PachadataFormation dans PostgreSQL :
   - Créez la base de données au préalable à partir du `template0`, par exemple avec la commande suivante : `createdb -T template0 pachadataformation`
   - Utilisez `psql` pour restaurer la base : `psql pachadataformation < pachadataformation.pgdump`
   - Vous pouvez aussi restaurer la base dans DBeaver, avec la fonctionnalité d'importation

### Formateur

**Rudi Bruchez** 

 Retrouvez mes autres formations sur [LinkedIn Learning][lil-URL-trainer].

[0]: # (Replace these placeholder URLs with actual course URLs)
[lil-course-url]: https://www.linkedin.com
[lil-thumbnail-url]: https://media.licdn.com/dms/image/v2/D4D0DAQH563oC3dobfw/learning-public-crop_675_1200/learning-public-crop_675_1200/0/1726039097491?e=2147483647&v=beta&t=0FGWJwLqgXH6Rnl7V-XVFhJY96VY-r4W5Rf7GmjLc8I
[lil-URL-trainer]: https://www.linkedin.com/learning/instructors/rudi-bruchez

[1]: # (End of FR-Instruction ###############################################################################################)

