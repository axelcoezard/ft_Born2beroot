# ft_Born2BeRoot
Mon projet Born2BeRoot de 42.

# Configuration de la VM
## Installation de sudo

```console
	su -
	apt install sudo -y
	usermod -aG sudo <username>
	sudo visudo
```

Quand on est dans le fichier sudoers,
il faut ajouter cette ligne;

```
	<username>	ALL=(ALL) ALL
```

## Ajout du groupe user42

```console
	sudo addgroup user42
	sudo adduser <username> user42
	sudo apt update
```

## Installation de SSH
