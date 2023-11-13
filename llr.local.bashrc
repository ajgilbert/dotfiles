export PATH=${HOME}/sw/bin:${PATH}

source /etc/profile.d/modules.sh
module use /opt/exp_soft/vo.llr.in2p3.fr/modulefiles_el7 && module load git/2.19.1

export WORK="/grid_mnt/data__data.polcms/cms/gilbert/"

source /cvmfs/cms.cern.ch/cmsset_default.sh

# so $VAR/<TAB> works
shopt -s direxpand
