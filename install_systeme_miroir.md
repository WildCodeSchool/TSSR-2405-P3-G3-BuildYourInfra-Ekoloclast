<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/new%20ekoloclast%20titre%20sans%20fond.png)   

</div>

# Mise en place d'un disque miroir sur disque systeme

## Introduction 

La mise en miroir (RAID 1) sur Windows Server permet de créer une copie exacte des données sur deux disques différents, assurant une redondance et une tolérance aux pannes. Ce guide détaille les étapes pour ajouter un disque miroir sur Windows Server Core en utilisant PowerShell.
# Windows server 2022 core
## Prérequis

- Un serveur exécutant Windows Server Core.
- Deux disques durs de même capacité et performance. Un disque sera le disque principal, et l'autre sera ajouté comme miroir.

## Étapes pour Ajouter un Disque Miroir

### 1. Préparation

1. **Vérifiez les Disques Disponibles :**
   - Connectez-vous à votre serveur Windows Server Core.
   - Ouvrez PowerShell.
   - Exécutez la commande suivante pour lister les disques disponibles :
     ```powershell
     Get-Disk
     ```

2. **Initialiser le Nouveau Disque (si nécessaire) :**
   - Si le nouveau disque n'est pas initialisé, utilisez la commande suivante pour l'initialiser (remplacez `X` par le numéro du disque) :
     ```powershell
     Initialize-Disk -Number X
     ```

### 2. Conversion des Disques en Disques Dynamiques

1. **Convertir les Disques en Disques Dynamiques :**
   - Convertissez les deux disques en disques dynamiques (remplacez `X` et `Y` par les numéros des disques) :
     ```powershell
     Get-Disk -Number X | Set-Disk -IsDynamic $true
     Get-Disk -Number Y | Set-Disk -IsDynamic $true
     ```

### 3. Création du Volume Miroir

1. **Créer le Volume Miroir :**
   - Identifiez le volume existant que vous souhaitez mirrorer. Utilisez `Get-Volume` pour lister les volumes.
   - Ajoutez le miroir au volume existant (remplacez `Z` par la lettre de lecteur du volume existant et `Y` par le numéro du disque supplémentaire) :
     ```powershell
     Add-PartitionAccessPath -DiskNumber Y -PartitionNumber 1 -AccessPath "E:\" -Mbr
     ```

2. **Vérifier le Volume Miroir :**
   - Exécutez la commande suivante pour vérifier que le volume miroir a été créé correctement :
     ```powershell
     Get-Volume
     ```

### 4. Surveillance et Maintenance

1. **Surveiller l'état du Miroir :**
   - Utilisez la commande suivante pour surveiller l'état du volume miroir :
     ```powershell
     Get-VirtualDisk | Select-Object OperationalStatus
     ```

2. **Remplacer un Disque Défectueux :**
   - Si un des disques du miroir tombe en panne, remplacez-le par un nouveau disque et répétez les étapes pour initialiser et ajouter le nouveau disque comme miroir.


# Ajouter un Disque Miroir sur Windows Server en Utilisant l'Interface Graphique

## Prérequis
Un serveur exécutant Windows Server avec une interface graphique.
Deux disques durs de même capacité et performance. Un disque sera le disque principal, et l'autre sera ajouté comme miroir.
Étapes pour Ajouter un Disque Miroir
### 1. Préparation
Vérifiez les Disques Disponibles :

Connectez-vous à votre serveur Windows Server.
Ouvrez l'outil Gestion des disques en cliquant droit sur le menu Démarrer et en sélectionnant Gestion des disques.

Initialiser le Nouveau Disque (si nécessaire) :
Si le nouveau disque n'est pas initialisé, un message s'affichera pour vous demander de l'initialiser.
Sélectionnez le disque et choisissez le style de partition (GPT est recommandé).  
![initserv](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/init.png)  

### 2. Conversion des Disques en Disques Dynamiques  
Convertir les Disques en Disques Dynamiques :
![raidsystem3](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/raidsysteme3.png.crdownload)  
Dans Gestion des disques, faites un clic droit sur le disque principal (celui contenant le volume existant) et sélectionnez Convertir en disque dynamique.  
Répétez l'opération pour le nouveau disque que vous souhaitez ajouter comme miroir.  

### 3. Création du Volume Miroir
Ajouter le Miroir :  
![raidsysteme6](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/raidsysteme6.png)  
Faites un clic droit sur le volume existant que vous souhaitez mirrorer et sélectionnez Ajouter un miroir.
Dans la fenêtre qui s'ouvre, sélectionnez le disque que vous avez préparé comme miroir et cliquez sur Ajouter un miroir.  

### 4. Surveillance et Maintenance
Vérifier le Volume Miroir :

Une fois l'ajout terminé, le volume sera marqué comme en cours de resynchronisation dans Gestion des disques.
Attendez que la resynchronisation soit terminée avant d'utiliser le volume miroir.  
Surveiller l'état du Miroir :
![raissysteme8](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/raidsysteme8.png)  
Utilisez Gestion des disques pour surveiller l'état du volume miroir. Vous pouvez voir l'état de la resynchronisation et toute erreur éventuelle.  
![miroirok](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/miroirok.png)  
Une fois la synchronisation terminée le disque miroir est opérationnel.  

### 5. Remplacer un Disque Défectueux :

Si un des disques du miroir tombe en panne, remplacez-le par un nouveau disque et répétez les étapes pour initialiser et ajouter le nouveau disque comme miroir.  

## Conclusion
Ajouter un disque miroir sur Windows Server via l'interface graphique assure une redondance et une tolérance aux pannes pour vos données critiques. Suivez ce guide pour configurer et maintenir efficacement un volume miroir.

Ce guide couvre les étapes nécessaires pour ajouter un disque miroir sur Windows Server .  
Utilisez ces instructions avec précaution pour garantir une configuration correcte et sécurisée de vos disques miroirs.





