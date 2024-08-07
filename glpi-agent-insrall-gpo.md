<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/new%20ekoloclast%20titre%20sans%20fond.png)   

</div>    


# Mise en place de GLPI-Agent via une GPO sur le domaine ekoloclast.lan

## Introduction

GLPI-Agent est un outil qui permet de collecter des informations sur les machines et de gérer les actifs au sein d'une organisation. L'installation via une GPO (Group Policy Object) simplifie le déploiement sur l'ensemble des machines d'un domaine Windows.

## Prérequis

- Accès administrateur au domaine `ekoloclast.lan`.
- Un serveur GLPI opérationnel.
- Un partage réseau pour le fichier d'installation de GLPI-Agent.
- Les fichiers d'installation de GLPI-Agent (ex. : `glpi-agent-xxx.msi`).

## Étapes de mise en place

### Étape 1 : Préparer le fichier d'installation

1. **Téléchargez GLPI-Agent** :
   - Téléchargez la dernière version de GLPI-Agent depuis le site officiel de GLPI.

2. **Copiez le fichier sur un partage réseau** :
   - Copiez le fichier d'installation `glpi-agent-xxx.msi` dans le dossier de partage `\\WINSERV22\logiciels$`.
   - Assurez-vous que les utilisateurs du domaine ont les droits de lecture sur ce dossier.

### Étape 2 : Créer une GPO

1. **Ouvrir le Gestionnaire de stratégies de groupe** :
   - Sur un contrôleur de domaine, ouvrez `gpmc.msc` (Gestionnaire de stratégie de groupe).  
   ![gpmc](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/glpi-agent/gpmc.png)

2. **Créer une nouvelle GPO** :
   - Cliquez avec le bouton droit sur l’unité d'organisation (OU) où se trouvent les ordinateurs cibles.
   - Sélectionnez "Créer un objet GPO dans ce domaine, et le lier ici".
   - Nommez la GPO, par exemple "Installation GLPI-Agent".  
   ![gpo1](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/glpi-agent/gpo1.png)  

3. **Éditez la GPO** :
   - Cliquez avec le bouton droit sur la GPO créée et sélectionnez "Modifier".

### Étape 3 : Configurer l'installation du logiciel

1. **Naviguer vers Configurer les logiciels** :
   - Dans l'éditeur de GPO, allez à **Configuration de l'ordinateur** > **Stratégies** > **Paramètres Windows** > **Installation de logiciel**.

2. **Ajouter le package d'installation** :
   - Cliquez avec le bouton droit sur **Installation de logiciel**, sélectionnez **Nouveau** > **Package**.
   - Dans la boîte de dialogue, entrez le chemin UNC vers l'installateur : `\\WINSERV22\logiciel$\glpi-agent-xxx.msi`.
   ![gpo2](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/glpi-agent/gpo2.png)   
   - Choisissez l’option **Assigné** pour que le logiciel s'installe automatiquement.

### Étape 4 : Configurer le service GLPI-Agent

1. **Configuration du fichier de configuration** :
   - Sans sortir de la gpo ,allez dans **Configuration de l'ordinateur** > **Paramètres Windows** > **Registrre**  
   ![gpo3](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/glpi-agent/gpo3.png)  
   - Cliquez avec le bouton droit **Nouveau** > **Elément Registre**.  
   ![gpo4](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/glpi-agent/gpo4.png)  
   - Selectionnez `HKEY_LOCAL_MACHINE` et entrez le chemin `SOFTWARE\GLPI-Agent` en respectant bien les majuscule.  
   - Type de valeur `REG_SZ` et pour Données de valeur il faut renseigner l'adresse du serveur GLPI en complétant par `/front/inventory.php`,  
   ce qui donne pour notre domaine `http://192.168.0.7/glpi.ekoloclast.lan/front/inventory.php`   
![gpo4]()  
   - Ajoutez de nouveaux un **Elément Registre** est renseigner le nom par defaut `tag` et données de valeur le nom du domaine `ekoloclast.lan`  
![gpo5](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/glpi-agent/gpo5.png)   

### Étape 5 : Tester l'installation

1. **Forcer la mise à jour des stratégies de groupe** :
   - Sur un ordinateur client, ouvrez une invite de commandes et exécutez `gpupdate /force`.

2. **Vérifiez l'installation** :
   - Vérifiez si GLPI-Agent est installé en allant dans le Panneau de configuration > Programmes > Programmes et fonctionnalités.
   - Assurez-vous que le service `GLPI-Agent` est en cours d'exécution.

### Conclusion

Vous avez maintenant configuré GLPI-Agent pour qu'il s'installe automatiquement via une GPO sur le domaine `ekoloclast.lan`. Vous pouvez surveiller et gérer vos machines à partir de votre serveur GLPI. Si vous rencontrez des problèmes ou avez besoin d'ajuster la configuration, n'hésitez pas à consulter la documentation officielle de GLPI ou à demander de l'aide.

## Ressources

- [Site officiel de GLPI](https://glpi-project.org/)
- [Documentation de GLPI-Agent](https://glpi-agent.readthedocs.io/)
