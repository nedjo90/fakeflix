# Réalisation du TP Fakeflix en utilisant Go, Route Provider et Firebase

## Présentation

J'ai réalisé le TP Fakeflix dans le cadre de mon cours, sous la supervision de mon professeur. Ce projet vise à créer une application Flutter permettant aux utilisateurs de parcourir et de gérer une liste de films à partir de l'API TMDB, tout en intégrant des fonctionnalités avancées comme la gestion des favoris et la persistance des données.

## Fonctionnalités Implémentées

### Environnement et API TMDB

- Interaction avec l'API TMDB pour récupérer des données de films détaillées.

### Structure de l'Application

- Mise en place du pattern Master / Details avec `go_router` pour la navigation entre écrans.
- Écrans `MoviesMasterScreen` et `MovieDetailsScreen` pour afficher la liste des films et leurs détails respectivement.

### Gestion des Likes

- Implémentation d'un système de "likes" permettant aux utilisateurs de sauvegarder leurs films préférés.
- Utilisation de `provider` pour gérer l'état global et afficher les films "likés" distinctement.


### Intégration avec Firebase

- Utilisation de Firebase pour la gestion des utilisateurs, y compris l'authentification et le stockage des données utilisateur.

---

## Conclusion

Ce projet m'a permis de mettre en pratique mes compétences en Flutter, en utilisant des outils comme Go, Route Provider et Firebase pour créer une application fonctionnelle et interactive. J'ai appris à structurer efficacement mon code, à gérer l'état de l'application de manière robuste et à intégrer des fonctionnalités avancées telles que la persistance des données et l'interaction avec des API externes. Pour toute question sur ce projet, n'hésitez pas à me contacter.
