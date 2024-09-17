<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>

# Documentation d'installation Asterisk pour Ekoloclast

## 1. Contexte

Cette documentation détaille l'installation et la configuration d'Asterisk pour la société Ekoloclast.

### 1.1 Informations générales

- **Domaine** : ekoloclast.lan
- **Serveur DHCP et AD** : 192.168.0.4
- **Serveur Asterisk** : 192.168.0.9
- **Utilisateurs** : Synchronisés depuis l'Active Directory (AD)

### 1.2 Plan de numérotation
Voici la liste des départements avec leur plage de numérotation associée :

Direction : 1000-1039
Ressources Humaines : 2000-2039
Juridique : 3000-3039
Marketing : 4000-4039
Finance : 5000-5039
DSI : 6000-6039
Recherche et Développement : 7000-7039
Communication : 8000-8039
Innovation : 9000-9039
Services Généraux : 0000-0039

## 2. Prérequis

- Serveur dédié pour Asterisk (IP : 192.168.0.9)
- Accès administrateur au serveur AD (IP : 192.168.0.4)
- Connexion réseau stable

## 3. Installation d'Asterisk

### 3.1 Mise à jour du système

```bash
sudo apt update && sudo apt upgrade -y
```

### 3.2 Installation des dépendances

```bash
sudo apt install git curl wget libnewt-dev libssl-dev libncurses5-dev subversion libsqlite3-dev build-essential libjansson-dev libxml2-dev uuid-dev
```

### 3.3 Téléchargement et compilation d'Asterisk

```bash
cd /usr/src/
sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz
sudo tar xvf asterisk-18-current.tar.gz
cd asterisk-18*/
sudo ./configure
sudo make
sudo make install
sudo make samples
sudo make config
```

## 4. Configuration d'Asterisk

### 4.1 Configuration du fichier sip.conf

Editez le fichier `/etc/asterisk/sip.conf` :

```ini
[general]
context=default
allowguest=no
alwaysauthreject=yes
bindaddr=0.0.0.0
tcpenable=yes
transport=udp,tcp

[template](!)
type=friend
host=dynamic
qualify=yes
nat=force_rport,comedia
context=from-internal
```

### 4.2 Configuration du plan de numérotation

Editez le fichier `/etc/asterisk/extensions.conf` :

```ini
[from-internal]
;Direction
exten => _1XXX,1,Dial(SIP/${EXTEN})
;Ressources Humaine
exten => _2XXX,1,Dial(SIP/${EXTEN})
;Juridique
exten => _3XXX,1,Dial(SIP/${EXTEN})
;Marketing
exten => _4XXX,1,Dial(SIP/${EXTEN})
;Finance
exten => _5XXX,1,Dial(SIP/${EXTEN})
;DSI
exten => _6XXX,1,Dial(SIP/${EXTEN})
;Recherche et developpement
exten => _7XXX,1,Dial(SIP/${EXTEN})
;Communication
exten => _8XXX,1,Dial(SIP/${EXTEN})
;Innovation
exten => _9XXX,1,Dial(SIP/${EXTEN})
;Service généraux
exten => _0XXX,1,Dial(SIP/${EXTEN})
```

## 5. Intégration avec Active Directory

### 5.1 Installation de LDAP

```bash
sudo apt install libpam-ldap nscd
```

### 5.2 Configuration de la connexion LDAP

Editez le fichier `/etc/ldap.conf` :

```
base dc=ekoloclast,dc=lan
uri ldap://192.168.0.4
binddn cn=asteriskuser,cn=Users,dc=ekoloclast,dc=lan
bindpw VotreMotDePasse
```

## 6. Plan de numérotation

- Direction : 1000-1039
- Ressources Humaine : 2000-2039
- Juridiqu : 3000-3039
- Marketing : 4000-4039
- Finance : 5000-5039
- DSI : 6000-6039
- Recherche et developpement : 7000-7039
- Communication : 8000-8039
- Innovation : 9000-9039
- Service généraux : 0000-0039

## 7. Sécurité

- Assurez-vous que le pare-feu autorise uniquement le trafic SIP nécessaire.
- Utilisez des mots de passe forts pour tous les comptes.
- Mettez régulièrement à jour Asterisk et le système d'exploitation.

## 8. Test et déploiement

1. Testez la connexion entre Asterisk et AD.
2. Créez quelques utilisateurs de test et vérifiez leur fonctionnement.
3. Déployez progressivement pour chaque département.

## 9. Maintenance

- Surveillez les logs Asterisk régulièrement.
- Planifiez des sauvegardes régulières de la configuration.
- Mettez en place une surveillance du système et des alertes.
