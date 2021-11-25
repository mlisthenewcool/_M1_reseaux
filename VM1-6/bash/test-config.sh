#!/bin/bash
echo "Tests de validation fonctionnelle :"
read -p "<ENTREE> pour afficher les paramètres réseaux de ETH1..."
echo "-------------------- ETH1 --------------------"
ip addr show dev eth1
echo "----------------------------------------------"
read -p "<ENTREE> pour afficher les paramètres réseaux de ETH2..."
echo "-------------------- ETH2 --------------------"
ip addr show dev eth2
echo "----------------------------------------------"
read -p "<ENTREE> pour afficher les paramètres réseaux de TUN0..."
echo "-------------------- TUN0 --------------------"
ip addr show dev tun0
echo "------------------------------------------"
read -p "<ENTREE> pour afficher les routes IPv4..."
ip route
echo "------------------------------------------"
read -p "<ENTREE> pour afficher les routes IPv6..."
ip -6 route
echo "------------------------------------------"
echo "Tests de la performance de la connexion avec des tampons de tailles différents..."
read -p "<ENTREE> pour exécuter : iperf3  -c 172.16.2.183 -n 1 -l 10"
iperf3  -c 172.16.2.183 -n 1 -l 10
echo "------------------------------------------"
read -p "<ENTREE> pour exécuter : iperf3  -c 172.16.2.183 -n 1 -l 2K"
iperf3  -c 172.16.2.183 -n 1 -l 2K
echo "------------------------------------------"
read -p "<ENTREE> pour exécuter : iperf3  -c 172.16.2.183 -n 1 -l 128K"
iperf3  -c 172.16.2.183 -n 1 -l 128K
echo "------------------------------------------"
read -p "<ENTREE> pour exécuter : iperf3  -c 172.16.2.183 -n 1 -l 1M"
iperf3  -c 172.16.2.183 -n 1 -l 1M
echo "------------------------------------------"
echo "Fin des tests !"
echo "------------------------------------------"