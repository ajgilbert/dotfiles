export PATH="$PATH:${HOME}/.pixi/bin"
# Possible this isn't needed anymore
# export KRB5_CONFIG=/home/llr/cms/gilbert/krb5.conf

# So we can use EOS commands
export EOS_MGM_URL=root://eos.grif.fr
export EOS_HOME=/eos/grif/cms/llr/store/user/agilbert

export WORK="/grid_mnt/data__data.polcms/cms/gilbert"
# Some programs (notably clangd) will write their cache in $HOME unless we set this
# variable
export XDG_CACHE_HOME="${WORK}/cache"

source /cvmfs/cms.cern.ch/cmsset_default.sh

export LC_ALL=en_US.UTF-8  # Important: cmsenv will override (LANG=C) this and break terminals with unicode in PS1

alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00 ; export X509_USER_PROXY=~/.globus/user_proxy.pem'
# Backup command could be used in case the above stops working.
# alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00 --vomsdir /cvmfs/grid.cern.ch/etc/grid-security/vomsdir --vomses /cvmfs/grid.cern.ch/etc/grid-security/vomses; export X509_USER_PROXY=~/.globus/user_proxy.pem'

# so $VAR/<TAB> works
shopt -s direxpand

# Bash completions (the system package normally loads this from /etc/profile.d)
if [ -z "$BASH_COMPLETION_VERSINFO" ] && [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Set up the Acorn analysis environment.
# Usage: _acorn_env <output-dir> <output-prefix> <jobs>
_acorn_env() {
  cd "${WORK}/diboson/CMSSW_16_0_0/src/Acorn/Analysis" || return
  cmsenv
  export LC_ALL=en_US.UTF-8
  TMPDIR="/tmp/$(whoami)"
  export TMPDIR
  mkdir -p "$TMPDIR"
  export ACORN_OUTPUT_EOS="$1"
  export ACORN_OUTPUT_PREFIX="$2"
  export ACORN_OUTPUT_SAMPLES="${ACORN_OUTPUT_PREFIX}${ACORN_OUTPUT_EOS}"
  export ACORN_MANIFEST=root://eos.grif.fr//eos/grif/cms/llr/store/user/agilbert
  export ACORN_JOBS="$3"
  export ACORN_PREFER_SITES="T2_FR_GRIF,T2_CH_CERN,T2_DE_DESY,T2_FR_IPHC,T2_BE_IIHE,T2_UK_London_IC"
}

_EOS_STORE=/eos/grif/cms/llr/store/user/agilbert
ana-diphoton()          { _acorn_env "${_EOS_STORE}/store_diphoton" ${EOS_MGM_URL} LLR-SHORT; }
ana-diphoton-triggers() { _acorn_env "${_EOS_STORE}/store_diphoton_triggers" ${EOS_MGM_URL} LLR-SHORT; }
ana-zll()               { _acorn_env "${WORK}/diboson/store/zll/" "" LLR-LONG; }
ana-lepfakes()          { _acorn_env "${_EOS_STORE}/store_lepfakes" ${EOS_MGM_URL} LLR-SHORT; }
ana-stitching()         { _acorn_env "${_EOS_STORE}/store_stitching" ${EOS_MGM_URL} LLR-SHORT; }

alias lxp9-cm='ssh -fNM lxp9'
alias lxp9-cm-check='ssh -O check lxplus.cern.ch'
alias lxp9-cm-exit='ssh -O exit lxplus.cern.ch'

