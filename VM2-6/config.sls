## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False

## Configuration de LAN1-6 sur VM2-6 (eth1)
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - ipv6proto: static
    - enable_ipv6: true
    - ipv6_autoconf: no
    - ipv6ipaddr: fc00:1234:1::26
    - ipv6netmask: 64

## Configuration de LAN2-6 sur VM2-6 (eth2)
eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - ipv6proto: static
    - enable_ipv6: true
    - ipv6_autoconf: no
    - ipv6ipaddr: fc00:1234:2::26
    - ipv6netmask: 64

## Enable ipv6 forwarding
net.ipv6.conf.all.forwarding:
  sysctl:
    - present
    - value: 1

## Install and configure radvd
radvd:
  pkg:
    - installed
  service:
    - running
    - enable: True

/etc/radvd.conf:
    file.managed:
      - source: /vagrant/radvd.conf
      - user: root
      - group: root
      - mode: 644

# restart radvd:
service radvd restart:
  cmd:
    - run

## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run

## Suppression de la passerelle par défaut
##ip -6 route del default:
##  cmd:
##   - run