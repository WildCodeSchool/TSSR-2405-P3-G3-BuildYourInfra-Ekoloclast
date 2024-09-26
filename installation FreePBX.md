 <div align="center">

![logo](https://github.com/WildCodeSchool/TSSR-2405-P3-G3-BuildYourInfra-Ekoloclast/blob/s04/ressources/charte/ekoloclasttitreok.png)

</div>


# Installation FreePBX

Pour installer le serveur VOIP FreePBX sur une machine virtuelle ,il est necessaire de posseder une image ISO avec la derniere version de FreePBX

Il faut creer une machine virtuelle avec l'ISO d'installation de FreePBX

![install](https://github.com/user-attachments/assets/c45b4384-8d5f-45ce-b69a-c5768c963209)


![install2](https://github.com/user-attachments/assets/8cb90c5b-99c0-419d-b1e2-2b8228784332) 

![install3](https://github.com/user-attachments/assets/79f3eec1-3b2d-4a98-a65d-6b8582ec351a)

Configurer un mot de passe pour le compte "root" de FreePBX

![mdp_root](https://github.com/user-attachments/assets/4b142954-a5ee-4dd8-9951-fd8401165a5b)

![mdp_root2](https://github.com/user-attachments/assets/95954577-6587-4e00-b3d0-0ddad93ebf4e)

![conf_mdp_root](https://github.com/user-attachments/assets/7268e9c8-42f3-4638-9f97-c9fd2bae5d22)

Installation terminée

![installation_complete](https://github.com/user-attachments/assets/5afa6d70-abfd-4156-a108-866ee6f7d478) 

Il est necessaire de redemarrer votre machine virtuelle et ,le cas echeant, retirer

 ## Passons a la configuration

 Demarrer la machine et se connecter en "root" 

 L'installation est configurée avec un clavier en "qwerty" ,pour facilter la configuration  nous allons passer en clavier "azerty"

 pour verifier quel mode de clavier est configuré dans notre machine taper "localectl" en ligne de commande 

 ![verif_clavier](https://github.com/user-attachments/assets/dc484e5c-cf00-4eb3-b22f-329e85d57a6b)

Ici nous voyons qu'elle est en "us" donc "qwerty"
Pour changer le mode de clavier  tapez ces commandes 

![changement clavierFR](https://github.com/user-attachments/assets/a1b76030-0beb-4449-879e-4f3d8b576e53)

Nous sommes passés en clavier "azerty"

A present il est necessaire de creer un utilisateur pour la connexion en SSH a notre machine .

avec la commande  "adduser <nom_utilisateur><mot de passe> "

J'ai nommé mon utilisateur "wilder" 

Editez le fichier " /etc/ssh/sshd_config" et modifie le fichier pour qu'il contienne les lignes suivantes :

PermitRootLogin no
AllowUsers wilder
PasswordAuthentication yes

Redémarrez le service avec systemctl restart sshd.

se connecter en ssh avec cet utilisateur 

![connexionSSH](https://github.com/user-attachments/assets/1878d761-4412-48ea-ba88-b7953b0816e0)

Vous pouvez vous connectez par une interface web avec l'ip de la machine hebergeant FreePBX 

![interface_web](https://github.com/user-attachments/assets/dd8e892b-50ab-467e-9793-69c25bf4b312)

FreePBX est un IPBX Asterisk avec une interface graphique.

La gestion se fait à partir d'un navigateur web.

Par l'interface web, connectez-vous en root sur la VM avec le mot de passe associé .
Indiquez également une addresse mail pour les notifications et clique sur Setup System.(une adresse mail factice est possible)

Dans la fenêtre, clique sur FreePBX Administration et reconnecte-toi en root.

![logoAdmin](https://github.com/user-attachments/assets/28e2c9cc-525c-476f-ace5-abb05835b125)

Appuez sur "skip" pour passer l'activation pour le moment et les pages de publicités

![skippub](https://github.com/user-attachments/assets/efe10fe7-7ac4-43bd-9da5-e415adc0164f)

Changez ou non la langue par defaut de FreePBX 

![languepardefaut](https://github.com/user-attachments/assets/dc194f5c-84e0-4635-ab23-557277bd6bfe) 

N'oubliez pas de cliquer sur "submit" si vous changez la langue par defaut 

Cliquez sur "abort" en ce qui concerne le firewall ,pour cet exercice  l'activation n'est pas necessaire.

![abortfirewall](https://github.com/user-attachments/assets/e37c1129-4abb-4bf8-885e-c01c74c7eff8)

A la fenêtre de l'essai de SIP Station clique sur "Not Now"

Vous arrivez sur le tableau de bord, cliquez sur "Apply Config" (en rouge)pour valider tout ce que vous venez de faire

![appliqueconfig](https://github.com/user-attachments/assets/a096a94a-2315-4391-bd95-cd0bf05fd9e3)

Il est conseillé de faire une activation du serveur pour avoir accès aux fonctionnalités  

Va dans le menu "Admin" puis "System Admin"

![activationserveur](https://github.com/user-attachments/assets/ab845991-6bac-499d-83fb-ca4145fc6dd5)

Cliquez sur "Activation" puis "Activate"

Dans la fenêtre qui s'affiche, cliquez sur "Activate"

Entrez une adresse email

Dans la fenêtre qui s'affiche, renseigne les différentes informations, et :

Pour Which best describes you mets I use your products and services with my Business(s) and do not want to resell it
Pour Do you agree to receive product and marketing emails from Sangoma ? coche No

Cliquez sur "Create"

![createactivation](https://github.com/user-attachments/assets/d0e83201-5838-40d7-9279-13d34913650b)

Dans la fenêtre d'activation, cliquez sur "Activate" et attendez que l'activation se fasse.

La fenêtre de mise-à-jour des modules va s'afficher automatiquement.

![moduleupdate](https://github.com/user-attachments/assets/74b06731-b242-4d17-8a5d-03e0e128b38c)

Une fois que tout est terminé, cliquez sur "Apply config".

Il peut y avoir des erreurs sur le serveurs suite à la mise-à-jour des modules et dans ce cas, l'accès au serveur ne se fait pas.
Les modules incriminés sont précisés et il faut les réinstaller et les activer.
Dans ce cas, sur le serveur en CLI, exécute les commandes suivantes :

fwconsole ma install <module>
fwconsole ma enable <module>
Par exemple pour les modules userman, voicemail, et sysadmin :

fwconsole ma install userman
fwconsole ma enable userman
fwconsole ma install voicemail
fwconsole ma enable voicemail
fwconsole ma install sysadmin
fwconsole ma enable sysadmin




















 
