shopt -s histappend
shopt -s checkwinsize
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T: "
PROMPT_COMMAND='history -a'

export CLICOLOR=1

export X509_USER_PROXY=~/.globus/user_proxy.pem

export PS1="[\u@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

alias ki='kinit -l 48h agilbert@CERN.CH'
alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00; export X509_USER_PROXY=~/.globus/user_proxy.pem'

if [ -f "$HOME/.local.bashrc" ]; then
  source $HOME/.local.bashrc
fi
