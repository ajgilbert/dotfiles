if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

lsdbyfile() {
  for d in */; do
    latest=$(find "$d" -type f -exec stat -f "%m" {} + 2>/dev/null | sort -rn | head -n 1)
    [ -n "$latest" ] && echo "$latest $d"
  done | sort -rn | while read -r ts d; do
    echo "$(date -r "$ts" "+%Y-%m-%d %H:%M:%S")  $d"
  done
}

source /Users/Andrew/.docker/init-bash.sh || true # Added by Docker Desktop
export PATH="/opt/homebrew/opt/node@22/bin:$HOME/.npm-packages/bin:$PATH"
export NPM_CONFIG_PREFIX=$HOME/.npm-packages

alias lxp9-cm='ssh -fNM lxp9'
alias lxp9-cm-check='ssh -O check lxplus.cern.ch'
alias lxp9-cm-exit='ssh -O exit lxplus.cern.ch'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/Andrew/.lmstudio/bin"
# End of LM Studio CLI section