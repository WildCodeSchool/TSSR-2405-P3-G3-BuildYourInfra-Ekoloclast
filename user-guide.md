<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/charte/logo.png)   
![slogan](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/charte/slogan.png)
</div>  

# Présentation de l'Infrastructure Informatique

# Introduction

Cette documentation présente l'infrastructure informatique pour notre entreprise.Nous allons séparer le reseau informatique en 10 départements distincts. Chaque département disposera de son propre réseau, et l'ensemble de l'infrastructure inclura un serveur Active Directory (AD) avec des services DHCP et DNS, ainsi qu'une solution de réplication pour assurer la redondance et la continuité de service. Dans l'optique d'une évolution de notre société, le matériel est prévue pour acceuillir de nouveaux collaborateur et de nouveaux services.

## Organisation de la société 
<div align="center">

![image](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-1.png)  

![image2](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-2.png)  

![image3](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-3.png)

![image4](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-4.png)

![image4](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-5.png)  

![image5](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-6.png)

![image6](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-7.png)

![image7](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-7.png)

![image8](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/main/ressources/organigramme/organigramme-9.png)
</div>

## Nomenclature
Pour une utilisation plus simple une nomenclature clair sera appliquer :  
- Chaque employer aura un login sous la forme **p.nomxxx** la premier lettre du prénoms . le nom complet et 3 chiffres aléatoires afin d'éviter les doublons .
 - Chaque poste sera renommer pour avoir un nom sous la forme **nom du groupe.xxx** xxx étant un numéro identifiant .

 Un fichier excel sera réasiler en même temps afin de faire le suivi des changements.
## Arborescence active directory  
Dans Active Directory nous alons créer une unité d'organisation (OU) par département, afin de pouvoir gérer les departements indépendament.  
Dans chaque OU de département, sera crée un utilisateur de ce département.   

# Structure de l'Infrastructure
Pour établir un réseau pour la société comprenant aujourd'hui 183 personnes réparties dans 10 départements, nous allons sélectionner le matériel Cisco approprié pour couvrir les besoins en commutation, routage, sécurité et connectivité sans fil.   
Les poste utilisateur seront mis à jour vers windows 10 et les postes trop ancien devrons être remplacés.   
 Voici une liste du matériel Cisco recommandé :

### 1. Routeurs

**Cisco ISR (Integrated Services Routers)** :
- **Cisco ISR 4431**
  - Description : Routeur pour petites et moyennes entreprises, offrant des capacités de routage avancées, VPN, sécurité, et performance élevée.
  - Quantité : 1

### 2. Switches

**Cisco Catalyst Switches** :
- **Cisco Catalyst 9300 Series** (Layer 3 managed switch, capable de supporter PoE+ pour les points d'accès et téléphones IP)
  - Modèle : **C9300-48P-E**
  - Description : 48-port, PoE+, capable de supporter les besoins actuels et futurs.
  - Quantité : 3 (pour redondance et couverture suffisante)

### 3. Points d'accès sans fil

**Cisco Aironet ou Cisco Catalyst Access Points** :
- **Cisco Catalyst 9115AX Series**
  - Description : Point d'accès Wi-Fi 6 pour une couverture et une performance sans fil optimales.
  - Quantité : 6 (pour une couverture sans fil robuste et redondante dans les locaux)

### 4. Contrôleur sans fil

**Cisco Wireless Controller** :
- **Cisco 9800 Series Wireless Controllers**
  - Modèle : **Cisco Catalyst 9800-40 Wireless Controller**
  - Description : Contrôleur sans fil pour gérer les points d'accès et les réseaux sans fil de manière centralisée.
  - Quantité : 1

### 5. Pare-feu et sécurité

**Cisco Firepower Next-Generation Firewall** :
- **Cisco Firepower 2110**
  - Description : Pare-feu de nouvelle génération offrant des fonctionnalités avancées de sécurité, y compris le filtrage des applications, le filtrage URL, et la prévention des intrusions.
  - Quantité : 1

### 6. Gestion et surveillance du réseau

**Cisco Prime Infrastructure** :
- **Cisco Prime Infrastructure**
  - Description : Solution de gestion réseau unifiée pour la surveillance, la gestion et l'optimisation des réseaux câblés et sans fil.
  - Quantité : 1 (licence pour le nombre de périphériques en question)

### 7. Téléphones IP (si nécessaire)

**Cisco IP Phones** :
- **Cisco IP Phone 8800 Series**
  - Modèle : **Cisco IP Phone 8841**
  - Description : Téléphone IP de bureau avec des fonctionnalités avancées pour la communication d'entreprise.
  - Quantité : En fonction du nombre de postes téléphoniques nécessaires, par exemple 50

### 8. Modules d'interface réseau (si nécessaire)

**Cisco Network Interface Modules** :
- **Cisco NIM-2FXO (pour les lignes téléphoniques analogiques)**
  - Description : Module d'interface pour les connexions téléphoniques analogiques.
  - Quantité : En fonction des besoins

### Résumé du matériel :

- **Routeur** :
  - Cisco ISR 4431 : 1
- **Switches** :
  - Cisco Catalyst 9300-48P-E : 3
- **Points d'accès sans fil** :
  - Cisco Catalyst 9115AX Series : 6
- **Contrôleur sans fil** :
  - Cisco Catalyst 9800-40 Wireless Controller : 1
- **Pare-feu** :
  - Cisco Firepower 2110 : 1
- **Gestion du réseau** :
  - Cisco Prime Infrastructure : 1
- **Téléphones IP** :
  - Cisco IP Phone 8841 : 50 (exemple)
- **Modules d'interface réseau** :
  - Cisco NIM-2FXO : Selon les besoins

Cette liste de matériel Cisco est conçue pour répondre aux besoins actuels de la société tout en permettant une expansion future. Elle couvre les aspects de routage, de commutation, de sécurité, de connectivité sans fil et de gestion du réseau.

## Plan d'adressage IP
Afin d'anticiper une expansion significative à l'avenir nous utiliseraons le réseau 192.168.0.0/16.  Un réseau /16 offre 65 536 adresses (dont 65 534 utilisables), ce qui est largement suffisant pour couvrir les besoins actuels et futurs et nous allons attribuer des sous-réseaux à chaque département.

#### Informations générales :
- Réseau principal : 192.168.0.0/16
- Total d'adresses disponibles : 65 534 (après exclusion de l'adresse de réseau et de diffusion)

### Sous-réseaux par département

Pour garantir une organisation claire et permettre une expansion future significative, nous allons utiliser des sous-réseaux /24, ce qui donne 256 adresses par sous-réseau (254 utilisables).

1. **Communication : 20 employés (prévoir expansion jusqu'à 100)**
   - Sous-réseau : 192.168.1.0/24
   - Adresses disponibles : 192.168.1.1 à 192.168.1.254

2. **Direction Financière : 14 employés (prévoir expansion jusqu'à 50)**
   - Sous-réseau : 192.168.2.0/24
   - Adresses disponibles : 192.168.2.1 à 192.168.2.254

3. **Direction Générale : 8 employés (prévoir expansion jusqu'à 30)**
   - Sous-réseau : 192.168.3.0/24
   - Adresses disponibles : 192.168.3.1 à 192.168.3.254

4. **Direction Marketing : 22 employés (prévoir expansion jusqu'à 100)**
   - Sous-réseau : 192.168.4.0/24
   - Adresses disponibles : 192.168.4.1 à 192.168.4.254

5. **DSI : 12 employés (prévoir expansion jusqu'à 50)**
   - Sous-réseau : 192.168.5.0/24
   - Adresses disponibles : 192.168.5.1 à 192.168.5.254

6. **R&D : 17 employés (prévoir expansion jusqu'à 100)**
   - Sous-réseau : 192.168.6.0/24
   - Adresses disponibles : 192.168.6.1 à 192.168.6.254

7. **RH : 24 employés (prévoir expansion jusqu'à 100)**
   - Sous-réseau : 192.168.7.0/24
   - Adresses disponibles : 192.168.7.1 à 192.168.7.254

8. **Services Généraux : 12 employés (prévoir expansion jusqu'à 50)**
   - Sous-réseau : 192.168.8.0/24
   - Adresses disponibles : 192.168.8.1 à 192.168.8.254

9. **Service Juridique : 8 employés (prévoir expansion jusqu'à 30)**
   - Sous-réseau : 192.168.9.0/24
   - Adresses disponibles : 192.168.9.1 à 192.168.9.254

10. **Ventes et Développement Commercial : 46 employés (prévoir expansion jusqu'à 200)**
    - Sous-réseau : 192.168.10.0/24
    - Adresses disponibles : 192.168.10.1 à 192.168.10.254

### Configuration IP des matériels réseaux :

- **Routeur**
  - Adresse IP : 192.168.0.1

- **Switches**
  - Switch 1 : 192.168.0.2
  - 
- **Points d'accès Wi-Fi**
  - Point d'accès 1 : 192.168.0.3

- **Serveurs**
  - Serveur DHCP : 192.168.0.4
  - Serveur DNS : 192.168.0.5
  - Serveur de fichiers : 192.168.0.6

### Réserve pour expansion future :

Nous avons attribué des sous-réseaux /24 à chaque département, offrant une grande capacité d'expansion. De plus, il reste de nombreux sous-réseaux disponibles pour de nouveaux départements ou une expansion future :

- **Expansion future**
  - Sous-réseaux disponibles : 192.168.11.0/24 à 192.168.255.0/24

### Résumé des adresses IP par département avec plan d'expansion future :

- **Communication** : 192.168.1.1 - 192.168.1.254
- **Direction Financière** : 192.168.2.1 - 192.168.2.254
- **Direction Générale** : 192.168.3.1 - 192.168.3.254
- **Direction Marketing** : 192.168.4.1 - 192.168.4.254
- **DSI** : 192.168.5.1 - 192.168.5.254
- **R&D** : 192.168.6.1 - 192.168.6.254
- **RH** : 192.168.7.1 - 192.168.7.254
- **Services Généraux** : 192.168.8.1 - 192.168.8.254
- **Service Juridique** : 192.168.9.1 - 192.168.9.254
- **Ventes et Développement Commercial** : 192.168.10.1 - 192.168.10.254

### Adresses pour les équipements réseau :

- **Routeur** : 192.168.0.1
- **Switches** : 192.168.0.2
- **Points d'accès Wi-Fi** : 192.168.0.3
- **Serveurs** : 192.168.0.4 - 192.168.0.6

Ce plan d'adressage IP en /16 assure que chaque département dispose d'une plage d'adresses IP suffisante pour ses besoins actuels et futurs, tout en laissant de la place pour des équipements réseau et des extensions futures importantes.

## Table de routage 
Afin de permettre la communication entre les services, une table de routage est appliqué aux routeurs.  

## Configuration des Services

### Serveur Active Directory (AD)
Chaque département disposera de son propre serveur AD pour gérer les utilisateurs, les groupes, et les ressources spécifiques au département. Les serveurs AD seront configurés pour synchroniser les informations via une forêt AD commune.

### DHCP
Les serveurs DHCP seront configurés pour attribuer des adresses IP dynamiques aux machines de chaque département, en s'assurant qu'aucun conflit d'adresse IP ne survienne entre les différents réseaux.

### DNS
Les serveurs DNS assureront la résolution des noms de domaine internes, facilitant la communication entre les différents départements et assurant une navigation réseau efficace.

## Solution de Réplication

Pour garantir la continuité de service et la redondance, une solution de réplication sera mise en place entre les différents serveurs AD. Cette réplication permettra de synchroniser les informations critiques et de garantir l'intégrité des données en cas de défaillance d'un des serveurs.

### Réplication AD
Les serveurs AD seront configurés pour une réplication multi-maître, assurant que chaque modification apportée à un serveur est répliquée sur les autres serveurs AD de la forêt.

### Réplication des Données
Une solution de réplication des données, telle que DFS-R (Distributed File System Replication), sera utilisée pour synchroniser les fichiers et les données critiques entre les différents serveurs de l'organisation.

## Solution de stockage en ligne 


# Conclusion

Cette infrastructure informatique est conçue pour offrir une gestion efficace des ressources et des services au sein de chaque département, tout en assurant une haute disponibilité et une continuité de service grâce à une solution de réplication robuste.




