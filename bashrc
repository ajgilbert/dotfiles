shopt -s histappend
shopt -s checkwinsize
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T: "
PROMPT_COMMAND='history -a'

export CLICOLOR=1

export X509_USER_PROXY=~/.globus/user_proxy.pem

# Short host label, used in PS1 and by starship (env_var.SHORT_HOSTNAME).
# On macOS `hostname` is whatever DHCP hands out, so use the stable LocalHostName.
if [ "$(uname)" = Darwin ]; then
  _host=$(scutil --get LocalHostName 2>/dev/null || hostname -s)
else
  _host=$(hostname -s)
fi
export SHORT_HOSTNAME=$(echo "$_host" | sed -e 's|^llr22021.*|mac|' \
                                            -e 's|agilbert-vm-cc7|avm7|' \
                                            -e 's|agilbert-vm-el9|avm9|' \
                                            -e 's|lxplus9.*|lxp9|' \
                                            -e 's|lxplus7.*|lxp7|' \
                                            -e 's|llruicms01.*|llrcms|')
unset _host
PROMPT_DIRTRIM=3
export PS1="[${SHORT_HOSTNAME} \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

alias ki='kinit -l 48h agilbert@CERN.CH'
alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00; export X509_USER_PROXY=~/.globus/user_proxy.pem'

if [ -f "$HOME/.local.bashrc" ]; then
  source $HOME/.local.bashrc
fi

# Webi (webinstall.dev) user-space installs: adds ~/.local/bin etc. to PATH. Used on LLR.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Starship prompt (replaces the PS1 above wherever starship is installed).
# Keep this last so PATH from brew/envman is already set up.
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
