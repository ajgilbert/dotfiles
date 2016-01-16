shopt -s histappend
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'

export EDITOR="/usr/local/bin/subl -w -n"

export CLICOLOR=1

joinpdf () {
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$@"
}

