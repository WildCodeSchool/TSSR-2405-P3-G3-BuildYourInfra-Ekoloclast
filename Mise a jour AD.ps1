#Mise a jour  de l'Active Directory par l'intermediaire d'un fichier .CSV  

##Nouveau fichier .CSV avec des nouveaux employés ,des modifications d'utilisateurs et des changements de noms de departements

Pour commencer je dois charger mon module active directory de mon serveur pour interagir avec lui a l'execution du script 

![charg AD](https://github.com/user-attachments/assets/1e59f796-decd-4010-a1a9-f2ed7cd2ee2c)


Je commence par renommer les OU a modifier car avec le nouveau fichier .CSV les utilisateurs apparaissent avec le nouveau nom de leur OU et je depalce par la meme occasion l'OU "formation" dans le departement DSI

![renom OU et deplacement](https://github.com/user-attachments/assets/8a867c82-31bd-4ec5-b36f-f4c47ceab827)


Je charge les deux fichiers .CSV pour trouver les employés qui sont partis et les nouveaux arrivants 
Je crée egalement un fichier ,que je nomme employes_partis, avec le nom des employés qui ne sont plus dans l'entreprise 

![comparaison de fichiers](https://github.com/user-attachments/assets/2de7cba3-e92f-4f5a-84c7-6516c4b91dd0)


Nous avons decidé de changer le login des employés par la premiere lettre de leur prenom ainsi que leur nom suivis d'un nombre aleatoire 


![login](https://github.com/user-attachments/assets/98af1091-39d5-431a-b3c7-339b9aa7c09b)


Je fais la mise a jour des employés dans mon Active Directory  grace au fichier .CSV 

![MAJ AD](https://github.com/user-attachments/assets/e9eedce7-c2e7-4014-884b-b3f0ec5c1ac0)


Je termine en desactivant les comptes utilisateurs qui ne font plus partis de l'entreprise  grace au fichier employes_partis créé precedemment 

![employes partis](https://github.com/user-attachments/assets/30bd957f-7b93-4f63-b163-56350a8ef99b)



