# Déploiement et Configuration de GLPI-Agent via GPO sans Script
## Introduction
GLPI-Agent est un composant essentiel pour l'inventaire et la remontée des informations des postes de travail vers le serveur GLPI. Ce document décrit les étapes pour déployer et configurer GLPI-Agent sur plusieurs ordinateurs via les GPO (Group Policy Objects) dans un environnement Active Directory (AD), sans utiliser de scripts.

### Prérequis
Serveur Active Directory avec les outils de gestion GPO.
Serveur GLPI opérationnel.
Fichier d'installation de GLPI-Agent (par exemple, glpi-agent-1.x.x-x64.msi).
Accès administrateur aux ordinateurs cibles.
### Étapes de Déploiement
1. #### Préparation du Serveur
Téléchargez GLPI-Agent :

Téléchargez le fichier MSI d'installation de GLPI-Agent depuis le site officiel.
Placez le fichier MSI sur un partage réseau :

Créez un partage réseau accessible par tous les ordinateurs du domaine.
Copiez le fichier MSI de GLPI-Agent dans ce partage réseau.  

2. #### Création d'une GPO pour Déployer GLPI-Agent
Ouvrez la Console de Gestion des GPO :

Connectez-vous à votre serveur AD.
Ouvrez la console de gestion des stratégies de groupe (GPMC).
Créez une nouvelle GPO :

Clic droit sur l'OU (Unité d'Organisation) où se trouvent les ordinateurs cibles.
Sélectionnez Créer un objet GPO dans ce domaine, et le lier ici....
Donnez un nom à la GPO, par exemple, Déploiement GLPI-Agent.
Éditez la GPO :

Clic droit sur la GPO nouvellement créée et sélectionnez Modifier.
Naviguez vers Configuration de l'ordinateur > Stratégies > Paramètres du logiciel > Installation de logiciel.
Clic droit sur Installation de logiciel, sélectionnez Nouveau > Package.
Entrez le chemin UNC vers le fichier MSI dans le partage réseau (par exemple, \\serveur\partage\glpi-agent-1.x.x-x64.msi).
Sélectionnez Assigné.  

3. #### Configuration de GLPI-Agent via GPO
**Ajout des Paramètres de Configuration via GPO :**

Dans l'éditeur de GPO, naviguez vers Configuration de l'ordinateur > Préférences > Paramètres Windows > Registre.
Clic droit sur Registre et sélectionnez Nouveau > Valeur de Registre.  
Ajoutez les valeurs de registre nécessaires :
Serveur GLPI :
 ```
Chemin du Registre : HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent
Nom de la valeur : server
Type de valeur : REG_SZ
Données de la valeur : http://votre-serveur-glpi/front/inventory.php
```
Mode Daemon :
```
Chemin du Registre : HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent
Nom de la valeur : daemon
Type de valeur : REG_SZ
Données de la valeur : 1
```
**Configurer l'exécution de l'agent au démarrage :**

Toujours dans l'éditeur de GPO, naviguez vers Configuration de l'ordinateur > Préférences > Paramètres Windows > Démarrage/Arrêt.
Clic droit sur Démarrage, puis sélectionnez Nouveau > Créer un nouveau Démarrage.
Entrez les détails pour exécuter GLPI-Agent au démarrage :
```
Nom : GLPI-Agent
Chemin du programme : C:\Program Files\GLPI-Agent\agent.exe
Paramètres : --daemon  
```
4. #### Application de la GPO
Forcer la mise à jour des stratégies de groupe :

Sur les ordinateurs cibles, exécutez la commande suivante pour forcer l'application de la GPO :
```
gpupdate /force
```
Redémarrez les ordinateurs cibles :

Redémarrez les ordinateurs pour que l'installation et la configuration de GLPI-Agent soient appliquées.

## Conclusion
Le déploiement et la configuration de GLPI-Agent via les GPO permettent une gestion centralisée et automatisée de l'installation de l'agent sur tous les ordinateurs du domaine. En configurant directement les valeurs de registre et en ajoutant GLPI-Agent au démarrage, vous assurez une installation et une configuration sans intervention manuelle.