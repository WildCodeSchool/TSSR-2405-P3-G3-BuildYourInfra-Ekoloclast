 <div align="center">

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)

</div>

# Documentation pour l'Installation d'Apache2 sur une Machine Debian 12

## Introduction

Cette documentation décrit les étapes nécessaires pour installer et configurer le serveur web Apache2 sur une machine Debian 12.

## Prérequis

- Une machine Debian 12 installée.
- Accès à la ligne de commande (CLI).
- Connexion Internet pour télécharger les paquets nécessaires.

## Mise en place

### 1. Mettre à jour les paquets

Avant d'installer Apache2, assurez-vous que votre système est à jour.

```bash
sudo apt update
sudo apt upgrade
```
2. Installer Apache2
Installez Apache2 en utilisant la commande suivante :
```bash

sudo apt install apache2
```
3. Vérifier l'installation
Pour vérifier que Apache2 est installé et fonctionne correctement, ouvrez un navigateur web et accédez à http://votre_adresse_ip ou http://localhost. Vous devriez voir la page par défaut d'Apache2