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
sudo ufw status numbered	#liste les ports ouverts
sudo ufw delete <index>
```

Reste a autoriser via VirtualBox le fowrding du port 4242.

### Configuration de sudo

On cree les fichiers suivant:
```console
sudo touch /etc/sudoers.d/sudoconfig
sudo mkdir /var/log/sudo
sudo nano /ec/sudoers.d/sudoconfig
```

et on les remplit comme suit:
```
Defaults	passwd_tries=3
Defaults	badpass_message="Mot de passe incorrect."
Defaults	log_input
Defaults	log_output
Defaults	iolog_dir="/var/log/sudo"
Defaults	requiretty
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

### Securite forte pour les mots de passes

Installer `libpam-pwquality` et acceder au fichier config:
```console
sudo apt-get install libpam-pwquality
sudo nano /etc/pam.d/common-password
```

puis ajouter a la ligne `password requisite pam_pwqiality.so retry=3` les parametres suivants:
```
minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
```

Reste a changer les mots de passes pour suivre ces conventions:
```console
passwd		# Changer mot de passe utilisateur
sudo passwd	# Changer mot de passe root
```



