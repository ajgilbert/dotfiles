shopt -s histappend
shopt -s checkwinsize
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T: "
PROMPT_COMMAND='history -a'

export CLICOLOR=1

export X509_USER_PROXY=~/.globus/user_proxy.pem

export SHORT_HOSTNAME=$(echo $(hostname -s) | sed "s|agilbert-vm-cc7|avm7|g" | sed "s|agilbert-vm-el9|avm9|g" | sed "s|lxplus9.*|lxp9|g" | sed "s|lxplus7.*|lxp7|g")
PROMPT_DIRTRIM=3
export PS1="[${SHORT_HOSTNAME} \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"
#export PS1="[\u@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

alias ki='kinit -l 48h agilbert@CERN.CH'
alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00; export X509_USER_PROXY=~/.globus/user_proxy.pem'

if [ -f "$HOME/.local.bashrc" ]; then
  source $HOME/.local.bashrc
fi
