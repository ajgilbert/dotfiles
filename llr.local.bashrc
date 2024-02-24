export CRYPTOGRAPHY_ALLOW_OPENSSL_102
export PATH=${HOME}/sw/bin:${PATH}

# So we can use EOS commands
export EOS_MGM_URL=root://eos.grif.fr
export EOS_HOME=/eos/grif/cms/llr/store/user/agilbert

# Use modules to pick up a newer bash version
source /etc/profile.d/modules.sh
module use /opt/exp_soft/vo.llr.in2p3.fr/modulefiles_el7 && module load git/2.19.1

# Enable bash completions for git
source /opt/exp_soft/llr/git-2.19.1/contrib/completion/git-completion.bash

export WORK="/grid_mnt/data__data.polcms/cms/gilbert/"
# Some programs (notably clangd) will write their cache in $HOME unless we set this
# variable
export XDG_CACHE_HOME="${WORK}/cache"

source /cvmfs/cms.cern.ch/cmsset_default.sh

# so $VAR/<TAB> works
shopt -s direxpand
complete -r
