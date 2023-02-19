shopt -s histappend
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'

#export EDITOR="/usr/local/bin/subl -w -n"

export CLICOLOR=1
export PWG=~/Workspace/projects/wgamma/CMSSW_10_2_21/src/Acorn/Analysis
joinpdf () {
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$@"
}

function restore () {
  if [ -n "$1" ]; then
    PROG="tmux"
    if [[ $1 == "naf"* ]]
    then
      PROG="/afs/desy.de/user/a/agilbert/bin/tmux";
    fi
    if [ -n "$2" ]; then
      ssh $1 -t "$PROG -CC attach -t $2 || $PROG -CC new-session -A -s $2"
    else
      ssh $1 -t "$PROG -CC attach || tmux -CC"
    fi
  fi
}


export PS1="[\u@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

source /opt/homebrew/etc/bash_completion.d/git-completion.bash
