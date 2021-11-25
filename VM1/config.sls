## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False

## Configuration de LAN1 sur VM1 (eth1)
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.131
    - netmask: 28

## Configuration de LAN3 sur VM1 (eth2)
eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.151
    - netmask: 28
    
## Enable ipv4 forwarding
net.ipv4.ip_forward:
  sysctl:
    - present
    - value: 1

## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run

## Configuration d'une route par défaut vers VM1-6 via LAN3 (eth2)
ip route add default via 172.16.2.156:
  cmd:
    - run