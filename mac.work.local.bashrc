eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

alias lxp9-cm='ssh -fNM lxp9'
alias lxp9-cm-check='ssh -O check lxplus.cern.ch'
alias lxp9-cm-exit='ssh -O exit lxplus.cern.ch'
#eval "$(gh copilot alias -- bash)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/Andrew/.lmstudio/bin"

# List subdirectories of current dir, ordered by
# when a file inside was last modified
lsdbyfile() {
  for d in */; do
    latest=$(find "$d" -type f -exec stat -f "%m" {} + 2>/dev/null | sort -rn | head -n 1)
    [ -n "$latest" ] && echo "$latest $d"
  done | sort -rn | while read -r ts d; do
    echo "$(date -r "$ts" "+%Y-%m-%d %H:%M:%S")  $d"
  done
}
