shopt -s histappend
shopt -s checkwinsize
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T: "
PROMPT_COMMAND='history -a'

export CLICOLOR=1

export X509_USER_PROXY=~/.globus/user_proxy.pem

export SHORT_HOSTNAME=$(echo $(hostname -s) | sed "s|agilbert-vm-cc7|avm7|g" | sed "s|agilbert-vm-el9|avm9|g" | sed "s|lxplus9.*|lxp9|g" | sed "s|lxplus7.*|lxp7|g" | sed "s|llruicms01.*|llrcms|g")
PROMPT_DIRTRIM=3
export PS1="[${SHORT_HOSTNAME} \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"
#export PS1="[\u@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

alias ki='kinit -l 48h agilbert@CERN.CH'
alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00; export X509_USER_PROXY=~/.globus/user_proxy.pem'

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
# GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments
# GIT_PROMPT_VIRTUAL_ENV_AFTER_PROMPT=1 # uncomment to place virtual environment infos between prompt and git status (instead of left to the prompt)

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
  GIT_PROMPT_SHOW_UNTRACKED_FILES=no # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10
 GIT_PROMPT_START="[${SHORT_HOSTNAME} \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]"
 GIT_PROMPT_END="\[\033[0;0m\]$ "

# as last entry source the gitprompt script
 GIT_PROMPT_THEME=Single_line # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
  GIT_PROMPT_ONLY_IN_REPO=1
  #source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

if [ -f "$HOME/.local.bashrc" ]; then
  source $HOME/.local.bashrc
fi


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
