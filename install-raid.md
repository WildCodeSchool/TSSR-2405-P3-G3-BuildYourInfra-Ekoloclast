<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/new%20ekoloclast%20titre%20sans%20fond.png)   

</div>    


# Tuto : Réalisation d'un RAID 5 avec 4 Disques pour la Sauvegarde des Données

## Introduction

Le RAID (Redundant Array of Independent Disks) 5 est une configuration qui utilise la parité pour fournir à la fois redondance et performance. Un RAID 5 nécessite au moins trois disques et offre une tolérance aux pannes, ce qui en fait un choix populaire pour la sauvegarde des données d'entreprise.

## Prérequis

- Un serveur ou une machine avec un contrôleur RAID matériel ou la capacité de configurer RAID via le logiciel.
- Quatre disques durs de même capacité et performance.
- Un système d'exploitation capable de gérer RAID (Linux, Windows Server, etc.).

## Étapes de Réalisation d'un RAID 5

### 1. Préparation du Matériel

1. **Installation des Disques :**
   - Éteignez le serveur et installez les quatre disques dans les baies disponibles.
   - Assurez-vous que les disques sont correctement connectés et reconnus par le BIOS ou l'UEFI du serveur.

### 2. Configuration du RAID 5

#### Via un Logiciel RAID sur Windows

1. **Accédez à la Gestion des Disques :**
   - Ouvrez le gestionnaire de disque en appuyant sur `Win + X` et en sélectionnant **Gestion des disques**.
![gestion](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/gestion.png)

2. **Initialiser les Disques :**
   - Si les disques ne sont pas encore initialisés, un message s'affichera pour vous demander de les initialiser. Sélectionnez les disques et choisissez le style de partition (GPT est recommandé).
![ini](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/init.png)
3. **Créer le Volume RAID 5 :**
   - Faites un clic droit sur l'un des disques non alloués et sélectionnez **Nouveau Volume RAID-5**.
   ![raid5](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/raid5.png)
   - Suivez l'assistant pour configurer le volume RAID 5 :
     - Sélectionnez les disques à inclure dans le RAID 5 (les quatre disques).
     ![selection](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/selection.png)
     - Attribuez une lettre de lecteur.
     - Formatez le volume avec le système de fichiers NTFS.
     - Complétez l'assistant pour créer le volume RAID 5.
     -patienter le temp de la création du raid 5.  
     ![raid5ok]()


#### RAID sur Linux

1. **Vérification des Disques :**
   - Allumez le serveur taper la commande `lsblk` afin d'afficher la liste des disques  
   ![disk](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/disk.png)

2. **Installation des Outils RAID :**
   - Assurez-vous que `mdadm` est installé :
     ```sh
     sudo apt-get install mdadm
     ```

3. **Partitionnement des disques**
Partitionner le disque sdb avec la commande `fdisk /dev/sd[a,d,b]`. Cela ouvre l'utilitaire de partitionnement.
En choisissant la commande **(m)** dans l'utilitaire, l'aide va apparaître :
```
Commande (m pour l'aide) : m

Aide :

  DOS (secteur d'amorçage)
   a   modifier un indicateur d'amorçage
   b   éditer l'étiquette BSD imbriquée du disque
   c   modifier l'indicateur de compatibilité DOS

  Générique
   d   supprimer la partition
   F   afficher l’espace libre non partitionné
   l   afficher les types de partitions connues
   n   ajouter une nouvelle partition
   p   afficher la table de partitions
   t   modifier le type d'une partition
   v   vérifier la table de partitions
   i   Afficher des renseignements sur la partition

  Autre
   m   afficher ce menu
   u   modifier les unités d'affichage et de saisie
   x   fonctions avancées (réservées aux spécialistes)

  Script
   I   chargement de l’agencement à partir du fichier de script sfdisk
   O   sauvegarde de l’agencement vers le fichier de script sfdisk

  Sauvegarder et quitter
   w   écrire la table sur le disque et quitter
   q   quitter sans enregistrer les modifications

  Créer une nouvelle étiquette
   g   créer une nouvelle table vide de partitions GPT
   G   créer une nouvelle table vide de partitions SGI (IRIX)
   o   créer une nouvelle table vide de partitions DOS
   s   créer une nouvelle table vide de partitions Sun
```
On vas créé une nouvel partition avec **(n)**  on choisis une partition primaire **(p)**,on choisi le numéro de la parition,et on laisse le premier secteur et le dernier par default car on utilise le disquez entier.
Ensuite on choisi le type de partition **(t)** ,pour avoir la liste des codes on fait **(L)** .
```
Code Hexa ou synonyme (taper L pour afficher tous les codes) :L

00 Vide             27 TFS WinRE masqu  82 partition d'éch  c1 DRDOS/sec (FAT-
01 FAT12            39 Plan 9           83 Linux            c4 DRDOS/sec (FAT-
02 root XENIX       3c récupération Pa  84 OS/2 cachée ou   c6 DRDOS/sec (FAT-
03 usr XENIX        40 Venix 80286      85 Linux étendue    c7 Syrinx
04 FAT16 <32M       41 PPC PReP Boot    86 NTFS volume set  da Données non-FS
05 Étendue          42 SFS              87 NTFS volume set  db CP/M / CTOS / .
06 FAT16            4d QNX4.x           88 Linux plaintext  de Dell Utility
07 HPFS/NTFS/exFAT  4e 2e partie QNX4.  8e LVM Linux        df BootIt
08 AIX              4f 3e partie QNX4.  93 Amoeba           e1 DOS access
09 Amorçable AIX    50 OnTrack DM       94 Amoeba BBT       e3 DOS R/W
0a Gestionnaire d'  51 OnTrack DM6 Aux  9f BSD/OS           e4 SpeedStor
0b W95 FAT32        52 CP/M             a0 IBM Thinkpad hi  ea Amorçage Linux
0c W95 FAT32 (LBA)  53 OnTrack DM6 Aux  a5 FreeBSD          eb BeOS fs
0e W95 FAT16 (LBA)  54 OnTrackDM6       a6 OpenBSD          ee GPT
0f Étendue W95 (LB  55 EZ-Drive         a7 NeXTSTEP         ef EFI (FAT-12/16/
10 OPUS             56 Golden Bow       a8 UFS Darwin       f0 Linux/PA-RISC b
11 FAT12 masquée    5c Priam Edisk      a9 NetBSD           f1 SpeedStor
12 Compaq diagnost  61 SpeedStor        ab Amorçage Darwin  f4 SpeedStor
14 FAT16 masquée <  63 GNU HURD ou Sys  af HFS / HFS+       f2 DOS secondaire
16 FAT16 masquée    64 Novell Netware   b7 BSDI fs          f8 EBBR protégé
17 HPFS/NTFS masqu  65 Novell Netware   b8 partition d'éch  fb VMware VMFS
18 AST SmartSleep   70 DiskSecure Mult  bb Boot Wizard mas  fc VMware VMKCORE
1b W95 FAT32 masqu  75 PC/IX            bc Acronis FAT32 L  fd RAID Linux auto
1c W95 FAT32 masqu  80 Minix ancienne   be Amorçage Solari  fe LANstep
1e W95 FAT16 masqu  81 Minix / Linux a  bf Solaris          ff BBT
24 NEC DOS

Synonymes:
   linux          - 83
   swap           - 82
   extended       - 05
   uefi           - EF
   raid           - FD
   lvm            - 8E
   linuxex        - 85
Code Hexa ou synonyme (taper L pour afficher tous les codes) :
```
On choisi le Raid **(FD)** on tape **quit** pour sortir et on fait la même opération pour les 3 autres disques.  

 **Créer le RAID 5 :**
   - Utilisez la commande suivante pour créer un RAID 5 avec les quatre disques (exemple avec `/dev/sda`, `/dev/sdb`, `/dev/sdc`, `/dev/sdd`) :
     ```sh
     sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=4 /dev/sd[abcd]
     ```
![creation raid](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/creation%20raid.png)

4. **Vérification de la Configuration :**
   - Vérifiez que le RAID est en cours de création :
     ```sh
     cat /proc/mdstat
     ```
![verif](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/verif.png)

5. **Sauvegarder la Configuration :**
   - Sauvegardez la configuration du RAID pour qu'elle soit restaurée au démarrage :
     ```sh
     sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
     sudo update-initramfs -u
     ```


### 3. Formater le Volume RAID

1. **Créer un Système de Fichiers (Linux) :**
   - Une fois le RAID 5 créé, formatez-le avec un système de fichiers (exemple avec ext4) :
     ```sh
     sudo mkfs.ext4 /dev/md0
     ```
![formatage](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/formatage.png)

2. **Monter le Volume RAID (Linux) :**
   - Créez un point de montage et montez le volume RAID :
     ```sh
     sudo mkdir /mnt/raid
     sudo mount /dev/md0 /mnt/raid
     ```

3. **Configurer le Montage Automatique (Linux) :**
   - Ajoutez le volume RAID à `/etc/fstab` pour qu'il soit monté automatiquement au démarrage :
     ```sh
     echo '/dev/md0 /mnt/raid ext4 defaults 0 0' | sudo tee -a /etc/fstab
     ```

### 4. Vérification et Maintenance
![lsblk](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/raid5/lsblk.png)
1. **Vérifier l'Intégrité du RAID (Linux) :**
   - Vérifiez régulièrement l'état du RAID avec :
     ```sh
     
     ```

2. **Surveiller les Journaux Système (Linux) :**
   - Surveillez les journaux système pour toute erreur ou alerte concernant le RAID.

3. **Tester la Tolérance aux Pannes (Linux et Windows) :**
   - Simulez la panne d'un disque pour vous assurer que le RAID fonctionne comme prévu et qu'il peut être reconstruit sans perte de données.

## Conclusion

Configurer un RAID 5 avec quatre disques offre une solution robuste pour la sauvegarde des données en entreprise. Cette configuration garantit à la fois la performance et la redondance, protégeant ainsi les données critiques contre les pannes matérielles.

---

Ce guide couvre les étapes essentielles pour configurer un RAID 5 à l'aide de quatre disques. Suivez ces instructions avec précaution pour assurer une configuration correcte et sécurisée.
