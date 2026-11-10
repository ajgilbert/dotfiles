if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# iTerm2 integration must come after bashrc so its PROMPT_COMMAND hooks are not overwritten
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
