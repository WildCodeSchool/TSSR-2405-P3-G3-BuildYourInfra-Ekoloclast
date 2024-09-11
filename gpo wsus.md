<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>



# Mise en place d'une GPO pour l'utilisation d'un serveur WSUS

## Objectif

Ce document décrit les étapes nécessaires pour configurer une stratégie de groupe (GPO) afin de diriger les ordinateurs de votre domaine vers un serveur WSUS pour la gestion des mises à jour.

## Infrastructure

- **Domaine** : `ekoloclast.lan`
- **Serveur Active Directory (AD)** : DHCP avec l'adresse IP `192.168.0.4`
- **Serveur WSUS** : Adresse IP `192.168.0.8`

## Prérequis

- Accès à un compte avec des droits d'administrateur sur le serveur Active Directory.
- Le serveur WSUS doit être installé et configuré.

## Étapes de Configuration

### 1. Ouvrir la console de gestion des stratégies de groupe

1. Connectez-vous à un serveur membre ou à une station de travail avec les outils d'administration installés.
2. Ouvrez la console **"Gestion des stratégies de groupe"** en exécutant `gpmc.msc`.

### 2. Créer une nouvelle GPO

1. Dans le panneau de gauche, faites un clic droit sur l'unité d'organisation (OU) où se trouvent les ordinateurs cibles.
2. Sélectionnez **"Créer un objet GPO dans ce domaine, et le lier ici..."**.
3. Donnez un nom significatif au GPO, par exemple **" WSUS < nom du departement > "**.

### 3. Éditer la GPO

1. Faites un clic droit sur la GPO que vous venez de créer et sélectionnez **"Modifier..."**.

2. Cela ouvrira l'éditeur de gestion des stratégies de groupe.

### 4. Configurer les paramètres WSUS

Dans l'éditeur de gestion des stratégies de groupe, suivez les étapes ci-dessous :

#### Pour les ordinateurs :

1. Naviguez vers **Configuration de l'ordinateur** > **Politiques** > **Modèles d'administration** > **Composants Windows** > **Windows Update**.
2. Dans le panneau de droite, double-cliquez sur **"Configurer l'emplacement du service de mise à jour de Microsoft"**.
3. Sélectionnez **"Activé"**.
4. Dans le champ **"URL du service de mise à jour de Microsoft"**, entrez l'URL de votre serveur WSUS :
http://192.168.0.8:8530
5. Cliquez sur **"OK"**.

#### Configurer d'autres paramètres de mise à jour

- **Configurer les mises à jour automatiques** : Double-cliquez sur **"Configurer les mises à jour automatiques"** et sélectionnez **"Activé"**. Choisissez le mode de mise à jour qui convient à votre organisation.
- **Délai d'installation** : Si vous souhaitez définir un délai pour l'installation des mises à jour, vous pouvez le configurer ici.

### 5. Appliquer la GPO

1. Fermez l'éditeur de gestion des stratégies de groupe.
2. La GPO sera appliquée aux ordinateurs dans l'OU que vous avez sélectionnée. Vous pouvez forcer une mise à jour de la stratégie sur un ordinateur client en exécutant la commande suivante dans l'invite de commande :
```bash
gpupdate /force
```

6. Vérifier l'application de la GPO
Sur un ordinateur client, ouvrez une invite de commande et exécutez : bash gpresult /h gpo_report.html
Ouvrez le fichier gpo_report.html dans un navigateur web pour vérifier que la GPO est correctement appliquée.
