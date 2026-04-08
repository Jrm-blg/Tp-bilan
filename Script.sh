#!/bin/bash

# Chemins
TOIP_DIR="/TP_Bilan/owncloud/toip"
ARCHIVE_DIR="/TP_Bilan/owncloud/archive"
DATE=$(date +%d-%m-%Y_%H:%M:%S)

# 1. Sauvegarde CSV
CSV_SRC="$TOIP_DIR/logs.csv"
CSV_DST="$ARCHIVE_DIR/sio2-$DATE.csv"
cp "$CSV_SRC" "$CSV_DST"
echo "CSV sauvé : $CSV_DST"

# 2. Compression répertoire toip
ZIP_FILE="$ARCHIVE_DIR/sio2-$DATE.zip"
zip -r "$ZIP_FILE" "$TOIP_DIR/"
echo "ZIP créé : $ZIP_FILE"

# 3. Transfert FTP vers OMV
FTP_SERVER="192.168.20.42"     
FTP_USER="jrm"
FTP_PASS="sio123"
FTP_DIR="archives_toip"

ftp -n "$FTP_SERVER" <<EOF
quote USER $FTP_USER
quote PASS $FTP_PASS
cd $FTP_DIR
put "$ZIP_FILE"
quit
EOF

if [ $? -eq 0 ]; then
    echo "FTP OK : $(date)"
    # Nettoie ancien (optionnel)
    rm "$ZIP_FILE"
else
    echo "FTP ÉCHOUÉ : garde local"
fi
