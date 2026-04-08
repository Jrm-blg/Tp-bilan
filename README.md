# Tp-Stockage Cloud / Owncloud

script d'installation pour docker : install-docker.sh
installation pour owncloud : docker-compose.yml  (provient de  https://hub.docker.com/_/owncloud/ )

On commence par "up" -> docker compose up -d

Puis on accède a la page via : http://IP:8080

on crée ensuite notre user , puis a partir de la nous pouvons nous connecté a notre owncloud.


Depuis un client windows nous pouvons installé le logiciel via : https://owncloud.com/desktop-app/
Il nous suffit juste a rentrer notre ip ainsi que notre port dans le logiciel (exemple : 192.168.20.42:8080)
Notre utilisateur pourra alors synchroniser ses fichiers avec notre ownclood.

OwnCloud offre de nombreuses fonctionnalités avancées pour la gestion de fichiers, utilisateurs et intégrations.

**gestion des utilisateurs et authentification**

    LDAP/Active Directory : Intégration native pour importer automatiquement les utilisateurs et groupes depuis un annuaire LDAP (ex: AD Windows Server). Authentification transparente sans double compte.

    Gestion multi-utilisateurs : Création manuelle d'utilisateurs/grupes, quotas par utilisateur, rôles admin/gestionnaire.

    SSO (Single Sign-On) : Support SAML et OAuth pour intégration entreprise.

**Synchronisation et accès fichiers**

    Clients multiplateformes : Windows, macOS, Linux, iOS, Android avec sync bidirectionnelle.

    WebDAV : Accès direct aux fichiers via explorateur Windows (\\ton-ip@8080) ou applications tierces.

    Virtual Files : Accès "à la demande" sans télécharger tous les fichiers (économie disque).

    Édition collaborative : Intégration OnlyOffice/Collabora pour édition Office en temps réel

    Stockage et performance

    Stockage externe : NFS, SMB, S3, FTP, Google Drive, Dropbox montés comme disques virtuels.

    Versioning : Historique complet des fichiers (restaure versions précédentes).

    Chiffrement : Serveur-side et client-side (zero-knowledge).


Tp-Stockage Cloud / Script

Le script est : Script.sh
Une fois sur notre machine il faut executer cette commande : chmod +x Script.sh  (elle permet de le rendre executable)
Puis avec crontab -e on peut alors y ajouter : 
45 23 * * * /TP_Bilan/owncloud/backup_toip.sh >> /TP_Bilan/owncloud/backup.log 2>&1
(cela va permettre d'enregisté a 23h45)

Explication du script : 

**DATE=$(date +%d-%m-%Y_%H:%M:%S)  
CSV_DST="$ARCHIVE_DIR/sio2-$DATE.csv"  
cp "$TOIP_DIR/logs.csv" "$CSV_DST"     # Copie logs.csv → archive/**
Ceci permet de faire la sauveguarde du CSV 

**ZIP_FILE="$ARCHIVE_DIR/sio2-$DATE.zip"  **
**zip -r "$ZIP_FILE" "$TOIP_DIR/"         **
Permet de faire un .zip pour compresser le dossier 

curl -T "$ZIP_FILE" ftp://user:pass@IP/archives_toip/
Permet d'envoyé notre zip vers notre serveur ftp , il faut juste y ajouter le user pui l'ip de notre serveur FTP
exemple : curl -T "$ZIP_FILE" ftp://user:jrm@192.168.20.42/archives_toip/
