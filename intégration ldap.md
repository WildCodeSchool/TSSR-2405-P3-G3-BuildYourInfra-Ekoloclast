<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/charte/logo.png)   
![slogan](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/charte/slogan.png)
</div>   

# Configuration de GLPI pour l'Intégration LDAP.  
Commencons par crée un tulisitateur qui nous servira à connecter GLPI et Active Directory.  
Dans AD crée un nouvel utilisateur,nous c'est `ldap`.  

## Accéder à l'interface d'administration GLPI:

Connectez-vous à l'interface web de GLPI avec les informations d'administration par défaut.  
glpi MDP:glpi
Configurer le serveur LDAP :  

![1]()

Allez dans Configuration > Authentification > Annuaire LDAP.
Cliquez sur Ajouter un annuaire et remplissez les champs :  
Sur la premiere ligne **préconfiguration** Cliquer sur **Active Directory** .  
![ad](https://www.it-connect.fr/wp-content-itc/uploads/2024/03/GLPI-Formulaire-configuration-annuaire-LDAP-800x445.png)  
Par la suite on rempli les champs :  
**Nom** : nom du serveur AD (pour ce serveur :**WIN22GUI.ekoloclast.lan**)  
**Serveur par défault** : sélectionner oui 
**Serveur** : Adresse IP du domaine du serveur AD (192.168.0.4) 
**Port** : 389 (pour LDAP)
**BaseDN** : DN de base pour chercher les utilisateurs (OU=paris,DC=ekoloclast,DC=lan)  
**Connexion DN** : Utilisateur de service pour se connecter au LDAP (**ldap@ekoloclast.lan**)  
**Mot de passe** : Mot de passe pour l'utilisateur de service  
![2]()
Cliquez sur Ajouter.

### Test de la connexion :  

Cliquez sur Tester pour vérifier que GLPI peut se connecter à votre annuaire LDAP.
## Synchronisation des Utilisateurs
Configurer les filtres de recherche :

Dans l'onglet `Administration`, sélectionné `Utilisateur` puis `liaison annuaire LDAP`
![3]()

Sélectionné `Importation de nouveaux utilisateur`  
Sélectionné le mode expert 
![4]()  

et comme nous avons tous paramétré avant, il ne reste plus cas cliquer sur `importer` 
![5]()  



## Importer les utilisateurs :


Allez dans Configuration > Authentification.
Sélectionnez l'annuaire LDAP configuré comme méthode d'authentification principale.
Gestion des Groupes et Permissions
Configurer les groupes LDAP :




Vous avez maintenant configuré GLPI pour qu'il utilise Active Directory et un annuaire LDAP pour l'authentification et la gestion des utilisateurs. Cette intégration permet de simplifier la gestion des accès et de centraliser les informations des utilisateurs, facilitant ainsi la gestion quotidienne du parc informatique.