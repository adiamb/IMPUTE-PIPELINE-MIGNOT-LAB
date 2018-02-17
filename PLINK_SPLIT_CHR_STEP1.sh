#!/bin/bash
command="plink --bfile "$1" --chr \$SGE_TASK_ID --make-bed --out "$1"_CHR\$SGE_TASK_ID"
touch PLINK_SPLIT.sh
chmod 755 PLINK_SPLIT.sh
cat > PLINK_SPLIT.sh <<- EOF
#!/bin/bash
#$ -N PLINK_SPLIT_CHR
#$ -l h_vmem=10G
#$ -l h_rt=12:00:00
#$ -t 1-22
module load plink/1.90
$command
EOF
qsub -V -cwd PLINK_SPLIT.sh

