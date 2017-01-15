# workstation-setup
ansible playbook to setup my workstation
utilisation de ansible pour réaliser toute la configuration post-install d'une workstation fedora


## Usage

installation des pre-requis sous root
```
dnf -y install ansible

```

execution du playbook
```
git clone https://github.com/tatsugohan/workstation-setup.git
cd workstation-setup

sudo ansible-playbook workstation.yaml
```
