<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>
voici une documentation en Markdown pour installer et configurer Bitwarden sur un serveur Debian, en utilisant un serveur Active Directory (AD) avec DHCP sur l'adresse IP 192.168.0.4.


# Installation et Configuration de Bitwarden sur Debian

## Prérequis

1. **Serveur AD**: 192.168.0.4 (avec DHCP)
2. **Domaine**: ekoloclast.lan
3. **Adresse IP du serveur Bitwarden**: 192.168.0.2

## Étape 1: Mise à jour du système

Avant de commencer l'installation, assurez-vous que votre système est à jour.

```bash
sudo apt update
sudo apt upgrade -y
```
## Étape 2: Installation des dépendances
Installez les dépendances nécessaires pour l'installation de Bitwarden.

```bash
sudo apt install curl wget gnupg2 lsb-release -y
```
## Étape 3: Téléchargement et installation de Docker
Bitwarden utilise Docker pour son déploiement. Installez Docker en suivant les étapes ci-dessous.

### Étape 3.1: Ajout de la clé GPG de Docker
```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
### Étape 3.2: Ajout du dépôt Docker
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
### Étape 3.3: Installation de Docker
```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
```
### Étape 3.4: Vérification de l'installation de Docker
```bash
sudo systemctl status docker
```
## Étape 4: Téléchargement et installation de Docker Compose
Docker Compose est nécessaire pour orchestrer les conteneurs Bitwarden.

### Étape 4.1: Téléchargement de Docker Compose
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
### Étape 4.2: Attribution des permissions
```bash
sudo chmod +x /usr/local/bin/docker-compose
```
### Étape 4.3: Vérification de l'installation de Docker Compose
```bash
docker-compose --version
```
### Étape 5: Téléchargement et installation de Bitwarden
## Étape 5.1: Clonage du dépôt Bitwarden
```bash
git clone https://github.com/bitwarden/server.git
cd server
```
### Étape 5.2: Configuration de Bitwarden
Créez un fichier de configuration pour Bitwarden.

```bash
cp env/bwdata.env.template env/bwdata.env
cp env/mssql.env.template env/mssql.env
```
### Étape 5.3: Configuration des variables d'environnement
Éditez les fichiers bwdata.env et mssql.env pour configurer les variables d'environnement. Par exemple, pour bwdata.env:

```bash
nano env/bwdata.env
```
Ajoutez ou modifiez les lignes suivantes:

```bash
globalSettings__mail__smtp__host=192.168.0.4
globalSettings__mail__smtp__port=25
globalSettings__mail__smtp__ssl=false
globalSettings__mail__smtp__username=your-smtp-username
globalSettings__mail__smtp__password=your-smtp-password
globalSettings__mail__smtp__fromEmail=admin@ekoloclast.lan
globalSettings__mail__smtp__fromName=Bitwarden
```
Pour mssql.env:
```bash
nano env/mssql.env
```

Ajoutez ou modifiez les lignes suivantes:

```bash
ACCEPT_EULA=Y
SA_PASSWORD=your-strong-password
```
### Étape 5.4: Démarrage de Bitwarden
Utilisez Docker Compose pour démarrer Bitwarden.

```bash
docker-compose up -d
```
## Étape 6: Configuration du pare-feu
Ouvrez les ports nécessaires pour Bitwarden:

```bash
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 3012/tcp
```
## Étape 7: Vérification de l'installation
Accédez à l'interface de Bitwarden via votre navigateur web:


https://192.168.0.2
Connectez-vous avec les informations d'identification de l'administrateur que vous avez configurées.

## Étape 8: Configuration des certificats SSL (optionnel)
Pour sécuriser votre installation, vous pouvez configurer des certificats SSL. Vous pouvez utiliser des certificats auto-signés ou des certificats émis par une autorité de certification.

Conclusion
Vous avez maintenant installé et configuré Bitwarden sur un serveur Debian avec les spécifications fournies. Assurez-vous de sauvegarder régulièrement vos données et de maintenir votre serveur à jour pour des raisons de sécurité.