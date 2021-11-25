#!/bin/bash
echo "------------------------------------------"
echo "Tests de validation fonctionnelle :"
echo "------------------------------------------"
read -p "<ENTREE> pour afficher les paramètres réseaux de ETH1..."
echo "-------------------- ETH1 --------------------"
ip addr show dev eth1
echo "----------------------------------------------"
read -p "<ENTREE> pour afficher les paramètres réseaux de ETH2..."
echo "-------------------- ETH2 --------------------"
ip addr show dev eth2
echo "----------------------------------------------"
read -p "<ENTREE> pour afficher les routes IPv4..."
ip route
echo "------------------------------------------"
read -p "<ENTREE> pour envoyer un ping vers VM3 [172.16.2.183]"
ping -c 1 172.16.2.183
echo "------------------------------------------"
read -p "<ENTREE> pour créer un fichier \"msg.txt\" contenant le message \"Test présentation !\" dans le dossier '/vagrant/test/'..."
mkdir -p /vagrant/test/
echo "Test présentation !" > /vagrant/test/msg.txt
ls -lah /vagrant/test/msg.txt
read -p "<ENTREE> pour afficher le contenu du fichier..."
cat /vagrant/test/msg.txt
echo "------------------------------------------"
read -p "<ENTREE> pour l'envoyer sur le service echo de VM3..."
echo "nc 172.16.2.183  124 < /vagrant/test/msg.txt"
nc 172.16.2.183  124 < /vagrant/test/msg.txt
echo "------------------------------------------"