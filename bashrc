shopt -s histappend
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'

export CLICOLOR=1

export PS1="[\u@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

alias ki='kinit -l 48h agilbert@CERN.CH'

if [ -f "$HOME/.local.bashrc" ]; then
  source $HOME/.local.bashrc
fi
