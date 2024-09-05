Voici un guide d'installation de Zimbra pour le domaine ekoloclast.lan, avec le serveur sur l'adresse IP 192.168.0.2 et le serveur DNS ainsi que l'Active Directory (AD) sur l'adresse 192.168.0.4. L'authentification LDAP sera utilisée. Ce document est au format Markdown.

markdown
Copier le code
# Installation de Zimbra pour le domaine ekoloclast.lan

## Prérequis

1. **Serveur Zimbra** :
   - Adresse IP : `192.168.0.2`
   - OS recommandé : Ubuntu 20.04 ou CentOS 7
   - 8 Go de RAM minimum
   - 10 Go d'espace disque pour l'installation initiale (ajuster selon vos besoins)

2. **Serveur DNS et Active Directory (AD)** :
   - Adresse IP du DNS : `192.168.0.4`
   - Domaine AD : `ekoloclast.lan`
   - Authentification via LDAP

## Étape 1 : Préparer le serveur Zimbra

### 1.1 Mettre à jour le serveur

```bash
sudo apt update && sudo apt upgrade -y
```
### 1.2 Configurer le fichier /etc/hosts  

Ajoutez les lignes suivantes au fichier /etc/hosts :

```bash
192.168.0.2   mail.ekoloclast.lan   mail
192.168.0.4   ad.ekoloclast.lan     ad
```
### 1.3 Installez maintenant Dnsmasq
```bash
apt install dnsmasq -y
```
Configuration de Dnsmasq
Prenez la sauvegarde du fichier de configuration Dnsmasq existant et modifiez le fichier
```bash
cp /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
nano /etc/dnsmasq.conf
```
Insérez le contenu suivant en bas et n'oubliez pas de remplacer l'adresse IP et le nom de domaine
```bash
server= 192.168.0.2
domaine= ekoloclast.lan
mx-host= ekoloclast.lan, mail.ekoloclast.lan , 5
mx-host= mail.ekoloclast.lan, mail.ekoloclast.lan  5​
listen_address= 127.0.0.1
```

### 1.4 Configurer le DNS
Assurez-vous que le serveur DNS (à l'adresse 192.168.0.4) est correctement configuré pour résoudre le domaine ekoloclast.lan. Testez la résolution DNS avec :

```bash

nslookup mail.ekoloclast.lan
```
## Étape 2 : Installation de ZIMBRA

Téléchargez la dernière version de Zimbra :

```bash
wget https://github.com/maldua/zimbra-foss-builder/releases/download/zimbra-foss-build-ubuntu-22.04/10.1.0/zcs-10.1.0_GA_4200000.UBUNTU22_64.20240727100104.tgz
tar xzf zcs-NNNN_OS.tgz
cd zcs-NNNN_OS
sudo ./install.sh
```
## Étape 3 : Configuration de Zimbra
### 3.1 Lancer l'installation
Acceptez les termes de la licence et suivez les étapes à l'écran. Pendant l'installation, choisissez les composants suivants :
``` 
Zimbra LDAP : Oui  
Zimbra MTA : Oui  
Zimbra Store : Oui  
Zimbra Logger : Oui  
Zimbra SNMP : Non (optionnel)  
Zimbra Spell : Oui  
Zimbra Proxy : Non (selon la configuration)  
``` 
## 3.2 Configurer le serveur LDAP pour l'authentification
Lorsque vous êtes invité à configurer LDAP, entrez les informations suivantes :

LDAP URL : ldap://192.168.0.4
Base DN : DC=ekoloclast,DC=lan
Admin DN : CN=Administrator,CN=Users,DC=ekoloclast,DC=lan
Mot de passe : [mot de passe de l'admin AD]
Assurez-vous que Zimbra peut communiquer avec le serveur Active Directory pour l'authentification des utilisateurs.

### Étape 4 : Configurer le DNS MX et les enregistrements A
Sur le serveur DNS (192.168.0.4), assurez-vous que les enregistrements MX et A sont configurés correctement.

Ajoutez un enregistrement A pour mail.ekoloclast.lan pointant vers 192.168.0.2 et un enregistrement MX pour le domaine ekoloclast.lan pointant vers mail.ekoloclast.lan.

### Étape 5 : Finaliser l'installation
Après la configuration de Zimbra, démarrez les services :

```bash
sudo su - zimbra
zmcontrol restart
```
Vérifiez que tous les services Zimbra sont démarrés correctement :

```bash
zmcontrol status

```

## 6.Configuration ZIMBRA
Il nous faut maintenant configurer le DNS Master et le mot de passe administrateur 
```bash
Main menu

   1) Common Configuration:
   2) zimbra-ldap:                             Enabled
   3) zimbra-logger:                           Enabled
   4) zimbra-mta:                              Enabled
   5) zimbra-dnscache:                         Enabled
******* +Master DNS IP address(es):            UNSET
        +Enable DNS lookups over TCP:          yes
        +Enable DNS lookups over UDP:          yes
        +Only allow TCP to communicate with Master DNS: no                        

   6) zimbra-snmp:                             Enabled
   7) zimbra-store:                            Enabled
        +Create Admin User:                    yes
        +Admin user to create:                 admin@mail.ekoloclast.lan
******* +Admin Password                        UNSET
        +Anti-virus quarantine user:           virus-quarantine.c73xqgvr@mail.ekoloclast.lan
        +Enable automated spam training:       yes
        +Spam training user:                   spam.g1kkn_0g6l@ekoloclast.lan
        +Non-spam(Ham) training user:          ham.tzkyhmqk2a@mail.ekoloclast.lan
        +SMTP host:                            mail.ekoloclast.lan
        +Web server HTTP port:                 8080
        +Web server HTTPS port:                8443
        +Web server mode:                      https
        +IMAP server port:                     7143
        +IMAP server SSL port:                 7993
        +POP server port:                      7110
        +POP server SSL port:                  7995
        +Use spell check server:               yes
        +Spell server URL:                     http://mail.ekoloclast.lan:7780/aspell.php
        +Enable version update checks:         TRUE
        +Enable version update notifications:  TRUE
        +Version update notification email:    admin@mail.ekoloclast.lan
        +Version update source email:          admin@mail.ekoloclast.lan
        +Install mailstore (service webapp):   yes
        +Install UI (zimbra,zimbraAdmin webapps): yes

   8) zimbra-spell:                            Enabled
   9) zimbra-proxy:                            Enabled
  10) Default Class of Service Configuration:
   s) Save config to file
   x) Expand menu
   q) Quit
   ```

Il faut modifier les infos avec les étoiles devant en premier on choisi 5 et on change de page 
```bash
Address unconfigured (**) items  (? - help) 5
 
DNS Cache configuration
 
   1) Status:                                  Enabled
** 2) Master DNS IP address(es):               UNSET
   3) Enable DNS lookups over TCP:             yes
   4) Enable DNS lookups over UDP:             yes
   5) Only allow TCP to communicate with Master DNS: no
 
Select, or 'r' for previous menu [r] 2
 
IP Address(es) of Master DNS Server(s), space separated: 192.168.0.4
```
ensuite on choisi (r) pour revenir au menu.

On refait la même avec 7 pour le mot de passe administrateur .
```bash
ddress unconfigured (**) items  (? - help) 7
 
 
Store configuration
 
   1) Status:                                  Enabled
   2) Create Admin User:                       yes
   3) Admin user to create:                    admin@mail.ekoloclast.lan
** 4) Admin Password                           UNSET
   5) Anti-virus quarantine user:              virus-quarantine.3liys4nw@mail.ekoloclast.lan
   6) Enable automated spam training:          yes
   7) Spam training user:                      spam.cfzvesa2d5@mail.ekoloclats.lan
   8) Non-spam(Ham) training user:             ham.ofijq5m5@mail.ekoloclast.lan
   9) SMTP host:                               mail.ekoloclast.lan
  10) Web server HTTP port:                    8080
  11) Web server HTTPS port:                   8443
  12) Web server mode:                         https
  13) IMAP server port:                        7143
  14) IMAP server SSL port:                    7993
  15) POP server port:                         7110
  16) POP server SSL port:                     7995
  17) Use spell check server:                  yes
  18) Spell server URL:                        http://mail.ekoloclast.lan:7780/aspell.php
  19) Enable version update checks:            TRUE
  20) Enable version update notifications:     TRUE
  21) Version update notification email:       admin@mail.ekoloclast.lan
  22) Version update source email:             admin@mail.ekoloclast.lan
  23) Install mailstore (service webapp):      yes
  24) Install UI (zimbra,zimbraAdmin webapps): yes
  ```
  Vous pouvez maintenant ouvrir l'accès à Zimbra depuis le navigateur. Accédez à `https://mail.ekoloclast.lan:7071` et saisissez le nom d'utilisateur admin et le mot de passe choisi. ### Étape 6 : Accès à l'interface d'administration Zimbra

### Étape 7 : Tests et vérifications
Tester la réception d'emails : Envoyez un email à un utilisateur pour tester la configuration.
Tester l'authentification LDAP : Créez un compte utilisateur dans l'AD et vérifiez si vous pouvez vous connecter à Zimbra avec ces identifiants.
Vérifier les journaux : En cas de problème, vérifiez les journaux dans /var/log/zimbra.log.
Conclusion
Vous avez maintenant installé et configuré Zimbra pour le domaine ekoloclast.lan avec l'authentification LDAP via Active Directory.  