# Script de placement automatique des ordinateurs dans les OU appropriées
# Nom du fichier : PlacePC.ps1

# Importation du module Active Directory
Import-Module ActiveDirectory

# Définition des variables
$computerName = $env:COMPUTERNAME
$domainName = "dams.lan"
$logPath = "\\WIN-SERV22\log$\placement_pc.log"
$configPath = "\\WIN-SERV22\ressources\mapping.json"

# Fonction de journalisation
function Log-Message {
    param([string]$message)
    $logEntry = "$(Get-Date) - $message"
    Add-Content -Path $logPath -Value $logEntry
    Write-Host $logEntry
}

# Chargement de la configuration
try {
    $config = Get-Content $configPath -ErrorAction Stop | ConvertFrom-Json
    Log-Message "Configuration chargée avec succès"
}
catch {
    Log-Message "Erreur lors du chargement de la configuration : $_"
    exit
}

# Détermination du service
$service = $config.services | Where-Object { $computerName -like $_.prefix } | Select-Object -ExpandProperty name -First 1

if (-not $service) {
    $service = "AutresServices"
    Log-Message "Aucun service correspondant trouvé pour $computerName. Utilisation de 'AutresServices'"
}
else {
    Log-Message "Service déterminé pour $computerName : $service"
}

# Gestion des cas spéciaux
if ($computerName -like "SRV*") {
    $ouPath = "OU=Serveurs,DC=$($domainName.Split('.')[0]),DC=$($domainName.Split('.')[1])"
    Log-Message "Ordinateur $computerName identifié comme serveur"
}
else {
    $ouPath = "OU=$service,OU=Ordinateurs,DC=$($domainName.Split('.')[0]),DC=$($domainName.Split('.')[1])"
}

# Vérification de l'existence de l'OU et déplacement de l'objet
try {
    if (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$ouPath'" -ErrorAction Stop) {
        $computerDN = (Get-ADComputer $computerName).DistinguishedName
        Move-ADObject -Identity $computerDN -TargetPath $ouPath -ErrorAction Stop
        Log-Message "Ordinateur $computerName déplacé avec succès dans $ouPath"
    }
    else {
        throw "L'OU $ouPath n'existe pas"
    }
}
catch {
    Log-Message "Erreur lors du déplacement de l'ordinateur : $_"
    Log-Message "L'ordinateur $computerName reste dans son emplacement actuel"
}

Log-Message "Opération terminée pour $computerName"