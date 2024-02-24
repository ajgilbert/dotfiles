source /etc/profile.d/colorls.sh

export PATH=$PATH:/afs/cern.ch/user/a/agilbert/scripts:/afs/cern.ch/user/a/agilbert/.gem/ruby/1.8/bin:/afs/cern.ch/user/a/agilbert/sw/bin


export EDITOR='vim'

alias scrab='source /cvmfs/cms.cern.ch/crab3/crab.sh'
export WORK='/afs/cern.ch/work/a/agilbert'

export WWW='/eos/user/a/agilbert/www' 
export PWG='/afs/cern.ch/work/a/agilbert/projects/wgamma/CMSSW_10_2_21/src/Acorn/Analysis'
export PZG='/afs/cern.ch/work/a/agilbert/projects/zgg/CMSSW_10_6_30/src/Acorn/Analysis'
export PHG='/afs/cern.ch/work/a/agilbert/projects/hgcal/CMSSW_11_2_0_pre3/src' 
export PEF='/afs/cern.ch/work/a/agilbert/projects/leshouches/EFT2Obs'
export PCO='/afs/cern.ch/work/a/agilbert/projects/combine-dev/comb2021/CMSSW_10_2_13/src/summer21'
export PWS='/afs/cern.ch/work/a/agilbert/projects/combine-dev/reference/CMSSW_10_2_13/src/workshop'

export TS_SOCKET=/tmp/ts_socket
export TS_SLOTS=4
export SSH_ASKPASS=""

alias fix-git='source /opt/rh/git19/enable; export GIT_EXEC_PATH=/opt/rh/git19/root/usr/libexec/git-core'

function git-fix-broken-refs {
  git for-each-ref --format="%(refname)" | while read ref; do  git show-ref --quiet --verify $ref 2>/dev/null || git update-ref -d $ref; done
}

function git-vcommit {
 GIT_EDITOR="vim -c 'DiffGitCached' -c 'startinsert'" git commit -v 
}

complete -r
shopt -s direxpand

export CRYPTOGRAPHY_ALLOW_OPENSSL_102=1

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
fi

export LC_ALL=en_US.UTF-8  # Important: cmsenv will override (LANG=C) this and break terminals with unicode in PS1

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
  source "$HOME/.bash-git-prompt/gitprompt.sh"
fi
