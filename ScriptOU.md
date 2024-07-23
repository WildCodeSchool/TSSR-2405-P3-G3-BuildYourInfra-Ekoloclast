# Creation des OU par l'intermediaire d'un fichier .CSV 

Dans un premier temps je dois verifier que mon fichier CSV est bien lu par mon serveur 
Je vais donc creer un script pour lire ce fichier 


![script import CSV](https://github.com/user-attachments/assets/4a3e77bf-f8e8-4164-99e2-58abefd23120)


![Import fichier CSV](https://github.com/user-attachments/assets/70300232-7fae-4424-a4c4-101681232e2c)

Sur la deuxieme capture d'ecran nous voyons que le fichier .CSV est lu par l'intermediaire du script 

je rajoute de fonctions dans mon script pour qu'il normalise les caractères car il se peut qu'a l'execution du script certains caractères ne soient pas reconnus 


![normalisation](https://github.com/user-attachments/assets/9524ce89-a97c-4456-8d3d-184cf5b7340e)


Je specifie le chemin de mon fichier .CSV et je l'importe  pour pouvoir creer des OU et des sous OU

![import](https://github.com/user-attachments/assets/8e95817e-1cd7-41ca-983b-bcff12fe1401)

Je crée une OU principale ainsi que des sous OU 
(je ne met que la premiere sous ou sur cette capture d'ecran mais le principe est le meme pour les suivantes)

![creation OU et sousOU](https://github.com/user-attachments/assets/b77aee82-9160-487d-a7ab-9dd306b64395)

J'ai créé l'OU principal "Site" et ensuite les sous OU "Departement",une sous OU "Service","fonction".

Ensuite j'ajoute les utilisateurs dans leurs differents sous OU 

![Ajout utilisateur et MAJ](https://github.com/user-attachments/assets/843de1b7-02ea-440e-a59a-dca9186e69f2)

J'ai ajouté la mise a jour des utilisateurs si toutefois le fichier .CSV serait modifié


A present je veux deverouiller les comptes desutilisateurs et leur demander de changer le mot de passe a la premiere connexion de leur session ,et que le mot de passe n'expire jamais 

![activation et mdp](https://github.com/user-attachments/assets/fcd14730-13e6-4928-a81c-7961b09a3e73)

Le script s'execute 

![creation et maj utilisateurs](https://github.com/user-attachments/assets/7098c3f3-b0c4-4f62-8f95-ac4c3aad8d3e)

Demande de changement de MDP 

![changement mdp](https://github.com/user-attachments/assets/1c36db7b-5141-48e6-b315-e86ef9e1be86)


Mes deux OU principales  "ordinateurs" et site"(Paris)(toulouse) ainsi que leurs sous OU respectifs sont créées

![OU créés](https://github.com/user-attachments/assets/3bfd4495-e3e4-4e11-a1dc-7e23cd4287bc)




























