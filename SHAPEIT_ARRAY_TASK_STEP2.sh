#!/bin/bash
command="./shapeit --input-bed "$1"_CHR\$SLURM_ARRAY_TASK_ID.bed "$1"_CHR\$SLURM_ARRAY_TASK_ID.bim "$1"_CHR\$SLURM_ARRAY_TASK_ID.fam \
-M /srv/gsfs0/projects/mignot/IMPUTE_REFERENCE_PHASE1/genetic_map_chr\$SLURM_ARRAY_TASK_ID\_combined_b37.txt \
-O "$1"_CHR\$SLURM_ARRAY_TASK_ID \
-T 8"
touch shapeit_array.sh
chmod 755 shapeit_array.sh
echo \#\!/bin/bash >shapeit_array.sh
echo \#SBATCH --job-name=shapeit_array >>shapeit_array.sh
echo \#SBATCH --mem-per-cpu=10000 >>shapeit_array.sh
echo \#SBATCH --time=12:00:00 >>shapeit_array.sh
echo \#SBATCH --array=1-22 >>shapeit_array.sh
echo \#$ -hold_jid PLINK_SPLIT_CHR >>shapeit_array.sh
echo \#$ -pe shm 4 >>shapeit_array.sh
echo $command >>shapeit_array.sh
qsub -V -cwd shapeit_array.sh
