<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>


# Documentation des GPO dans notre Active Directory

## Table des Matières

1. [Introduction](#introduction)
2. [Liste des GPO](#liste-des-gpo)
3. [Détails des GPO](#détails-des-gpo)
4. [Application des GPO](#application-des-gpo)
5. [Conclusion](#conclusion)


## Introduction

Ce document vise à fournir une vue d'ensemble des Group Policy Objects (GPO) créés et configurés dans notre Active Directory (AD). Il détaille les paramètres, les objectifs et les unités d'organisation (OU) auxquelles chaque GPO est appliqué.


## Liste des GPO

Voici la liste des GPO créés dans notre AD :

1. [Politique de Sécurité](#politique-de-sécurité)
2. [Configuration du Bureau](#configuration-du-bureau)
3. [Paramètres de Réseau](#paramètres-de-réseau)
4. [Politique de Mise à Jour](#politique-de-mise-à-jour)
5. [Configuration des Applications](#configuration-des-applications)

## Détails des GPO

### Politique de Sécurité
Ces GPO appliques des paramètres de sécurité pour renforcer la sécurité des ordinateurs et des utilisateurs.
## liste des GPO 

1. [Mot de passe](#mot-de-passe) 
2. [Privilèges](#privilèges)
3. [Blocage registre](#blocage-registre)
4. [Blocage usb](#blocage-usb)
5. [Blocage panneaux conf](#blocage-panneaux-conf)

## Mot de passe

- **Paramètres**:
  - Mot de passe complexe
  - Verrouillage automatique de l'écran après 15 minutes d'inactivité
  - Désactivation des comptes après 3 tentatives de connexion échouées
- **OU Appliquée**: Tous les ordinateurs et utilisateurs  
- **Chemin** : `Config ordi -> Param Windows -> Param de sécu -> Strat de compte -> strat de Mot de passe` 

### Privilèges  
 - **Paramètres** :
    - Interdit l'élévation des privilège à partir d'un utilisateur non administrateur
- **OU Appliquée**: Tous les ordinateurs et utilisateurs
- **Chemin** :`Config ordi -> Param Windows -> Param de sécu -> strat locales -> Cont de compte utilisateur`   
### Blocage registre
- **Paramètres**:
  - Blocage de l'accées au registre
- **OU Appliquée**: Tous les utilisateurs  
- **Chemin** : `Config utilisateur -> stratégies -> modèles d'admin -> Système`  
 ### Blocage usb
- **Paramètres**:
  - Désactivation des port USB non essentiels
- **OU Appliquée**: Tous les ordinateurs  
- **Chemin** : `Config ordi -> Param Windows -> Param de sécu -> Modèles Administration`  
### Blocage panneaux conf
- **Paramètres** :
    - Désactive l'accés au panneaux de configuration pour les utilisateurs non administrateur
- **OU Appliquée**: Tous les utilisateurs
- **Chemin** :`Config utilisateur -> Stratégies -> Modéle d'administration -> panneus de conf -> Système`  






## Configuration du Bureau

- **Description**: Cette GPO configure les paramètres du bureau pour standardiser l'environnement de travail.
- **Paramètres**:
  - Fond d'écran de l'entreprise
  - Icônes de bureau standardisées
  - Désactivation des modifications de l'arrière-plan
- **OU Appliquée**: Tous les utilisateurs

## Paramètres de Réseau

- **Description**: Cette GPO configure les paramètres réseau pour assurer une connectivité sécurisée et optimisée.
- **Paramètres**:
  - Configuration des serveurs DNS
  - Paramètres de proxy
  - Désactivation des connexions non sécurisées
- **OU Appliquée**: Tous les ordinateurs

## Politique de Mise à Jour
Ces GPO gère les mises à jour des systèmes d'exploitation et des logiciels.
1. [Windows update](#windows-update)

### Windows update
- **Paramètres**:
  - Activation des mises à jour automatiques
  - Planification des mises à jour hors des heures de travail
  - Notification des utilisateurs avant l'installation des mises à jour
- **OU Appliquée**: Tous les ordinateurs  
- **Chemin** : `Config ordinateur -> stratégies -> modèles d'admin -> Composant Windows/Windows update` 


### Configuration des Applications

- **Description**: Cette GPO configure les paramètres des applications installées sur les ordinateurs.
- **Paramètres**:
  - Installation automatique des applications nécessaires
  - Désinstallation des applications non autorisées
  - Configuration des paramètres des applications
- **OU Appliquée**: Tous les utilisateurs

## Application des GPO

### Méthode d'Application

Les GPO sont appliquées aux unités d'organisation (OU) spécifiques dans l'Active Directory. Chaque GPO est liée à une ou plusieurs OU pour s'assurer que les paramètres sont appliqués aux utilisateurs et aux ordinateurs appropriés.

### Vérification de l'Application

Pour vérifier l'application des GPO, vous pouvez utiliser les outils suivants :

- **gpresult**: Affiche les résultats des GPO appliquées à un utilisateur ou à un ordinateur.
- **gpupdate**: Met à jour les paramètres des GPO sur un ordinateur.

## Conclusion

Ce document fournit une vue d'ensemble des GPO créés et configurés dans notre Active Directory. Il détaille les paramètres, les objectifs et les unités d'organisation (OU) auxquelles chaque GPO est appliquée. Pour toute question ou besoin d'assistance supplémentaire, veuillez contacter l'administrateur AD.


[def]: #Privilèges