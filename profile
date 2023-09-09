if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval "$(/opt/homebrew/bin/brew shellenv)"

export BASH_SILENCE_DEPRECATION_WARNING=1

source /Users/Andrew/.docker/init-bash.sh || true # Added by Docker Desktop
