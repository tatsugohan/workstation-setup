# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

alias python=python3

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
