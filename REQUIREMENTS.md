	
require root account :
	dnf install ansible  (install python2 … :’(   )
	systemctl start sshd 
	echo 127.0.0.1 >> /etc/ansible/hosts
	# add ssh key to the known_hosts
	# connection test
	ansible all -m ping --ask-pass

