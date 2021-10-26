# ft_Born2BeRoot
Mon projet Born2BeRoot de 42.

## 1. Installation de la VM

## 2. Configuration de la VM
### Installation de sudo

On commemnce par installer sudo et ajouter <username>
au groupe sudo:

```console
su -
apt install sudo -y
usermod -aG sudo <username>
sudo visudo
```

Quand on est dans le fichier sudoers,
il faut ajouter cette ligne:
```
<username>	ALL=(ALL) ALL
```

### Ajout du groupe user42

```console
sudo addgroup user42
sudo adduser <username> user42
sudo apt update
```

### Installation de SSH

On installe `openssh-server`:
```console
sudo apt install openssh-server
```

On change `#Port 22` em `Port 4242` dans les fichiers `/etc/ssh/sshd_config` et `/etc/ssh/ssh_config`, puis on change `#PermitRootLogin prohibit-password` en `PermitRootLogin no` dans `/etc/ssh/sshd_config`.

Il reste a restart le service `sudo service ssh restart` et verifie qu'il est actif `sudo service ssh status`.

### Installation de UFW

On installe le pare-feu `UFW`:
```console
sudo apt install ufw
sudo ufw enable
```

On configure l'access via le port `4242`:
```console
sudo ufw allow ssh
sudo ufw allow 4242
sudo ufw status
```

On supprime l'acces via le port `22`:
```console
sudo ufw status numbered	(pour trouver l'indice des port a supprimer)
sudo ufw delete <index>
```

Reste a autoriser via VirtualBox le fowrding du port 4242.

###
