#!/bin/bash
command="plink --bfile "$1" --chr \$SGE_TASK_ID --make-bed --out "$1"_CHR\$SGE_TASK_ID"
touch PLINK_SPLIT.sh
chmod 755 PLINK_SPLIT.sh
echo \#\!/bin/bash >PLINK_SPLIT.sh
echo \#$ -N PLINK_SPLIT_CHR >>PLINK_SPLIT.sh
echo \#$ -l h_vmem=10G >>PLINK_SPLIT.sh
echo \#$ -l h_rt=12:00:00 >>PLINK_SPLIT.sh
echo \#$ -t 1-22 >>PLINK_SPLIT.sh
echo "module load plink/1.90" >>PLINK_SPLIT.sh
echo $command >> PLINK_SPLIT.sh
qsub -V -cwd PLINK_SPLIT.sh

