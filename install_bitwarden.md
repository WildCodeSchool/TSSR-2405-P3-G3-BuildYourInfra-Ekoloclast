<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>

# Procédure d'installation
## Configurez votre domaine
Par défaut, Bitwarden sera servi via les ports 80 (http) et 443 (https) sur la machine hôte. Ouvrez ces ports afin que Bitwarden puisse être accessible depuis l'intérieur et/ou l'extérieur du réseau. Vous pouvez choisir différents ports lors de l'installation.

Nous recommandons de configurer le nom de domaine avec des enregistrements DNS qui pointent vers votre machine hôte (par exemple, bitwarden.example.com), surtout si vous servez Bitwarden sur Internet.

## Installez Docker et Docker Compose
Bitwarden sera déployé et exécuté sur votre machine en utilisant un ensemble de conteneurs Docker. Bitwarden peut être exécuté avec n'importe quelle édition ou plan Docker. Évaluez quelle édition est la meilleure pour votre installation.

Le déploiement de conteneurs est orchestré en utilisant Docker Compose. Certaines installations Docker, y compris Docker pour macOS, sont livrées avec Docker Compose déjà installé.

Installez Docker et Docker Compose sur votre machine avant de procéder à l'installation. Reportez-vous à la documentation Docker suivante pour obtenir de l'aide :

## Installez Docker Engine
Avant d'installer Docker Engine pour la première fois sur une nouvelle machine hôte, vous devez configurer le référentiel Docker. Vous pouvez ensuite installer et mettre à jour Docker à partir du référentiel.


# Ajouter la clé GPG officielle de Docker:
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
# Ajouter le référentiel aux sources Apt:
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
**Note**

Si vous utilisez une distribution dérivée d'Ubuntu, telle que Linux Mint, vous devrez peut-être utiliser UBUNTU_CODENAMEà la place de VERSION_CODENAME.

# Installez les packages Docker.

Dernier Version spécifique
Pour installer la dernière version, exécutez :

```bash
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 ```
Vérifiez que l’installation de Docker Engine est réussie en exécutant l’ hello-worldimage.

```bash
 sudo docker run hello-world
```
Cette commande télécharge une image de test et l'exécute dans un conteneur. Lorsque le conteneur s'exécute, il imprime un message de confirmation et se ferme.

# Installez Docker Compose

Créer un utilisateur local Bitwarden & répertoire
Nous recommandons de configurer votre serveur Linux avec un bitwarden compte de service dédié, à partir duquel installer et exécuter Bitwarden. Ce faisant, votre instance Bitwarden sera isolée des autres applications en cours d'exécution sur votre serveur.

Ces étapes sont les meilleures pratiques recommandées par Bitwarden, mais ne sont pas obligatoires. Pour plus d'informations, consultez la documentation de Docker sur les Étapes post-installation pour Linux.

Créez un utilisateur Bitwarden :

```Bash
sudo adduser bitwarden
```
Définir le mot de passe pour l'utilisateur Bitwarden (mot de passe fort) :

```Bash

sudo passwd bitwarden
```
Créez un groupe Docker (s'il n'existe pas déjà) :
```Bash
sudo groupadd docker
```
Ajoutez l'utilisateur Bitwarden au groupe docker :
```Bash
sudo usermod -aG docker bitwarden
```
Créez un répertoire Bitwarden :
```Bash
sudo mkdir /opt/bitwarden
```
Définissez les autorisations pour le répertoire /opt/bitwarden :
```Bash
sudo chmod -R 700 /opt/bitwarden
```
Définissez l'utilisateur de Bitwarden comme propriétaire du répertoire /opt/bitwarden :
```Bash
sudo chown -R bitwarden:bitwarden /opt/bitwarden
```
Installez Bitwarden

**avertissement**
**Si vous avez créé un utilisateur & répertoire Bitwarden, complétez ce qui suit en tant qu'utilisateur Bitwarden depuis le répertoire /opt/bitwarden. N'installez pas Bitwarden en tant que root, car vous rencontrerez des problèmes lors de l'installation.**

Bitwarden fournit un script shell pour une installation facile sur Linux et Windows (PowerShell). Suivez les étapes suivantes pour installer Bitwarden en utilisant le script shell :

Téléchargez le script d'installation de Bitwarden (bitwarden.sh) sur votre machine :
```Bash
curl -Lso bitwarden.sh "https://func.bitwarden.com/api/dl/?app=self-host&platform=linux" && chmod 700 bitwarden.sh
```
Exécutez le script d'installation. Un répertoire ./bwdata sera créé par rapport à l'emplacement de bitwarden.sh.
```Bash
./bitwarden.sh install
```
Complétez les instructions dans l'installateur :

`Entrez le nom de domaine pour votre instance Bitwarden :` `ekoloclast.lan`

Typiquement, cette valeur devrait être l'enregistrement DNS configuré.

`Voulez-vous utiliser Let's Encrypt pour générer un certificat SSL gratuit ? (o/n) : n`

Spécifiez y pour générer un certificat SSL de confiance en utilisant Let's Encrypt. On vous demandera de saisir une adresse de courriel pour les rappels d'expiration de Let's Encrypt. Pour plus d'informations, voir Options de Certificat.

Alternativement, spécifiez n et utilisez l'option Avez-vous un certificat SSL à utiliser ?.

`Entrez votre identifiant d'installation :`

Récupérez un identifiant d'installation en utilisant un courriel valide à https://bitwarden.com/host. Pour plus d'informations, voir à quoi servent mon identifiant d'installation et ma clé d'installation ?

`Entrez votre clé d'installation :`

Récupérez une clé d'installation en utilisant un courriel valide à https://bitwarden.com/host. Pour plus d'informations, voir À quoi servent mon identifiant d'installation et ma clé d'installation ?

`Avez-vous un certificat SSL à utiliser ? (o/n):n`

Si vous avez déjà votre propre certificat SSL, spécifiez y et placez les fichiers nécessaires dans le répertoire ./bwdata/ssl/votre.domaine. On vous demandera si c'est un certificat SSL de confiance (o/n). Pour plus d'informations, voir Options de Certificat.

Alternativement, spécifiez n et utilisez l'option certificat SSL auto-signé ?, qui est seulement recommandée à des fins de test.

`Voulez-vous générer un certificat SSL auto-signé ? (o/n) :y`

Spécifiez y pour que Bitwarden génère un certificat auto-signé pour vous. Cette option est uniquement recommandée pour les tests. Pour plus d'informations, voir Options de Certificat.

Si vous spécifiez n, votre instance n'utilisera pas de certificat SSL et vous devrez mettre en avant votre installation avec un proxy HTTPS, sinon les applications Bitwarden ne fonctionneront pas correctement.

## Configuration après installation
La configuration de votre environnement peut impliquer des modifications sur deux fichiers ; un fichier de variables d'environnement et un fichier d'installation :

Variables d'environnement (requis)
Certaines fonctionnalités de Bitwarden ne sont pas configurées par le script bitwarden.sh. Configurez ces paramètres en éditant le fichier d'environnement, situé à `./bwdata/env/global.override.env`. Au minimum, vous devriez remplacer les valeurs pour :
```Bash
...
globalSettings__mail__smtp__host=<placeholder>
globalSettings__mail__smtp__port=<placeholder>
globalSettings__mail__smtp__ssl=<placeholder>
globalSettings__mail__smtp__username=<placeholder>
globalSettings__mail__smtp__password=<placeholder>
...
adminSettings__admins=
...
```
Remplacez les espaces réservés `globalSettings__mail__smtp...=` pour vous connecter au serveur de courrier SMTP qui sera utilisé pour envoyer des courriels de vérification aux nouveaux utilisateurs et inviter des organisations. Ajouter une adresse de courriel à `adminSettings__admins=` permettra d'accéder au Portail de l'Administrateur Système.

Après avoir édité global.override.env, exécutez la commande suivante pour appliquer vos modifications :

```Bash
./bitwarden.sh restart
```
Fichier d'installation
Le script d'installation de Bitwarden utilise les paramètres dans ./bwdata/config.yml pour générer les actifs nécessaires à l'installation. Certains scénarios d'installation (comme les installations derrière un proxy avec des ports alternatifs) peuvent nécessiter des ajustements à config.yml qui n'ont pas été fournis lors de l'installation standard.

Éditer `config.yml` selon les besoins et appliquer vos modifications en exécutant :

```Bash
./bitwarden.sh rebuild
```
Démarrez Bitwarden
Une fois que vous avez terminé toutes les étapes précédentes, démarrez votre instance Bitwarden :
```Bash
./bitwarden.sh start
```
note
La première fois que vous démarrez Bitwarden, cela peut prendre un certain temps car il télécharge toutes les images de Docker Hub.

Vérifiez que tous les conteneurs fonctionnent correctement :

```Bash
docker ps
```
Félicitations ! Bitwarden est maintenant opérationnel à l'adresse https://ekoloclast.lan. Visitez le coffre web dans votre navigateur web pour confirmer qu'il fonctionne.

Vous pouvez maintenant enregistrer un nouveau compte et vous connecter. Vous devrez avoir configuré les variables d'environnement smtp (voir Variables d'Environnement) afin de vérifier le courriel pour votre nouveau compte.

## Référence des commandes de script
Le script d'installation de Bitwarden (bitwarden.sh ou bitwarden.ps1) a les commandes suivantes disponibles :


**note**  
Les utilisateurs de PowerShell exécuteront les commandes avec un - préfixé (commutateur). Par exemple .\bitwarden.ps1 -start.

| Commande                                        | Description                                                                                                                                                         |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   |    |    |    | |
|  install     |   Démarrez l'installateur.    |       |       |       |
|    run   |   Démarrez tous les conteneurs.    |       |       |       |
|      restart |    Redémarrez tous les conteneurs (identique à démarrer).   |       |       |       |
|     stop  |    Arrêtez tous les conteneurs.   |       |       |       |
|   update    |   Mettez à jour tous les conteneurs et la base de données.    |       |       |       |
|   update database   |    Mettez à jour/initialisez la base de données. |       |       |       |
|     update  |  Mettez à jour le fichier run.sh .     |       |       |       |
|   update yoursel    |  Mettez à jour ce script principal.     |       |       |       |
|   update confifguration  |  Mettez à jour tous les conteneurs sans redémarrer l'instance en cours d'exécution.    |       |       |       |
|   remove   |  Avant l'exécution de cette commande, on vous demandera d'enregistrer les fichiers de la base de données. y créera un fichier tar de votre base de données, y compris la sauvegarde la plus récente. |  Arrête les conteneurs, supprime le répertoire bwdata et tout son contenu, et supprime les volumes éphémères. Après l'exécution, on vous demandera si vous voulez également purger toutes les images de Bitwarden. |
| Compress logs     |  Téléchargez une archive tar de tous les journaux de serveur, ou des journaux de serveur dans une plage de dates spécifiée, vers le répertoire actuel.     |   Mettez à jour tous les conteneurs sans redémarrer l'instance en cours d'exécution.    | Par exemple, utilisez ./bitwarden.sh compresslogs 20240304 20240305 pour télécharger les journaux du 4 mars 2024 au 5 mars 2024.      |       |
|  renew certificate    |    Renouveler les certificats.|    |    |    |      
| rebuild      |    Reconstruisez les actifs d'installation générés à partir de config.yml.   |       |       |       |
| help  |  Liste toutes les commandes  |   |    |    |


## Configurer les variables d’environnement
Certaines fonctionnalités de Bitwarden ne sont pas configurées par le `bitwarden.sh` programme d'installation. Configurez ces paramètres en modifiant le fichier d'environnement, situé à l'adresse `./bwdata/env/global.override.env`. Ce .envfichier est pré-configuré avec des variables configurables (voir Variables incluses ), mais il existe des variables supplémentaires qui peuvent être ajoutées manuellement (voir Variables facultatives ).

Chaque fois que vous apportez des modifications à global.override.env, effectuez une ./bitwarden.sh restart pour appliquer vos modifications.
| Variable                                        | Description                                                                                                                                                         |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `globalSettings__baseServiceUri__vault`         | Saisissez le domaine de votre instance Bitwarden. S'il n'est pas configuré, le domaine par défaut sera localhost.                                                    |
| `globalSettings__sqlServer__connectionString`   | Utilisez ce champ pour vous connecter à une base de données MSSQL externe.                                                                                        |
| `globalSettings__oidcIdentityClientKey`         | Une clé client OpenID Connect générée de manière aléatoire. Pour plus d'informations, consultez la documentation OpenID.                                            |
| `globalSettings__duo__aKey`                     | Une clé Duo générée aléatoirement. Pour plus d'informations, consultez la documentation de Duo.                                                                     |
| `globalSettings__yubico__clientId`              | ID client pour le service de validation YubiCloud ou le serveur de validation Yubico auto-hébergé.                                                                      |
| `globalSettings__yubico__key`                   | Clé secrète pour le service de validation YubiCloud ou le serveur de validation Yubico auto-hébergé.                                                                    |
| `globalSettings__mail__replyToEmail`            | Adresse e-mail utilisée pour les invitations, généralement `no_reply@smpt__host`.                                                                                  |
| `globalSettings__mail__smtp__host`              | Le nom d'hôte de votre serveur SMTP (recommandé) ou l'adresse IP.                                                                                                     |
| `globalSettings__mail__smtp__port`              | Le port SMTP utilisé par le serveur SMTP.                                                                                                                            |
| `globalSettings__mail__smtp__ssl`               | (Booléen) Si votre serveur SMTP utilise un protocole de cryptage : `true` = SSL, `false` = TLS.                                                                      |
| `globalSettings__mail__smtp__username`          | Un nom d'utilisateur valide pour le `smtp__host`.                                                                                                                     |
| `globalSettings__mail__smtp__password`          | Un mot de passe valide pour le `smtp__host`. Les caractères dollar `$` ne sont pas pris en charge dans les mots de passe SMTP.                                        |
| `globalSettings__disableUserRegistration`       | Spécifiez `true` pour désactiver les nouveaux utilisateurs s'inscrivant à un compte sur cette instance via la page d'inscription.                                      |
| `globalSettings__hibpApiKey`                    | Votre clé API HaveIBeenPwned (HIBP), disponible [ici](https://haveibeenpwned.com/). Cette clé permet aux utilisateurs d'exécuter le rapport de violation de données et de vérifier la présence de leur mot de passe principal dans les violations lorsqu'ils créent un compte. |
| `adminSettings__admins`                        | Adresses e-mail pouvant accéder au portail de l'administrateur système.                                                                                               |

## Variables optionnelles
Les variables suivantes n'existent pas déjà dans global.override.env, et peuvent être ajoutées manuellement :

| Variable                                        | Description                                                                                                                                                                                   |
|-------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `globalSettings__logDirectory`                  | Spécifie le répertoire dans lequel enregistrer la sortie du fichier journal du conteneur. Par défaut, `globalSettings__logDirectory=bwdata/logs`.                                            |
| `globalSettings__logRollBySizeLimit`            | Spécifiez la limite de taille en octets à utiliser pour les fichiers journaux du conteneur (par exemple, `globalSettings__logRollBySizeLimit=1073741824`).                                 |
| `globalSettings__syslog__destination`           | Spécifiez un serveur Syslog ou un point de terminaison vers lequel envoyer la sortie du journal du conteneur (par exemple, `globalSettings__syslog__destination=udp://example.com:514`). |
| `globalSettings__mail__smtp__trustServer`       | Spécifier `true` de faire explicitement confiance au certificat présenté par le serveur SMTP (non recommandé pour la production).                                                            |
| `globalSettings__mail__smtp__sslOverride`       | Spécifiez `true` l'utilisation de SSL (pas TLS) sur le port 25.                                                                                                                               |
| `globalSettings__mail__smtp__startTls`          | Spécifier `true` pour forcer STARTTLS (TLS opportuniste).                                                                                                                                      |
| `globalSettings__organizationInviteExpirationHours` | Spécifiez le nombre d'heures après lequel une invitation d'organisation expirera (120 par défaut).                                                                                           |
| `globalSettings__yubico__validationUrls__0`     | URL principale du serveur de validation Yubico auto-hébergé. Par exemple : `https://your.url.com/wsapi/2.0/verify`. Ajoutez des URL de serveur de validation supplémentaires en créant des variables d’environnement incrémentées, par exemple `globalSettings__yubico__validationUrls__1=`, `globalSettings__yubico__validationUrls__2=`. |
| `globalSettings__enableCloudCommunication`      | Configurez cette option `true` pour autoriser la communication entre votre serveur et notre système cloud. Cela permet d'activer la synchronisation de la facturation et des licences.   |
| `adminSettings__deleteTrashDaysAgo`             | Spécifiez le nombre de jours après lequel les éléments doivent être définitivement supprimés de la corbeille. Par défaut, `adminSettings__deleteTrashDaysAgo=30`.                         |
| `globalSettings__sso__enforceSsoPolicyForAllUsers` | Spécifiez `true` pour appliquer la stratégie d'authentification SSO requise pour les rôles de propriétaire et d'administrateur.                                                               |
| `globalSettings__baseServiceUri__cloudRegion`   | Spécifiez `US` ou `EU` pour désigner le serveur cloud vers lequel votre serveur auto-hébergé doit établir un lien hypertexte. Si vous utilisez EU, vous devrez également configurer quelques autres variables comme documenté ici. |
| `globalSettings__sqlServer__DisableDatabaseMaintenanceJobs` | Spécifiez `true` pour ignorer la maintenance côté application des statistiques et les tâches de reconstruction d'index dans la base de données. Ces tâches nécessitent des privilèges MSSQL élevés et doivent être reconfigurées pour s'exécuter en tant qu'utilisateur de base de données si cette valeur est définie sur `true`. |
| `globalSettings__sqlServer__SkipDatabasePreparation` | Spécifiez `true` pour ignorer la préparation de la base de données côté application. Si ce paramètre n'est pas spécifié, la préparation de la base de données vérifie lors de l'installation si une base de données portant le nom spécifié `globalSettings__sqlServer__connectionString=` existe et, dans le cas contraire, en crée une. Cette tâche nécessite des privilèges MSSQL élevés et, si cette valeur est définie sur `true`, la base de données nommée doit exister avant de lancer l'installation. |
