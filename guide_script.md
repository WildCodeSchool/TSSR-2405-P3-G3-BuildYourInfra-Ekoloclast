# Mise à jour de l'Active Directory par l'intermédiaire d'un fichier .CSV
## Introduction
Ce script est conçu pour mettre à jour l'Active Directory en utilisant un fichier .CSV. Le fichier .CSV contient des informations sur les nouveaux employés, les modifications d'utilisateurs existants et les changements de noms de départements.

## Étapes du Script
1. Chargement du Module Active Directory
Le script commence par charger le module Active Directory sur le serveur. Cela permet d'interagir avec l'Active Directory pendant l'exécution du script.

![charg AD](https://github.com/user-attachments/assets/1e59f796-decd-4010-a1a9-f2ed7cd2ee2c)

2. Renommage des OU et Déplacement
Le script renomme les unités d'organisation (OU) à modifier. Les utilisateurs apparaissent avec le nouveau nom de leur OU dans le fichier .CSV. De plus, l'OU "formation" est déplacée dans le département DSI.

![renom OU et deplacement](https://github.com/user-attachments/assets/8a867c82-31bd-4ec5-b36f-f4c47ceab827)

3. Chargement des Fichiers .CSV et Comparaison
Le script charge deux fichiers .CSV : l'un contenant les informations actuelles et l'autre contenant les nouvelles informations. Il compare ces fichiers pour identifier les employés qui sont partis et les nouveaux arrivants. Un fichier nommé employes_partis est créé avec le nom des employés qui ne sont plus dans l'entreprise.

![comparaison de fichiers](https://github.com/user-attachments/assets/2de7cba3-e92f-4f5a-84c7-6516c4b91dd0)

4. Modification des Logins des Employés
Le script modifie les logins des employés. Les nouveaux logins sont générés en utilisant la première lettre du prénom de l'employé, suivie de leur nom et d'un nombre aléatoire.

![login](https://github.com/user-attachments/assets/98af1091-39d5-431a-b3c7-339b9aa7c09b)

5. Mise à Jour des Employés dans l'Active Directory
Le script met à jour les informations des employés dans l'Active Directory en utilisant les données du fichier .CSV.

![MAJ AD](https://github.com/user-attachments/assets/e9eedce7-c2e7-4014-884b-b3f0ec5c1ac0)

6. Désactivation des Comptes Utilisateurs Partis
Enfin, le script désactive les comptes des utilisateurs qui ne font plus partie de l'entreprise. Cette action est basée sur le fichier employes_partis créé précédemment.

![employes partis](https://github.com/user-attachments/assets/30bd957f-7b93-4f63-b163-56350a8ef99b)

Conclusion
Ce script automatise la mise à jour de l'Active Directory en utilisant un fichier .CSV, ce qui permet de gérer efficacement les nouveaux employés, les modifications d'utilisateurs et les changements de noms de départements.