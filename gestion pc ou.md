# Placement automatique des poste client
## Prérequi
- Script powreshell 
- GPO 
## Scriipt powershell
Le script s'executera lors de la jonction du poste client au domaine, il prendra la liste du fichier **mapping.json** qu'il faut modifier en fonction des services.
Ce script déterminera le service auquel l'ordinateur appartient et il déplacera l'objet ordinateur dans l'OU appropriée.
Le script et le fichier mapping doivent être dans un dossier partager accéssible au ordinateur du domaine.

### 1. Création de la GPO :

   a. Ouvrez la console "Group Policy Management" (gpmc.msc).  
   b. Faites un clic droit sur votre domaine ou sur une OU spécifique.  
   c. Sélectionnez "Créer un objet GPO dans ce domaine,et le lier ici...".  
   d. Nommez la GPO .  

### 2. Configuration de la GPO :

   a. Éditez la nouvelle GPO.
   b. Naviguez vers : Configuration ordinateur > Stratégies > Paramètres Windows  > Scripts (Démarrage/Arrêt du système).
   c. Double-cliquez sur "Demarrage".
   d. Cliquez sur "Ajouter".
   e. Dans "Nom du script", entrez : powershell.exe
   f. Dans "Paramètres d scripts", entrez : -ExecutionPolicy Bypass -File ```"\\chemin vers le script.ps1"```

### 3. Configuration des permissions :

   a. Assurez-vous que les poste client ont accès en lecture au script et au dossier qui le contient.
   b. Donnez les permissions nécessaires pour le dossier de logs et le fichier de configuration.

### 4. Application de la GPO :

   a. Si vous avez créé la GPO au niveau du domaine, elle s'appliquera à tous les ordinateurs.
   b. Pour cibler des OUs spécifiques, liez la GPO à ces OUs.

## Application aux PC déjà joints au domaine :

   a. La GPO s'appliquera automatiquement lors du prochain redémarrage des PC.
   b. Pour forcer l'application sans redémarrage :
      - Sur chaque PC, ouvrez une invite de commande en tant qu'administrateur.
      - Exécutez : `gpupdate /force`
      - Puis exécutez : `shutdown /r /t 0` pour redémarrer directement(nécessaire pour les scripts de démarrage).

### Vérification :

   a. Sur un PC test, exécutez `gpresult /r` pour vérifier que la GPO est appliquée.
   b. Vérifiez les logs du script pour confirmer son exécution.

### Dépannage :

   a. Utilisez "Group Policy Results" dans la console GPMC pour diagnostiquer les problèmes.
   b. Vérifiez les journaux d'événements Windows sur les PC clients.


Cette approche permet non seulement d'appliquer la GPO aux nouveaux PC rejoignant le domaine, mais aussi de réorganiser les PC existants dans les bonnes OUs. 

