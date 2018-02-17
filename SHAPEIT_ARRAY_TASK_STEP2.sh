#!/bin/bash
command="./shapeit --input-bed "$1"_CHR\$SGE_TASK_ID.bed "$1"_CHR\$SGE_TASK_ID.bim "$1"_CHR\$SGE_TASK_ID.fam \
-M /srv/gsfs0/projects/mignot/IMPUTE_REFERENCE_PHASE1/genetic_map_chr\$SGE_TASK_ID\_combined_b37.txt \
-O "$1"_CHR\$SGE_TASK_ID \
-T 4"
touch shapeit_array.sh
chmod 755 shapeit_array.sh
cat > shapeit_array.sh <<- EOF
#\!/bin/bash
#$ -N shapeit_array
#$ -l h_vmem=10G
#$ -l h_rt=12:00:00
#$ -t 1-22
#$ -hold_jid PLINK_SPLIT_CHR
#$ -pe shm 4
$command
EOF
qsub -V -cwd shapeit_array.sh
