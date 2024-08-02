export CRYPTOGRAPHY_ALLOW_OPENSSL_102
export PATH=${HOME}/sw/bin:${HOME}/sw/php-plots/bin:${PATH}

# So we can use EOS commands
export EOS_MGM_URL=root://eos.grif.fr
export EOS_HOME=/eos/grif/cms/llr/store/user/agilbert

# Use modules to pick up a newer bash version
source /etc/profile.d/modules.sh
module use /opt/exp_soft/vo.llr.in2p3.fr/modulefiles_el7 && module load git/2.19.1
# Enable bash completions for git

export WORK="/grid_mnt/data__data.polcms/cms/gilbert/"
# Some programs (notably clangd) will write their cache in $HOME unless we set this
# variable
export XDG_CACHE_HOME="${WORK}/cache"

source /cvmfs/cms.cern.ch/cmsset_default.sh

export LC_ALL=en_US.UTF-8  # Important: cmsenv will override (LANG=C) this and break terminals with unicode in PS1

alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00 --vomsdir /cvmfs/grid.cern.ch/etc/grid-security/vomsdir --vomses /cvmfs/grid.cern.ch/etc/grid-security/vomses; export X509_USER_PROXY=~/.globus/user_proxy.pem'

# so $VAR/<TAB> works
shopt -s direxpand
complete -r
source /opt/exp_soft/llr/git-2.19.1/contrib/completion/git-completion.bash

# Get kerberos credentials
