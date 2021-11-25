## Desactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False

## Configuration de LAN1 sur VM2 (eth1)
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.132
    - netmask: 28

## Configuration de LAN2 sur VM2 (eth2)
eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.162
    - netmask: 28

## Configuration de la route vers LAN3 via VM1 (eth1)
ip route add 172.16.2.144/28 via 172.16.2.131 dev eth1:
  cmd:
    - run

## Configuration de la route vers LAN4 via VM3 (eth2)
ip route add 172.16.2.176/28 via 172.16.2.163 dev eth2:
  cmd:
    - run

## Enable ipv4 forwarding
net.ipv4.ip_forward:
  sysctl:
    - present
    - value: 1

## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run