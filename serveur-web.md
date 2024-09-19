<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>

# Documentation pour l'Installation du Site Web Ekoloclast

## Introduction

Cette documentation décrit les étapes nécessaires pour installer et configurer le site web Ekoloclast, qui comporte plusieurs pages HTML avec des styles de fond distincts.

## Prérequis

- Un serveur web Apache installé sur votre machine.
- Accès à la ligne de commande (CLI).
- Un éditeur de texte pour créer et modifier des fichiers HTML et CSS.

## Mise en place
1. Créer le Répertoire du Site
Créez un répertoire pour le site web :
```bash
sudo mkdir /var/www/ekoloclast
```
2. Ajouter à ce dossier les page HTML créées.
3. Configurer Apache

Créez un fichier de configuration pour le site :
```bash
sudo nano /etc/apache2/sites-available/ekoloclast.lan.conf
```
Ajoutez le contenu suivant :
```bash
<VirtualHost *:80>
    ServerName ekoloclast.lan  
    DocumentRoot /var/www/ekoloclast

    <Directory /var/www/ekoloclast>
        Options Indexes FollowSymLinks  
        AllowOverride All  
        Require all granted  
    </Directory>

    ErrorLog /var/log/apache2/ekoloclast_error.log  
    CustomLog /var/log/apache2/ekoloclast_access.log combined  
</VirtualHost>
```
4. Activer le Site
Activez le site et désactivez le site par défaut :
```bash
sudo a2ensite ekoloclast.lan.conf  
sudo a2dissite 000-default.conf
```
5. Redémarrer Apache
Redémarrez le serveur Apache pour appliquer les modifications :
```bash
sudo systemctl restart apache2
```
6. Modifier le Fichier Hosts (Facultatif)
Pour accéder à votre site via http://site.ekoloclast.lan/, ajoutez une entrée de type hosts sur la machine :
```bash
sudo nano /etc/hosts
```
Ajoutez la ligne suivante :
```bash
192.168.0.54 site.ekoloclast.lan
```
7. Accéder au Site
Vous pouvez maintenant accéder à votre site via http://site.ekoloclast.lan/ ou http://192.168.0.54

