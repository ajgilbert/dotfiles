source /etc/profile.d/colorls.sh

export PATH=$PATH:/afs/cern.ch/user/a/agilbert/scripts:/afs/cern.ch/user/a/agilbert/.gem/ruby/1.8/bin:/afs/cern.ch/user/a/agilbert/sw/bin


export EDITOR='vim'

alias scrab='source /cvmfs/cms.cern.ch/crab3/crab.sh'
export WORK='/afs/cern.ch/work/a/agilbert'

export WWW='/eos/user/a/agilbert/www' 
export PWG='/afs/cern.ch/work/a/agilbert/projects/wgamma/CMSSW_10_2_21/src/Acorn/Analysis'
export PZG='/afs/cern.ch/work/a/agilbert/projects/zgg/CMSSW_10_6_30/src/Acorn/Analysis'
export PHG='/afs/cern.ch/work/a/agilbert/projects/hgcal/CMSSW_11_2_0_pre3/src' 

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

