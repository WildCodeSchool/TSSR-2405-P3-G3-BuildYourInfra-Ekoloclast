<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>

# Mise au Domaine d'un Serveur Windows 2022 et Installation du Rôle WSUS

## 1. Introduction
Ce document décrit les étapes nécessaires pour mettre un serveur Windows 2022 au domaine et installer le rôle Windows Server Update Services (WSUS). WSUS permet de gérer et de distribuer les mises à jour pour les systèmes d'exploitation Windows dans un environnement d'entreprise.

## 2. Prérequis
Un serveur Windows 2022 installé et configuré.
Un compte administrateur avec des privilèges pour rejoindre le domaine.
Accès au contrôleur de domaine (DC) et aux informations nécessaires pour rejoindre le domaine.
Une connexion réseau stable.
## 3. Mise au Domaine du Serveur Windows 2022
### Étape 1: Configuration de l'adresse IP
Connectez-vous au serveur Windows 2022 avec un compte administrateur.  
Ouvrez le Panneau de configuration > Réseau et Internet > Centre Réseau et partage.  
Cliquez sur Modifier les paramètres de la carte.  
Faites un clic droit sur l'interface réseau et sélectionnez Propriétés.  
Sélectionnez Protocole Internet version 4 (TCP/IPv4) et cliquez sur Propriétés.  
Configurez l'adresse IP, le masque de sous-réseau, la passerelle par défaut et les serveurs DNS.  
### Étape 1.1 : changer le nom du serveur
Dans la barre de recherche, taper **executer** et taper pour lancer le programme **sysdm.cpl** pour ouvrir les Propriétés systeme.  
![1](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/1.png)  
Cliquer sur **modifier** pour pouvoir changer le nom du serveur.  
![2](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/tree/s07)  
Redemmaré le serveur pour la prise en compte.   
### Étape 2: Rejoindre le Domaine
Ouvrez Système en faisant un clic droit sur Ce PC et en sélectionnant Propriétés.  
Cliquez sur Modifier les paramètres sous Paramètres système avancés.  
Dans la fenêtre Propriétés système, cliquez sur l'onglet Nom de l'ordinateur.  
Cliquez sur Modifier et sélectionnez Domaine.
![3](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/tree/s07)  
Entrez le nom du domaine et cliquez sur OK.  
Entrez les informations d'identification du compte administrateur du domaine et cliquez sur OK.  
Redémarrez le serveur pour appliquer les modifications.  
## 4. Installation du Rôle WSUS
### Étape 1: Ajouter le Rôle WSUS
Ouvrez le Gestionnaire de serveur.
Cliquez sur Ajouter des rôles et des fonctionnalités.  
![ajout rôle](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/ajout%20r%C3%B4le.png)  

Cliquez sur Suivant jusqu'à ce que vous atteigniez l'écran Sélection des rôles.
Sélectionnez Windows Server Update Services et cliquez sur Ajouter des fonctionnalités.  
![ajout rôle2](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/ajout%20r%C3%B4le%202.png)  

Cliquez sur Suivant jusqu'à ce que vous atteigniez l'écran Sélection des fonctionnalités.
Cliquez sur Suivant jusqu'à ce que vous atteigniez l'écran Sélection des services de rôle.
Sélectionnez WSUS Services et Database (si nécessaire).
Sélectionnez l'emplacement de stockage des mise à jour (si possible différetn de l'emplacement systeme)  
![ajout rôle3](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/ajout%20r%C3%B4le%203.png)  

Cliquez sur Suivant et suivez les instructions pour terminer l'installation. 

### Étape 2: Configuration Post-Installation
Une fois l'installation terminée, Cliqué sur l'avertissment en jaune et suivez l'assistant de configuration initiale pour configurer les paramètres de base de WSUS.  
![config]()  
## 5. Configuration de WSUS
### Étape 1: Configuration des Paramètres de Synchronisation
Si tu a lancé l'assistant :  
Clique sur `Next`  
![config wsus1](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus1.png)  
Décoche la case  `Yes, I would like to join the Microsoft Update Improvement Program`  
![config wsus2](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus2.png)  
Laisse sélectionné la case `Synchronize from Microsoft Update`  
![config wsus3](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus3.png)  
Ne mets pas de proxy  
![config wsus4](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus4.png)  
À la fin, clic sur `Start Connecting`.**Cette action peut être longue (entre 10 et 20 min) !**  
![config wsus5](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus5.png)  
Si cela ne fonctionne pas, vérifier la connexion internet.  
Après, sélectionne les langues `English` et `French`  
![config wsus6](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus6.png)  
Dans la fenêtre d'après, sélectionne les produits pour lesquels tu souhaites avoir des mises à jour. Ici tu 
peux choisir parmi les produits Windows 10 et les serveurs.  
![config wsus7](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus7.png)  
Pour les classifications laisse les choix par défaut. 
![config wsus8](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus8.png)   
Pour la synchronisation, choisi 4 synchronisations par jour, à partir de 2h.  
![config wsus9](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus9.png) 
Enfin coche la case `Begin initial synchronization` et clic sur `Finish`  
![config wsus10](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s07/ressources/wsus/config%20wsus10.png)  
Pour voir l'état de la synchronisation, tu clic sur le nom de ton serveur dans la fenêtre, et tu as l'état de la synchronisation avec le widget **Synchronization Status**.  

### Étape 2: Approbation des Mises à Jour
Allez dans Mises à jour > Toutes les mises à jour.  
Sélectionnez les mises à jour que vous souhaitez approuver.  
Cliquez sur Approuver et sélectionnez les groupes d'ordinateurs pour lesquels vous souhaitez approuver les mises à jour.  
