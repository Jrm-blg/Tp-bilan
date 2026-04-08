#!/bin/bash

set -e
apt update -y
apt upgrade -y
echo "Update && Upgrade des Paquets"
apt install curl -y
apt install ca-certificates -y
echo "Installation DOCKEUR sur le dockeur.com"
curl https://get.docker.com | bash
apt install docker-compose -y
systemctl enable --now docker
systemctl start docker
echo "Terminer "


