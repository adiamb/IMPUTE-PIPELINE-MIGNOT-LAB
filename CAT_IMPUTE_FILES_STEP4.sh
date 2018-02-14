#!/bin/bash
#$ -N catimpute_files
#$ -l h_vmem=10G
#$ -l h_rt=12:00:00
#$ -t 1-22
mkdir impute_info
mv CHR$SGE_TASK_ID\_"$1".*_* impute_info/
cat CHR$SGE_TASK_ID\_"$1".* > CHR$SGE_TASK_ID\_"$1".impute2
