# List of changes to add in the ansible playbook

## configure gnome

### limit application switch (Alt + tab) to the current desktop
gsettings set org.gnome.shell.app-switcher current-workspace-only true


## oh-my-zsh installation and config

### has to be done in the user context
This operation will do a git clone in ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### add the following line in the .zshrc
export AWS_PROFILE="default"
#export PS1="\[\e[01;31m\][\$AWS_PROFILE]\[\e[00m\]$PS1"
export PS1="[\$AWS_PROFILE] $PS1"


## add users to docker group
/etc/groups

## install postman
this operation has to be done in the user context
mkdir -p ~/bin
cd ~/bin
wget https://dl.pstmn.io/download/latest/linux64 -O - | tar -xzvf -

## install atom
rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'


## install automation tools
- terraform
- terragrunt
- apex (require root access to deploy in /usr/local/bin/apex)
curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh

## install vim plug'ins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## copy user local files
copy and setup default configuration files  :
   - .gitignore_global  : http://egorsmirnov.me/2015/05/04/global-gitignore-file.html
   - .gitconfig
   - .bashrc
