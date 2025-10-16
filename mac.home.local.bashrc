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

  source /Users/Andrew/.docker/init-bash.sh || true # Added by Docker Desktop
  export PATH="/opt/homebrew/opt/node@22/bin:$HOME/.npm-packages/bin:$PATH"
  export NPM_CONFIG_PREFIX=$HOME/.npm-packages
