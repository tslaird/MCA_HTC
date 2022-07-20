#!/bin/bash

set -e

module load r
#untar R installation and packages
tar -xzf my_R.tar.gz
tar -xzf R_libs.tar.gz
echo "untarred R and R_libs"

#export paths for R
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_HOME_DIR=$PWD/R/lib64/R
export R_SHARE_DIR=$PWD/R/lib64/R/share
export R_INCLUDE_DIR=$PWD/R/lib64/R/include
export R_DOC_DIR=$PWD/R/lib64/R/doc
export R_ARCH=''

export R_LIBS=$PWD/R_libs/4.1.2
echo "exported paths for R"


#export paths for conda envs
#export PATH
#mkdir cutadaptenv 
#tar -xzf cutadaptenv.tar.gz -C cutadaptenv
#source cutadaptenv/bin/activate
#conda-unpack
#cutadapt --version
#echo "unpacked conda envs"
#location of cutadapt should be cutadaptenv/bin/cutadapt
#set TMPDIR variable
export TMPDIR=$_CONDOR_SCRATCH_DIR

echo "listing files and directories:"
pwd
ls

#run the R script
echo "initiating R script"
Rscript BacFilt.R
