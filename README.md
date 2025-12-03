# Tp-bilan

script d'installation pour docker : install-docker.sh
Permet l'installation de docker , analyse en plus de l'os pour choisir la meilleure version pour docker

script d'installation de Wordpresse et de Zabbix : compose.yaml Permet l'installation de Zabbix et de Wordpress

Pour accéder au Wordpress , il nous faut l'ip de la machine :

A noter : ip -4 addr show dev ens18 (Attention a remplacer ens18 par la bonne carte réseau) , cette commande permet d'avoir l'ip exacte de la carte , tandis que si on fait 'ip a' on aurait toute les ip du docker.

Pour accéder au Wordpress :

Il faut rentrer : IP: http://IP:8082/

Pour accéder a Zabbix :

Il faut rentrer notre IP suivi du port 8085 : http://IP:8085/

    [! Loging & Password ] Username : admin Password : zabbix

A savoir :

Les ports attribuer a nos différentes images sont modifiable depuis les scripts du compose.yaml.

Exemple :

Si on souhaite avoir notre Wordpress sur un autre port que 8082 lors de l'installation il nous suffira juste de modifier cette ligne par le port que l'on souhaite :

"8082:80" devient "8080:80" :
