export ZSH="~/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  aws
  docker
  colored-man-pages
)
source $ZSH/oh-my-zsh.sh
source ~/.local/bin/aws_zsh_completer.sh
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-8.fc28.x86_64/jre/
export PATH=$PATH:~/.local/bin
