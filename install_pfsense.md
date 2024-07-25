<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/charte/logo.png)   
![slogan](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/charte/slogan.png)
</div>    


# Installation de pfSense
Pré-requis  
Une machine compatible (PC, serveur, machine virtuelle)  
Une image ISO de pfSense  
Un logiciel pour créer une clé USB bootable (par exemple, Rufus)  
Une clé USB d’au moins 1 Go  
## Étapes d'installation
Télécharger pfSense

Rendez-vous sur le site officiel de pfSense (pfsense.org) et téléchargez l’image ISO correspondant à votre architecture (32-bit ou 64-bit).

Créer une clé USB bootable  

Utilisez un logiciel comme Rufus pour créer une clé USB bootable avec l’image ISO de pfSense.  

Sélectionnez votre clé USB
Sélectionnez l’image ISO téléchargée
Démarrez la création de la clé USB bootable
Démarrer à partir de la clé USB

Insérez la clé USB dans la machine sur laquelle vous souhaitez installer pfSense.  
Redémarrez la machine et configurez le BIOS/UEFI pour démarrer à partir de la clé USB.  

### Installer pfSense

Lorsque le système démarre à partir de la clé USB, vous verrez le menu de démarrage de pfSense.  
Suivez les instructions à l'écran pour l'installation. Les options par défaut conviennent dans la plupart des cas.  
Choisissez votre schéma de partitionnement.   
Laissez les options par défaut.
Lorsque l’installation est terminée, le système vous demandera de retirer la clé USB et de redémarrer.
Configuration initiale.  

Après le redémarrage, pfSense vous demandera de configurer les interfaces réseau.

Assignez les interfaces réseau à vos cartes (em0, em1, em2, etc.)
Configurez l'interface WAN, LAN, et DMZ selon vos besoins.  

# Configuration de pfSense avec 3 cartes réseau

## Assigner les Interfaces
La Premiere configuration ce passe sur l'interface de Pfsense .
On commence par assigner les interfaces réseaux
![ecran](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s02/ressources/pfsense/ecran.png)   
On choisie l'option `1) Assign Interfaceset` et  on assigne la bonne interface à la WAN, celle de la LAN et pour fini du DMZ.  

 

## Configurer les Adresses IP

Pour configurer les adresses IP, sélectionnez `2) Set interface(s) IP address.` Suivez les étapes ci-dessous pour chaque interface :

WAN (em1)

- Lorsque demandé de sélectionner l'interface à configurer, choissisez WAN .  
- Ensuite, entrez l'adresse IP : 10.0.0.5.  
- Entrez le masque de sous-réseau en CIDR (pour /29, c'est 29).  
- Lorsque demandé pour l'adresse IPv6, appuyez sur Entrée pour ignorer.
- Lorsque demandé pour la passerelle, entrez l'adresse de la passerelle (par exemple, 10.0.0.1).  

LAN (em0)

- Sélectionnez lan pour configurer l'interface LAN.
- Entrez l'adresse IP : 192.168.1.50.
- Entrez le masque de sous-réseau en CIDR (pour /16, c'est 16).
- Lorsque demandé pour l'adresse IPv6, appuyez sur Entrée pour ignorer.
- Vous n'avez généralement pas besoin de passerelle pour l'interface LAN.

DMZ (em2)

- Sélectionnez l'interface que vous souhaitez configurer pour la DMZ (par exemple, opt1).
Pour l'instant, ne configurez pas d'adresse IP (appuyez sur Entrée pour passer).
Finalisation

Après avoir configuré les adresses IP, la console vous demandera si vous voulez activer le serveur DHCP sur l'interface LAN, Nous ne l'activerons pas car nous avons déja notre serveur AD qui joue ce rôle.  

### Redémarrer ou Vérifier la Configuration

Vous pouvez redémarrer pfSense pour appliquer toutes les configurations en sélectionnant `5) Reboot system` dans le menu principal.  
Pour vérifier la configuration, vous pouvez utiliser l'option `8) Shell` pour accéder à la ligne de commande et utiliser des commandes comme ifconfig pour afficher les paramètres des interfaces réseau.

Si les configuration sont bonne, allez sur un pc client (dans le même reseaux que le Pfsense), ouvrez le navigateur et connecter vous au Pfsense aec l'adresse de la LAn `192.168.1.50`  
Le login par defaut est `admin` et le mot de passe est `pfsense`.  




