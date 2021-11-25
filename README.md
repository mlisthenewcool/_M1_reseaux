## m1_projet_reseaux

Ouvrir VM1, VM3, VM1-6, VM2-6 et VM3-6
- Sur chaque VM, exécuter : sudo -s && source /vagrant/bash/vm-setup.sh

Le tunnel fonctionne dans les deux sens, c'est-à-dire que les commandes ci-dessous sont intervertibles.
Dans le cas où l'on souhaite créer le tunnel depuis VM1-6 :

Sur VM1-6 :
- lancer "./extremite/extremite -i tun_VM1_6 -s"
(par défaut le port choisi est 123, il est possible de le modifier en rajoutant l'option -p 5000 pour utiliser le port 5000 par exemple)

Sur VM3-6 :
- lancer "./extremite/extremite -i tun_VM3_6 -c fc00:1234:1::16"
(si le port d'écoute du serveur a été modifié, utiliser l'option -p afin de s'y connecter)

Amusez-vous ! Il est désormais possible de recevoir et d'envoyer des paquets depuis VM1 vers VM3 et vice-versa.

Exemples de test :

- ping
  - sur VM1, lancer ping -c 1 172.16.2.183
  - sur VM3, lancer ping -c 1 172.16.2.151

- echo

- iperf3
    - sur VM3, lancer iperf3 -s
    - sur VM1-6, lancer iperf3 -c 172.16.2.183 -n 1 -l 100

### installer vagrant
    - télécharger dernière version
    - importer la clef gpg
    - télécharger les fichiers shasum et shasum.sig
    - vérifier signature
        gpg --verify @clef
    - vérifier somme de contrôle
        shasum -a 256 -c @ficher shasum
    - dpkg -i @paquet.deb

### installer virtualbox
    - 

### créer une box
    vagrant box add @la_box_à_installer --name @name_box

### lister les boxes
    vagrant box list

### lancer une box
    vagrant up
