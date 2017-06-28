# workstation-setup
ansible playbook to setup my workstation
utilisation de ansible pour réaliser toute la configuration post-install d'une workstation fedora


## REQUIREMENTS TO DEPLOY ON TARGET HOST	
installation des pre-requis sous root : détaillé dans le fichier REQUIREMENTS.MD

require root account on host server:
	dnf install ansible  (install python2 … :’(   )
	systemctl start sshd 
	echo 127.0.0.1 >> /etc/ansible/hosts
	# add ssh key to the known_hosts
	# connection test
	ansible all -m ping --ask-pass

## Usage

execution du playbook
```
git clone https://github.com/tatsugohan/workstation-setup.git
cd workstation-setup

sudo ansible-playbook workstation.yaml
```

note: All of the following  steps require an internet connexion 
## TESTS with Vagrant - Fedora Cloud (Quicker to initiate)
permet d'effectuer des tests rapide sur l'installation des packages et le bon fonctionnement des playbooks
 
1. Create a vagrant box based on the vagrant file

vagrant up
vagrans ssh 
manual tests ! (sic)

## TESTS with Vagrant - Fedora workstation
1. download fedora iso from fedora download portal
2. install it manually in virtualbox with the following specifications 
	- 2048 RAM 
	- 20 Go of hard disk
	- install fedora on hard disk
	- do not encrypt the disk (otherwise vagrant won't be able to boot it)
	- setup a root password
	- create a testuser
	- under root account 
		dnf upgrade





