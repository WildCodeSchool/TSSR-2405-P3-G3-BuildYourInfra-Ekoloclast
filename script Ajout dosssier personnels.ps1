# Chargement du module Active Directory
if (-not (Get-Module -Name ActiveDirectory)) {
    if (Get-Module -ListAvailable -Name ActiveDirectory) {
        Import-Module -Name ActiveDirectory
    } else {
        Write-Host "Le module Active Directory n'est pas disponible sur ce système."
        exit 1
    }
}

Write-Host "Module Active Directory chargé avec succès."

# Spécifiez le chemin du fichier .csv
$csvFilePath = "C:\Users\Administrateur\Documents\Annexe4ok.txt"

# Importer les données du fichier CSV
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

# Définir le chemin où les dossiers seront créés
$baseFolderPath = "D:"

# Définir l'OU parent à partir de laquelle les sous-OUs seront listés
$parentOU = "OU=Paris,DC=Projet3,DC=lan"

# Vérifier si l'OU parent existe
try {
    $parentOUObject = Get-ADOrganizationalUnit -Identity $parentOU -ErrorAction Stop
    Write-Host "L'OU parent '$parentOU' a été trouvé."
} catch {
    Write-Host "Erreur : L'OU parent '$parentOU' n'a pas été trouvé. Vérifiez que le DN est correct."
    exit 1
}

# Fonction récursive pour créer des dossiers pour les sous-OUs
function Create-FoldersForOUs {
    param (
        [string]$currentOU,
        [string]$currentPath
    )

    # Obtenir la liste des sous-OUs
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

        # Appel récursif pour traiter les sous-OUs de cette sous-OU
        Create-FoldersForOUs -currentOU $subOU.DistinguishedName -currentPath $folderPath
    }
}

# Appel de la fonction récursive pour commencer à partir de l'OU parent
Create-FoldersForOUs -currentOU $parentOU -currentPath $baseFolderPath

# Créer un dossier personnel pour chaque utilisateur dans E:\Dossiers Individuels
$personalFolderPath = "D:\Dossiers Individuels"

# Vérifier si le chemin de base existe, sinon le créer
if (-Not (Test-Path -Path $personalFolderPath)) {
    try {
        New-Item -Path $personalFolderPath -ItemType Directory
        Write-Host "Le dossier de base '$personalFolderPath' a été créé."
    } catch {
        Write-Host "Erreur lors de la création du dossier de base '$personalFolderPath': $_"
        exit 1
    }
}

# Créer un dossier pour chaque utilisateur
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
