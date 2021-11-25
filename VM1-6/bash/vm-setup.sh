#!/bin/bash
echo "----------------------------------------------------"
echo "Installation du paquet \"netcat\" (pour futures tests)..."
echo "----------------------------------------------------"
apt install netcat
echo "----------------------------------------------------"
echo "Installation du paquet \"netcat6\" (pour futures tests)..."
echo "----------------------------------------------------"
apt install netcat6
echo "----------------------------------------------------"
echo "Installation du paquet \"iperf3\" (pour futures tests)..."
echo "----------------------------------------------------"
apt install iperf3
echo "----------------------------------------------------"
echo "Configuration réseau..."
echo "----------------------------------------------------"
salt-call state.apply
echo "----------------------------------------------------"
echo "Compilation du projet..."
echo "----------------------------------------------------"
cd /mnt/partage/
make clean
make
echo "----------------------------------------------------"