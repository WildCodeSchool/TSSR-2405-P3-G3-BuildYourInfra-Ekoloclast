<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div


# Installation et Configuration d'un Routeur VyOS

## Prérequis

1. **Serveur DHCP**: 192.168.0.4
2. **Sous-réseaux**: 192.168.0.0/24 à 192.168.10.0/24
3. **DMZ**: 192.168.11.0/24
4. **Route par défaut**: [Adresse IP de la passerelle par défaut]

## Étape 1: Installation de VyOS
Télécharger l'iso de vyos sur le site https://vyos.io/  
Créer une clé bootable.  
Démarrez votre machine avec la clé USB bootable et suivez les instructions à l'écran pour installer VyOS.

## Étape 2: Configuration de VyOS
### Étape 2.1: Configuration initiale
Connectez-vous à VyOS via SSH ou console série.

```bash
ssh vyos@192.168.0.1
```
### Étape 2.2: Configuration des interfaces réseau
Configurez les interfaces réseau pour chaque sous-réseau et la DMZ.

```bash
configure
set interfaces ethernet eth0 address 192.168.0.1/24
set interfaces ethernet eth1 address 192.168.1.1/24
set interfaces ethernet eth2 address 192.168.2.1/24
set interfaces ethernet eth3 address 192.168.3.1/24
set interfaces ethernet eth4 address 192.168.4.1/24
set interfaces ethernet eth5 address 192.168.5.1/24
set interfaces ethernet eth6 address 192.168.6.1/24
set interfaces ethernet eth7 address 192.168.7.1/24
set interfaces ethernet eth8 address 192.168.8.1/24
set interfaces ethernet eth9 address 192.168.9.1/24
set interfaces ethernet eth10 address 192.168.10.1/24
set interfaces ethernet eth11 address 192.168.11.1/24
commit
save
exit
```
### Étape 2.3: Configuration du routage
Configurez le routage entre tous les sous-réseaux et la DMZ.

```bash
configure
set protocols static route 192.168.0.0/24 next-hop 192.168.0.1
set protocols static route 192.168.1.0/24 next-hop 192.168.1.1
set protocols static route 192.168.2.0/24 next-hop 192.168.2.1
set protocols static route 192.168.3.0/24 next-hop 192.168.3.1
set protocols static route 192.168.4.0/24 next-hop 192.168.4.1
set protocols static route 192.168.5.0/24 next-hop 192.168.5.1
set protocols static route 192.168.6.0/24 next-hop 192.168.6.1
set protocols static route 192.168.7.0/24 next-hop 192.168.7.1
set protocols static route 192.168.8.0/24 next-hop 192.168.8.1
set protocols static route 192.168.9.0/24 next-hop 192.168.9.1
set protocols static route 192.168.10.0/24 next-hop 192.168.10.1
set protocols static route 192.168.11.0/24 next-hop 192.168.11.1
commit
save
exit
```
### Étape 2.4: Configuration du relais DHCP
Configurez le relais DHCP pour rediriger les requêtes DHCP vers le serveur DHCP (192.168.0.4).

```bash
configure
set service dhcp-relay interface eth0 server 192.168.0.4
set service dhcp-relay interface eth1 server 192.168.0.4
set service dhcp-relay interface eth2 server 192.168.0.4
set service dhcp-relay interface eth3 server 192.168.0.4
set service dhcp-relay interface eth4 server 192.168.0.4
set service dhcp-relay interface eth5 server 192.168.0.4
set service dhcp-relay interface eth6 server 192.168.0.4
set service dhcp-relay interface eth7 server 192.168.0.4
set service dhcp-relay interface eth8 server 192.168.0.4
set service dhcp-relay interface eth9 server 192.168.0.4
set service dhcp-relay interface eth10 server 192.168.0.4
set service dhcp-relay interface eth11 server 192.168.0.4
commit
save
exit
```
### Étape 2.5: Configuration de la route par défaut
Configurez la route par défaut pour le routeur VyOS.

```bash
configure
set protocols static route 0.0.0.0/0 next-hop [10.10.10.2]
commit
save
exit
```
## Étape 3: Vérification de la configuration
### Étape 3.1: Vérification des interfaces réseau
```bash 
show interfaces
```
### Étape 3.2: Vérification du routage
```bash
show ip route
```
### Étape 3.3: Vérification du relais DHCP
```bash
show service dhcp-relay
```
## Conclusion
Vous avez maintenant installé et configuré un routeur VyOS avec 11 sous-réseaux de 192.168.0.0/24 à 192.168.10.0/24 et une DMZ en 192.168.11.0/24. Le serveur DHCP est sur 192.168.0.4, et le routage est configuré entre tous les réseaux avec un relais DHCP fonctionnel. La route par défaut est également configurée.