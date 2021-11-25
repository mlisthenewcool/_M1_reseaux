#!/bin/bash
echo "----------------------------------------------------"
echo "Installation d'un serveur echo (pour futures tests)..."
echo "----------------------------------------------------"
apt-get install inetutils-inetd
update-inetd --add "echo stream tcp nowait nobody internal"
service inetutils-inetd start
service inetutils-inetd restart
service inetutils-inetd status
echo "----------------------------------------------------"
echo "Installation du paquet \"iperf3\" (pour futures tests)..."
echo "----------------------------------------------------"
apt install iperf3
echo "----------------------------------------------------"
echo "Configuration réseau..."
echo "----------------------------------------------------"
salt-call state.apply
echo "----------------------------------------------------"
