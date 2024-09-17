<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>  


# Plan de Sauvegarde pour VyOS
## 1. Préparation
Matériel nécessaire: Un ordinateur avec accès SSH au routeur VyOS, un stockage externe ou un serveur de sauvegarde.
Accès: Assurez-vous d'avoir les identifiants administratifs pour accéder au routeur VyOS via SSH.
## 2. Sauvegarde de la Configuration
Accéder au routeur VyOS via SSH:

### Ouvrez un terminal et connectez-vous au routeur VyOS en utilisant SSH.

`ssh vyos@<adresse_IP_du_routeur>`  
#### Sauvegarder la configuration:

Entrez en mode de configuration.

`configure`  
Sauvegarder la configuration.

`save /config/backup.conf`  
Exporter la configuration.

`copy /config/backup.conf scp://<utilisateur>@<adresse_IP_du_serveur>:/chemin/vers/stockage/backup.conf`  
#### Automatiser la sauvegarde (optionnel):

Vous pouvez configurer un script pour automatiser la sauvegarde en utilisant des outils comme cron sur un serveur Linux.
Utilisez des commandes comme scp pour transférer la configuration à intervalles réguliers.
## 3. Vérification de la Sauvegarde
Télécharger le fichier de sauvegarde: Assurez-vous que le fichier de sauvegarde est bien téléchargé et accessible.
Vérifier l'intégrité: Ouvrez le fichier de sauvegarde pour vérifier qu'il contient bien la configuration de VyOS.
## 4. Restauration de la Configuration
Accéder au routeur VyOS via SSH:

#### Ouvrez un terminal et connectez-vous au routeur VyOS en utilisant SSH.

`ssh vyos@<adresse_IP_du_routeur>`   
Restaurer la configuration:  
Entrez en mode de configuration.

`configure`  
Charger la configuration sauvegardée.

`load /config/backup.conf`  
Appliquer la configuration.

`commit`
En suivant ces plans, vous pouvez assurer une sauvegarde et une restauration efficaces des configurations pour pfSense et VyOS.