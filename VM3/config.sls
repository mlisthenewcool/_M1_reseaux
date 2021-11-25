## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False

## Configuration de LAN2 sur VM3 (eth1)
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.163
    - netmask: 28

## Configuration de LAN4 sur VM3 (eth2)
eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.183
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

## Configuration d'une route par défaut vers VM3-6 via LAN4 (eth2)
ip route add default via 172.16.2.186:
  cmd:
    - run