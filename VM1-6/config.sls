## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False

##Configuration de LAN3 sur VM1-6 (eth1)
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.156
    - netmask: 28

##Configuration automatique de LAN1-6 sur VM1-6 (eth2)
eth2:
  network.managed:
#### Version automatique (ne fonctionne pas...)
##    - enabled: True
##    - type: eth
##    - proto: none
##    - enable_ipv4: false
##    - ipv6proto: auto
##    - enable_ipv6: true
##    - ipv6_autoconf: yes
#### Version statique
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - ipv6proto: static
    - enable_ipv6: true
    - ipv6_autoconf: no
    - ipv6ipaddr: fc00:1234:1::16
    - ipv6netmask: 64

## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run

## Suppression de la passerelle par défaut
ip -6 route del default:
  cmd:
   - run

## Enable ipv4 forwarding
net.ipv4.ip_forward:
  sysctl:
    - present
    - value: 1

## Configuration d'une route par défaut vers VM2-6 via LAN1-6 (eth2)
ip -6 route add default via fc00:1234:1::26:
  cmd:
    - run
