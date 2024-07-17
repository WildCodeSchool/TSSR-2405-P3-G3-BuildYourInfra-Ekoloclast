#!/bin/bash
#mise a jour systeme
sudo apt update
sudo apt upgrade -y
#installation logiciel
sudo apt install apache2 -y
sudo apt install mariadb-server mariadb-client -y
sudo apt install php php-mysql php-ldap php-curl php-gd php-intl php-xml php-mbstring php-apcu libapache2-mod-php php-json php-zip php-bz2 php-imap -y

sudo systemctl restart apache2

#telechargement de la derniere version de glpi
cd /tmp
wget https://github.com/glpi-project/glpi/releases/download/10.0.16/glpi-10.0.16.tgz
sleep 2
#création dossier,decompression et copie de glpi 
sudo mkdir /var/www/html/glpi.ekoloclast.lan
sudo tar -xzvf glpi-10.0.16.tgz
sudo cp -R glpi/* /var/www/html/glpi.ekoloclast.lan
#création des droit a apache2 sur glpi
sudo chown www-data:www-data /var/www/html/glpi.ekoloclast.lan/ -R
sudo chmod -R 775 /var/www/html/glpi.ekoloclast.lan
#configuration
sudo mysql_secure_installation
sudo mysql -u root -p

ip=$(hostname -I)
echo "-------------------------------------------------------------------------------------"
echo "Vous pouvez vous connecté via votre navigateur à l'adresse http://$ip/ekoloclast.lan"
echo "-------------------------------------------------------------------------------------"
