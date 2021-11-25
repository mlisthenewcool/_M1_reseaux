#!/bin/bash
echo "----------------------------------------------------"
echo "Installation du paquet \"netcat\" (pour futures tests)..."
echo "----------------------------------------------------"
apt install netcat
echo "----------------------------------------------------"
echo "Configuration réseau..."
echo "----------------------------------------------------"
salt-call state.apply
echo "----------------------------------------------------"