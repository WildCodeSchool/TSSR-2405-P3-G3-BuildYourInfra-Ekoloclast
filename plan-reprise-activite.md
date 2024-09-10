<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>  


# Plan de Reprise d'Activité (PRA)

## 1. Évaluation

### 1.1 Identification des éléments critiques HS

- Serveur Windows Server 2022 avec AD, DHCP et DNS
- Serveur Windows Server 2022 Core en RODC
- Serveur GLPI
- Serveur de stockage
- Routeur VyOS
- Pare-feu pfSense

### 1.2 Documentation des dommages subis

Pour chaque élément critique identifié comme hors service (HS), documenter :
- Nature exacte de la panne
- Impact sur les services
- Estimation du temps de réparation

## 2. Identification

### 2.1 Priorisation des services à rétablir en priorité

1. Connectivité réseau (Routeur VyOS et Pare-feu pfSense)
2. Services d'infrastructure (AD, DHCP, DNS sur le serveur Windows 2022)
3. Serveur de stockage
4. Serveur RODC
5. Serveur GLPI

### 2.2 Listing des tâches pour chaque priorisation

1. Connectivité réseau :
   - Vérifier l'alimentation et les connexions physiques
   - Restaurer les configurations du routeur VyOS et du pare-feu pfSense
   - Tester la connectivité interne et externe

2. Services d'infrastructure :
   - Redémarrer le serveur Windows 2022
   - Vérifier le fonctionnement de l'AD, DHCP et DNS
   - Résoudre les problèmes éventuels de réplication AD

3. Serveur de stockage :
   - Vérifier l'intégrité des données
   - Restaurer les sauvegardes si nécessaire
   - Rétablir les partages réseau

4. Serveur RODC :
   - Redémarrer le serveur Windows 2022 Core
   - Vérifier la réplication avec le contrôleur de domaine principal
   - Résoudre les problèmes de synchronisation éventuels

5. Serveur GLPI :
   - Redémarrer le serveur GLPI
   - Vérifier l'intégrité de la base de données
   - Tester l'accès à l'interface web

## 3. Réparation

### 3.1 Réparation des éléments

Pour chaque élément :
- Suivre les procédures de dépannage spécifiques
- Appliquer les correctifs nécessaires
- Restaurer les configurations et les données à partir des sauvegardes

### 3.2 Vérification que le statut de chaque élément est opérationnel

- Effectuer des tests fonctionnels pour chaque service
- Vérifier les journaux d'événements pour détecter d'éventuelles erreurs
- Confirmer la connectivité et le bon fonctionnement de l'ensemble du réseau

## 4. Documentation

### 4.1 Création de documents si non-existants

- Procédures de restauration pour chaque service critique
- Diagramme du réseau mis à jour
- Liste des contacts d'urgence (internes et fournisseurs)

### 4.2 Mise à jour des documents existants

- Mettre à jour l'inventaire du matériel et des logiciels
- Réviser les procédures de sauvegarde et de restauration
- Actualiser le plan de continuité d'activité en fonction des leçons apprises

# Procédures de Restauration pour Chaque Élément
### listing 
#### 1.[Serveur windows 2022](#1-serveur-windows-server-2022-avec-ad-dhcp-et-dns)
#### 2.[Serveur windows 2022 core](#2serveur-windows-2022-core)
#### 3.[serveur Glpi](#3-serveur-glpi)
#### 4.[serveur de stockage](#4serveur-de-stockage)
#### 5.[vyos](#5-routeur-vyos)
#### 6.[pare-feux Pfsense](#6-pare-feu-pfsense)



## 1. Serveur Windows Server 2022 avec AD, DHCP et DNS

### Étapes de restauration :

1. Vérifiez l'alimentation et les connexions physiques du serveur.
2. Démarrez le serveur en mode normal.
3. Si le démarrage échoue, utilisez le dernier point de restauration système connu.
4. Vérifiez les services Active Directory, DHCP et DNS :
   ```
   Get-Service adws,dhcp,dns | Select-Object Name, Status
   ```
5. Si un service ne démarre pas, lancez-le manuellement :
   ```
   Start-Service <nom_du_service>
   ```
6. Vérifiez les journaux d'événements pour détecter d'éventuelles erreurs.
7. Testez la réplication AD avec les autres contrôleurs de domaine :
   ```
   repadmin /showrepl
   ```
8. Vérifiez le fonctionnement du DHCP :
   ```
   Get-DhcpServerv4Scope
   ```
9. Testez la résolution DNS :
   ```
   nslookup <nom_de_domaine>
   ```

## 2. Serveur Windows Server 2022 Core en RODC

### Étapes de restauration :

1. Vérifiez l'alimentation et les connexions réseau.
2. Démarrez le serveur.
3. Connectez-vous en utilisant PowerShell Remoting depuis un autre serveur :
   ```
   Enter-PSSession -ComputerName <nom_du_serveur_RODC>
   ```
4. Vérifiez le statut des services AD :
   ```
   Get-Service adws, kdc, netlogon | Select-Object Name, Status
   ```
5. Vérifiez la réplication avec le contrôleur de domaine principal :
   ```
   repadmin /showrepl
   ```
6. Si des problèmes de réplication persistent, forcez une synchronisation :
   ```
   repadmin /syncall
   ```
7. Vérifiez les journaux d'événements pour détecter d'éventuelles erreurs :
   ```
   Get-EventLog -LogName "Directory Service" -Newest 50
   ```

## 3. Serveur GLPI

### Étapes de restauration :

1. Vérifiez l'alimentation et les connexions réseau du serveur.
2. Démarrez le serveur.
3. Vérifiez le statut du service web (Apache ou Nginx) :
   ```
   systemctl status apache2   # ou nginx
   ```
4. Si le service est arrêté, démarrez-le :
   ```
   systemctl start apache2   # ou nginx
   ```
5. Vérifiez le statut de la base de données (habituellement MySQL ou MariaDB) :
   ```
   systemctl status mysql   # ou mariadb
   ```
6. Si la base de données est arrêtée, démarrez-la :
   ```
   systemctl start mysql   # ou mariadb
   ```
7. Vérifiez l'intégrité de la base de données GLPI :
   ```
   mysqlcheck -u root -p glpi
   ```
8. Si nécessaire, restaurez la dernière sauvegarde de la base de données.
9. Testez l'accès à l'interface web de GLPI.

## 4. Serveur de stockage

### Étapes de restauration :

1. Vérifiez l'alimentation et les connexions réseau du serveur.
2. Démarrez le serveur.
3. Vérifiez l'état des disques durs :
   ```
   Get-PhysicalDisk | Select FriendlyName, OperationalStatus, HealthStatus
   ```
4. Si vous utilisez un RAID, vérifiez son état :
   ```
   Get-VirtualDisk | Select FriendlyName, OperationalStatus, HealthStatus
   ```
5. Vérifiez les partages réseau :
   ```
   Get-SmbShare
   ```
6. Si nécessaire, restaurez les partages manquants :
   ```
   New-SmbShare -Name "<nom_du_partage>" -Path "<chemin_du_partage>"
   ```
7. Vérifiez les permissions sur les dossiers partagés.
8. Si nécessaire, restaurez les données à partir de la dernière sauvegarde.

## 5. Routeur VyOS

### Étapes de restauration :

1. Vérifiez l'alimentation et les connexions physiques.
2. Accédez à l'interface de configuration VyOS.
3. Vérifiez la configuration actuelle :
   ```
   show configuration
   ```
4. Si la configuration est corrompue, restaurez la dernière sauvegarde connue :
   ```
   load /config/backup/<nom_fichier_backup>
   commit
   save
   ```
5. Vérifiez les interfaces réseau :
   ```
   show interfaces
   ```
6. Testez la connectivité avec les réseaux voisins :
   ```
   ping <adresse_ip_voisine>
   ```
7. Vérifiez les routes :
   ```
   show ip route
   ```
8. Si nécessaire, reconfigurez les routes manquantes.

## 6. Pare-feu pfSense

### Étapes de restauration :

1. Vérifiez l'alimentation et les connexions physiques.
2. Accédez à l'interface web de pfSense.
3. Vérifiez l'état des interfaces réseau dans "Interfaces > Assignments".
4. Si la configuration est corrompue, restaurez la dernière sauvegarde connue :
   - Allez dans "Diagnostics > Backup & Restore"
   - Sélectionnez "Restore Backup"
   - Choisissez le fichier de sauvegarde et cliquez sur "Restore Configuration"
5. Vérifiez les règles de pare-feu dans "Firewall > Rules".
6. Testez la connectivité NAT et le routage.
7. Vérifiez les services activés dans "Status > Services".
8. Si nécessaire, redémarrez les services problématiques.
9. Vérifiez les journaux système pour détecter d'éventuelles erreurs.

Pour chaque élément, après avoir suivi ces étapes de restauration, effectuez des tests approfondis pour vous assurer que tous les services fonctionnent correctement et que la connectivité réseau est pleinement rétablie.

