# Sauvegarde de l'Active Directory
## 1. Sauvegarde du système  


Pour créer une sauvegarde complète du système, on utilise l'outil de sauvegarde intégré de Windows Server.   
Voici les étapes détaillées :

Ouvrir le Panneau de configuration :  
- Accédez à Système et sécurité > Sauvegarde et restauration (Windows Server).  

Créer une sauvegarde système :  
-  Cliquez sur Créer une sauvegarde système et suivez les instructions pour sélectionner l'emplacement de la sauvegarde (disque dur externe, partage réseau, etc.).
## 2. Sauvegarde des bases de données AD avec ntdsutil
**ntdsutil** est un outil en ligne de commande utilisé pour gérer les bases de données Active Directory.  
 Voici les commandes détaillées :

- Ouvrir une invite de commandes en tant qu'administrateur : Cliquez avec le bouton droit sur l'icône de l'invite de commandes et sélectionnez Exécuter en tant qu'administrateur.

Lancer ntdsutil :
`ntdsutil`  
Cette commande ouvre l'outil ntdsutil.

- Activer l'instance NTDS :`activat instance ntds`  
Cette commande active l'instance NTDS, qui est la base de données Active Directory.

- Accéder au mode IFM (Install from Media) :`ifm`  
Cette commande entre dans le mode IFM, qui permet de créer des sauvegardes de la base de données AD.

- Créer une sauvegarde complète :`create full c:\ADBackup`  
Cette commande crée une sauvegarde complète de la base de données AD et la stocke dans le répertoire c:\ADBackup.

- Quitter ntdsutil :`quit`  
Cette commande quitte le mode IFM.  
`quit`  
Cette commande quitte ntdsutil.

# Sauvegarde du DHCP
## 1. Sauvegarde de la configuration DHCP avec netsh
netsh est un outil en ligne de commande utilisé pour configurer et surveiller les réseaux.  
 Voici les commandes détaillées :

- Ouvrir une invite de commandes en tant qu'administrateur :  
 Cliquez avec le bouton droit sur l'icône de l'invite de commandes et sélectionnez Exécuter en tant qu'administrateur.
- Exporter la configuration DHCP :`netsh dhcp server export c:\DHCPBackup\DHCPConfig.txt all`  
Cette commande exporte la configuration DHCP complète et la stocke dans le fichier DHCPConfig.txt situé dans le répertoire c:\DHCPBackup.
## 2. Sauvegarde de la base de données DHCP

- Arrêter le service DHCP :`net stop dhcpserver`  
Cette commande arrête le service DHCP.

- Copier la base de données DHCP :`Copy-Item C:\Windows\System32\dhcp\dhcp.mdb c:\DHCPBackup\dhcp.mdb`  
Cette commande copie le fichier de la base de données DHCP (dhcp.mdb) situé dans C:\Windows\System32\dhcp vers le répertoire de sauvegarde c:\DHCPBackup.

- Redémarrer le service DHCP :`net start dhcpserver`  
Cette commande redémarre le service DHCP.

# Récupération de l'Active Directory
## 1. Restauration du système
Pour restaurer le système, on utilise l'outil de récupération de Windows Server.   Voici les étapes détaillées :

- Redémarrer le serveur en mode de récupération :  
 Utilisez le support d'installation de Windows Server pour démarrer en mode de récupération.  

- Utiliser l'outil de récupération :  
 Suivez les instructions pour restaurer le système à partir de la sauvegarde.
## 2. Restauration des bases de données AD 
Pour restaurer la base de données AD il faut remplacer le fichier `ntds.dit` qui se trouve dans `C:\Windows\NTDS` par le fichier de sauvegarde créé précédemmnet. 
- Arrêtez le service Active Directory Domain Services :`net stop ntds`
- Remplacez le fichier ntds.dit dans C:\Windows\NTDS par le fichier sauvegardé.
- Redémarrez le service Active Directory Domain Services :`net start ntds` 

# Récupération du DHCP
## 1. Restauration de la configuration DHCP avec netsh
- Ouvrir une invite de commandes en tant qu'administrateur :  
 Cliquez avec le bouton droit sur l'icône de l'invite de commandes et sélectionnez Exécuter en tant qu'administrateur.
- Importer la configuration DHCP :`netsh dhcp server import c:\DHCPBackup\DHCPConfig.txt all`  
Cette commande importe la configuration DHCP à partir du fichier DHCPConfig.txt situé dans le répertoire c:\DHCPBackup.
## 2. Restauration de la base de données DHCP
- Arrêter le service DHCP :`net stop dhcpserver`
- Remplacer la base de données DHCP :`Copy-Item c:\DHCPBackup\dhcp.mdb C:\Windows\System32\dhcp\dhcp.mdb`  
Cette commande remplace le fichier de la base de données DHCP (dhcp.mdb) dans C:\Windows\System32\dhcp par le fichier sauvegardé.

- Redémarrer le service DHCP :`net start dhcpserver`  
## 3. Vérification
- Après la restauration, vérifiez que les services AD et DHCP fonctionnent correctement :  

  - Vérifier les journaux d'événements : Ouvrez l'Observateur d'événements et vérifiez les journaux pour toute erreur.  
  - Tester les fonctionnalités AD : Vérifiez que les utilisateurs peuvent se connecter, que la réplication fonctionne, etc.  
  - Tester les fonctionnalités DHCP : Vérifiez que les adresses IP sont attribuées correctement, que les réservations fonctionnent, etc.
# Conclusion
Cette procédure de sauvegarde et de récupération doit être testée régulièrement pour s'assurer qu'elle fonctionne correctement et que vous pouvez restaurer les services en cas de panne. Assurez-vous également de stocker les sauvegardes dans un emplacement sécurisé et accessible en cas de besoin.