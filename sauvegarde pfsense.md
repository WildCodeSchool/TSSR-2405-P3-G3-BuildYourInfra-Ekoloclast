<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>  


# Plan de Sauvegarde pour pfSense
## 1. Préparation
Matériel nécessaire: Un ordinateur avec accès à l'interface web de pfSense, un stockage externe ou un serveur de sauvegarde.
Accès: Assurez-vous d'avoir les identifiants administratifs pour accéder à l'interface web de pfSense.
## 2. Sauvegarde de la Configuration
Accéder à l'interface web de pfSense:

Ouvrez un navigateur web et entrez l'adresse IP de pfSense.  
Connectez-vous avec vos identifiants administratifs.  
Naviguer vers la section de sauvegarde:  

Allez dans `Diagnostics > Backup & Restore`.
Sauvegarder la configuration:

Cliquez sur `Download configuration as XML`.
Enregistrez le fichier XML sur votre ordinateur ou sur un stockage externe.
#### Automatiser la sauvegarde (optionnel):

Vous pouvez configurer un script pour automatiser la sauvegarde en utilisant des outils comme cron sur un serveur Linux.
Utilisez des commandes comme curl pour télécharger la configuration XML à intervalles réguliers.
## 3. Vérification de la Sauvegarde
Télécharger le fichier XML:  
 Assurez-vous que le fichier XML est bien téléchargé et accessible.
Vérifier l'intégrité:  
 Ouvrez le fichier XML pour vérifier qu'il contient bien la configuration de pfSense.
## 4. Restauration de la Configuration
Accéder à l'interface web de pfSense:

Ouvrez un navigateur web et entrez l'adresse IP de pfSense.  
Connectez-vous avec vos identifiants administratifs.  
Naviguer vers la section de restauration:  

Allez dans `Diagnostics > Backup & Restore`.
Restaurer la configuration:

Cliquez sur `Choose File` et sélectionnez le fichier XML de sauvegarde.  
Cliquez sur Restore configuration.
