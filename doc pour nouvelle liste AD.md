<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>

# Documentation du Script PowerShell pour l'Ajout de Dossiers Personnels
Ce script PowerShell est destiné à automatiser la création de dossiers personnels pour les utilisateurs dans un environnement Active Directory. Il prend en charge l'importation de données utilisateurs depuis un fichier CSV et crée les dossiers correspondants dans une structure de répertoires basée sur les unités organisationnelles (OU) définies dans Active Directory.

## Sommaire
1.[Vérification et Chargement du Module Active Directory](#1-vérification-et-chargement-du-module-active-directory)  
2.[Importation des Données depuis le Fichier CSV](#2-importation-des-données-depuis-le-fichier-csv)  
3.[Vérification de l'OU Parent dans Active Directory](#3-vérification-de-lou-parent-dans-active-directory)  
4.[Création de Dossiers Basée sur la Structure des OU](#4-création-de-dossiers-basée-sur-la-structure-des-ou)  
5.[Création des Dossiers Personnels des Utilisateurs](#5-création-des-dossiers-personnels-des-utilisateurs)  
## 1. Vérification et Chargement du Module Active Directory <a name="section1"></a>
Code :

```ps1
if (-not (Get-Module -Name ActiveDirectory)) {
    if (Get-Module -ListAvailable -Name ActiveDirectory) {
        Import-Module -Name ActiveDirectory
    } else {
        Write-Host "Le module Active Directory n'est pas disponible sur ce système."
        exit 1
    }
}

Write-Host "Module Active Directory chargé avec succès."
```
**Explication** :

***Objectif*** : Vérifier que le module ActiveDirectory est disponible et le charger.  Ce module est essentiel pour interagir avec les objets Active Directory dans PowerShell.

**Fonctionnement** :

La commande `Get-Module -Name ActiveDirectory` vérifie si le module est déjà chargé.  
Si le module n'est pas chargé, le script essaie de le trouver avec `Get-Module -ListAvailable -Name ActiveDirectory` et l'importe si disponible.  
Si le module n'est pas disponible, le script affiche un message d'erreur et s'arrête (exit 1).  
**Conclusion** : Cette section garantit que le script dispose des outils nécessaires pour interagir avec Active Directory.

## 2. Importation des Données depuis le Fichier CSV <a name="section2"></a>
Code :

```ps1
$csvFilePath = "C:\Users\Administrateur\Documents\Annexe4ok.txt"

try {
    $data = Import-Csv -Path $csvFilePath -Delimiter ","
    $lineNumber = 1
    
    foreach ($row in $data) {
        if ($row -ne $null) {
            Write-Host "Ligne $lineNumber :"
            foreach ($prop in $row.PSObject.Properties) {
                Write-Host "    $($prop.Name) : $($prop.Value)"
            }
        }
        $lineNumber++
    }
} catch {
    Write-Host "Erreur lors de l'importation du fichier CSV : $_"
}
```
**Explication** :

***Objectif*** : Charger les informations des utilisateurs depuis un fichier CSV spécifié par $csvFilePath.

**Fonctionnement** :

Le fichier CSV est importé à l'aide de Import-Csv.  
Chaque ligne du CSV représente un utilisateur, et les données sont affichées pour vérification.  
Si une erreur se produit lors de l'importation du fichier, le script affiche un message d'erreur. 

***Conclusion*** : Cette section du script lit les données des utilisateurs et les prépare pour la création des dossiers.

## 3. Vérification de l'OU Parent dans Active Directory <a name="section3"></a>
Code :

```ps1

$parentOU = "OU=Paris,DC=Projet3,DC=lan"

try {
    $parentOUObject = Get-ADOrganizationalUnit -Identity $parentOU -ErrorAction Stop
    Write-Host "L'OU parent '$parentOU' a été trouvé."
} catch {
    Write-Host "Erreur : L'OU parent '$parentOU' n'a pas été trouvé. Vérifiez que le DN est correct."
    exit 1
}
```
**Explication** :

***Objectif*** : Vérifier l'existence de l'OU parent spécifiée dans Active Directory pour s'assurer que le script peut y accéder.

**Fonctionnement** :

La commande `Get-ADOrganizationalUnit -Identity $parentOU` tente de récupérer l'OU parent.  
Si l'OU n'est pas trouvée, le script s'arrête avec un message d'erreur pour éviter de continuer sans une base valide.

***Conclusion*** : Cette étape est cruciale pour garantir que le script peut correctement naviguer dans la structure d'Active Directory.

## 4. Création de Dossiers Basée sur la Structure des OU <a name="section4"></a>
Code :

```ps1

$baseFolderPath = "D:"

function Create-FoldersForOUs {
    param (
        [string]$currentOU,
        [string]$currentPath
    )

    try {
        $subOUs = Get-ADOrganizationalUnit -Filter * -SearchBase $currentOU -SearchScope OneLevel
    } catch {
        Write-Host "Erreur lors de l'obtention des sous-OUs de '$currentOU' : $_"
        return
    }

    foreach ($subOU in $subOUs) {
        $ouName = $subOU.Name
        $folderPath = Join-Path -Path $currentPath -ChildPath $ouName

        if (-Not (Test-Path -Path $folderPath)) {
            try {
                New-Item -Path $folderPath -ItemType Directory
                Write-Host "Le dossier '$folderPath' a été créé."
            } catch {
                Write-Host "Erreur lors de la création du dossier '$folderPath': $_"
            }
        } else {
            Write-Host "Le dossier '$folderPath' existe déjà."
        }

        Create-FoldersForOUs -currentOU $subOU.DistinguishedName -currentPath $folderPath
    }
}

Create-FoldersForOUs -currentOU $parentOU -currentPath $baseFolderPath
```
**Explication** :

***Objectif*** : Créer une structure de dossiers basée sur les sous-OUs de l'OU parent dans Active Directory.

***Fonctionnement*** :

La fonction Create-FoldersForOUs est définie pour parcourir récursivement les sous-OUs et créer des dossiers correspondants sur le disque.  
Chaque sous-OU devient un dossier sous le chemin spécifié par $currentPath.  
Si un dossier existe déjà, il n'est pas recréé, et le script passe à l'OU suivante. 

***Conclusion*** : Cette section permet de refléter la structure de l'OU dans le système de fichiers, facilitant ainsi l'organisation des dossiers.

## 5. Création des Dossiers Personnels des Utilisateurs <a name="section5"></a>
Code :

```ps1

$personalFolderPath = "D:\Dossiers Individuels"

if (-Not (Test-Path -Path $personalFolderPath)) {
    try {
        New-Item -Path $personalFolderPath -ItemType Directory
        Write-Host "Le dossier de base '$personalFolderPath' a été créé."
    } catch {
        Write-Host "Erreur lors de la création du dossier de base '$personalFolderPath': $_"
        exit 1
    }
}

foreach ($row in $data) {
    if ($row -ne $null) {
        $username = $row.Prenom +" "+ $row.Nom
        $folderPath = Join-Path -Path $personalFolderPath -ChildPath $username

        if (-Not (Test-Path -Path $folderPath)) {
            try {
                New-Item -Path $folderPath -ItemType Directory
                Set-ADUser -Identity "$username" -HomeDirectory "\\WIN22P3\Dossiers Individuels$\$username" -HomeDrive "I:"
                Write-Host "Le dossier '$folderPath' a été créé pour l'utilisateur '$username'."
            } catch {
                Write-Host "Erreur lors de la création du dossier '$folderPath' pour l'utilisateur '$username': $_"
            }
        } else {
            Write-Host "Le dossier '$folderPath' pour l'utilisateur '$username' existe déjà."
        }
    }
}
```
**Explication** :

***Objectif*** : Créer un dossier personnel pour chaque utilisateur listé dans le fichier CSV sous un chemin de base spécifié.

***Fonctionnement*** :

Le script vérifie d'abord si le dossier de base pour les utilisateurs ($personalFolderPath) existe.  
S'il n'existe pas, il est créé.  
Pour chaque utilisateur dans le fichier CSV, un dossier est créé avec son nom, et ce dossier est assigné comme HomeDirectory dans Active Directory.  
Si le dossier existe déjà pour un utilisateur, un message est affiché et le script passe à l'utilisateur suivant. 

***Conclusion*** : Cette étape finalise le processus en créant les dossiers utilisateurs et en configurant leur HomeDirectory dans Active Directory.

### Conclusion
Ce script est un outil puissant pour les administrateurs système, leur permettant de créer et d'organiser des dossiers utilisateurs en fonction des structures d'Active Directory et des informations extraites d'un fichier CSV.
