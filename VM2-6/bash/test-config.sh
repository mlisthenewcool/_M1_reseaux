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
read -p "<ENTREE> pour afficher les routes IPv6..."
ip -6 route
echo "------------------------------------------"
echo "Fin des tests !"
echo "------------------------------------------"