# workstation-setup
ansible playbook to setup my workstation
utilisation de ansible pour réaliser toute la configuration post-install d'une workstation fedora


## REQUIREMENTS TO DEPLOY ON TARGET HOST	
installation des pre-requis sous root : détaillé dans le fichier REQUIREMENTS.MD

require root account on host server:

```
	dnf install ansible  (install python2 … :’(   )
	systemctl start sshd 
	echo 127.0.0.1 >> /etc/ansible/hosts
	# add ssh key to the known_hosts
	# connection test
	ssh 127.0.0.1 
	ansible all -m ping --ask-pass
```

## Usage - with ansible-pull

ansible-pull -d ansible -i 'localhost,' -U https://github.com/tatsugohan/workstation-setup.git --accept-host-key

execution du playbook
```
git clone https://github.com/tatsugohan/workstation-setup.git
cd workstation-setup

sudo ansible-playbook local.yml
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
	https://blog.engineyard.com/2014/building-a-vagrant-box
	- create a virtual box
		- Name : Fedora-template
		- 2048 RAM 
		- 20 Go of hard disk
                - port forwarding : [Name: SSH, Protocol: TCP, Host IP: blank, Host Port: 2222, Guest IP: blank, Guest Port: 22] 
	- add fedora iso in CDROM
		- install fedora on hard disk
		- do not encrypt the disk (otherwise vagrant won't be able to boot it)
		- setup a root password
		- create a testuser
	  eject fedora iso in CDROM
	- reboot (to the freshly installed fedora)
	- under root account 
		dnf upgrade
		# activate nopasword for wheel users
	 	sed -i -e 's/%wheel\tALL=(ALL)\tALL/#%wheel\tALL=(ALL)\tALL/' /etc/sudoers 
                sed -i -e 's/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/p' /etc/sudoers 

		useradd vagrant -G wheel
		mkdir -p /home/vagrant/.ssh
		chmod 0700 /home/vagrant/.ssh
		wget https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
 		chmod 0600 /home/vagrant/.ssh/authorized_keys
		chown -R vagrant /home/vagrant/.ssh
		systemctl enable sshd		

	- add virtualbox tools (menu peripherique) 
		https://www.if-not-true-then-false.com/2010/install-virtualbox-guest-additions-on-fedora-centos-red-hat-rhel/
		dnf install gcc kernel-devel kernel-headers dkms make bzip2 perl
		ln -sf /usr/lib/VBoxGuestAdditions/mount.vboxsf /sbin/mount.vboxsf
		
        - shutdown -h now

3. convert the virtual box to vagrant box 
        https://www.vagrantup.com/docs/virtualbox/boxes.html
	# note:  requires at least 4Gb of disk in /tmp	
	mkdir /tmp/vagrant-box
	cd /tmp/vagrant-box
	vagrant package --base Fedora-template --output Fedora-template-25.box
	vagrant box list
	vagrant box remove fedora25-workstation
        vagrant box add --name "Fedora25-workstation" --provider virtualbox ./Fedora-template-25.box
	cd ..
	rm -fr ./vagrant-box
