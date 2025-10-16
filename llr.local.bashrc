export CRYPTOGRAPHY_ALLOW_OPENSSL_102
export PATH=${HOME}/sw/bin:${HOME}/sw/php-plots/bin:${PATH}
export KRB5_CONFIG=/home/llr/cms/gilbert/krb5.conf

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

#alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00 ; export X509_USER_PROXY=~/.globus/user_proxy.pem'
alias vinit='voms-proxy-init --voms cms -out ~/.globus/user_proxy.pem -valid 100:00 --vomsdir /cvmfs/grid.cern.ch/etc/grid-security/vomsdir --vomses /cvmfs/grid.cern.ch/etc/grid-security/vomses; export X509_USER_PROXY=~/.globus/user_proxy.pem'

# so $VAR/<TAB> works
shopt -s direxpand
complete -r
source /opt/exp_soft/llr/git-2.19.1/contrib/completion/git-completion.bash

# Get kerberos credentials
#
alias ana-diphoton='cd /grid_mnt/data__data.polcms/cms/gilbert/diboson/CMSSW_14_1_0_pre4/src/Acorn/Analysis; cmsenv; export LC_ALL=en_US.UTF-8; export TMPDIR="/tmp/$(whoami)"; ACORN_OUTPUT_EOS="/eos/grif/cms/llr/store/user/agilbert/store_diphoton"; export ACORN_OUTPUT_PREFIX="root://eos.grif.fr/"; ACORN_OUTPUT_SAMPLES="${ACORN_OUTPUT_PREFIX}${ACORN_OUTPUT_EOS}"; export ACORN_MANIFEST=root://eos.grif.fr//eos/grif/cms/llr/store/user/agilbert; export ACORN_JOBS="LLR-SHORT"; export ACORN_PREFER_SITES="T2_FR_GRIF,T2_CH_CERN,T2_DE_DESY,T2_FR_IPHC,T2_BE_IIHE,T2_UK_London_IC"'


alias ana-diphoton-triggers='cd /grid_mnt/data__data.polcms/cms/gilbert/diboson/CMSSW_14_1_0_pre4/src/Acorn/Analysis; cmsenv; export LC_ALL=en_US.UTF-8; export TMPDIR="/tmp/$(whoami)"; ACORN_OUTPUT_EOS="/eos/grif/cms/llr/store/user/agilbert/store_diphoton_triggers"; export ACORN_OUTPUT_PREFIX="root://eos.grif.fr/"; ACORN_OUTPUT_SAMPLES="${ACORN_OUTPUT_PREFIX}${ACORN_OUTPUT_EOS}"; export ACORN_MANIFEST=root://eos.grif.fr//eos/grif/cms/llr/store/user/agilbert; export ACORN_JOBS="LLR-SHORT"; export ACORN_PREFER_SITES="T2_FR_GRIF,T2_CH_CERN,T2_DE_DESY,T2_FR_IPHC,T2_BE_IIHE,T2_UK_London_IC"'

alias ana-zll='cd /grid_mnt/data__data.polcms/cms/gilbert/diboson/CMSSW_14_1_0_pre4/src/Acorn/Analysis; cmsenv; export LC_ALL=en_US.UTF-8; export TMPDIR="/tmp/$(whoami)"; ACORN_OUTPUT_EOS="/eos/grif/cms/llr/store/user/agilbert/store_zll"; export ACORN_OUTPUT_PREFIX="root://eos.grif.fr/"; ACORN_OUTPUT_SAMPLES="${ACORN_OUTPUT_PREFIX}${ACORN_OUTPUT_EOS}"; export ACORN_MANIFEST=root://eos.grif.fr//eos/grif/cms/llr/store/user/agilbert; export ACORN_JOBS="LLR-SHORT"; export ACORN_PREFER_SITES="T2_FR_GRIF,T2_CH_CERN,T2_DE_DESY,T2_FR_IPHC,T2_BE_IIHE,T2_UK_London_IC"'
