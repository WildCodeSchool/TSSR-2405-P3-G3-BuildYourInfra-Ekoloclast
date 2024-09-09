<div align="center"> 

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)   

</div>

# Plan de Reprise d'Activité (PRA)
## 1. Introduction
Objectif : Restaurer les opérations après une panne ou un désastre.
Portée : Ce plan couvre les serveurs Windows Server 2022 (AD et DHCP), Windows Server 2022 Core (lecteur seul), GLPI, le pare-feu pfSense et le routeur VyOS.
## 2. Description de l'Infrastructure
Serveurs :
Windows Server 2022 : Active Directory (AD) et DHCP.
Windows Server 2022 Core : Lecteur seul.
Serveur GLPI : Gestion des actifs et des tickets.
Réseaux :
Pare-feu pfSense : Sécurité réseau.
Routeur VyOS : Routage réseau.
## 3. Localisation des Ressources
Sites principaux : Tous les serveurs sont situés au même endroit.
Sites de secours : À définir (recommandé d'avoir un site de secours pour les sauvegardes et la reprise).
## 4. Dépendances
Dépendances entre systèmes :
AD et DHCP : Critiques pour l'authentification et l'attribution des adresses IP.
GLPI : Dépend de la base de données pour la gestion des actifs et des tickets.
pfSense : Critique pour la sécurité réseau.
VyOS : Critique pour le routage réseau.
## 5. Objectifs de Temps de Récupération (RTO)
RTO pour chaque système :
AD et DHCP : 4 heures.
Windows Server 2022 Core : 4 heures.
GLPI : 8 heures.
pfSense : 2 heures.
VyOS : 2 heures.
## 6. Objectifs de Point de Récupération (RPO)
RPO pour chaque système :
AD et DHCP : 1 heure.
Windows Server 2022 Core : 1 heure.
GLPI : 4 heures.
pfSense : 1 heure.
VyOS : 1 heure.
## 7. Procédures de Sauvegarde
Stratégies de sauvegarde :
AD et DHCP : Sauvegarde complète quotidienne, sauvegarde incrémentielle toutes les heures.
Windows Server 2022 Core : Sauvegarde complète quotidienne, sauvegarde incrémentielle toutes les heures.
GLPI : Sauvegarde complète quotidienne, sauvegarde incrémentielle toutes les 4 heures.
pfSense : Sauvegarde de la configuration quotidienne.
VyOS : Sauvegarde de la configuration quotidienne.
Localisation des sauvegardes : Sauvegardes locales et distantes (recommandé d'utiliser un service de sauvegarde cloud ou un site de secours).
## 8. Procédures de Test
Fréquence des tests : Tests trimestriels.
Méthodes de test : Simulations de pannes, tests de basculement, tests de restauration des sauvegardes.
## 9. Plan de Communication
Contacts clés : Liste des contacts clés et leurs rôles.
Procédures de communication : Procédures pour informer les parties prenantes en cas de panne.
## 10. Procédures de Récupération
Étapes de récupération :

### AD et DHCP :
Restaurer la sauvegarde complète la plus récente.
Appliquer les sauvegardes incrémentielles.
Vérifier l'intégrité des données.
Redémarrer les services AD et DHCP.
Windows Server 2022 Core :
Restaurer la sauvegarde complète la plus récente.
Appliquer les sauvegardes incrémentielles.
Vérifier l'intégrité des données.
Redémarrer les services.
### GLPI :
Restaurer la sauvegarde complète la plus récente.
Appliquer les sauvegardes incrémentielles.
Vérifier l'intégrité des données.
Redémarrer les services GLPI.
### pfSense :
Restaurer la configuration la plus récente.
Vérifier la configuration.
Redémarrer les services pfSense.
### VyOS :
Restaurer la configuration la plus récente.
Vérifier la configuration.
Redémarrer les services VyOS.
Outils et ressources : Liste des outils et ressources nécessaires pour la récupération.

## 11. Documentation et Formation
Documentation : Documentation détaillée des procédures de récupération.
Formation : Plan de formation pour les équipes impliquées dans la récupération.