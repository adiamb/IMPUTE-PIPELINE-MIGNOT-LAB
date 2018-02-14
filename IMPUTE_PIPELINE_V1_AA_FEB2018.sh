#!/bin/bash
echo "###################################################################################################################" 
echo "                            IMPUTE PIPELINE VERSION 1 SCG4  Version date Feb 1 2018" 
echo "                                     SCG4 utilizing parallel computation"
echo "                                              Aditya Ambati"
echo "                                           ambati@stanford.edu"
echo "###################################################################################################################"

echo " Plink is splitting chromosomes - only autosomomes "
./PLINK_SPLIT_CHR_STEP1.sh $1

echo " Holding shapeit job for plink to finish splitting chromosome"
./SHAPEIT_ARRAY_TASK_STEP2.sh $1

echo " Holding impute tasks until shapeit jobs completes, each chromosome is imputed in 1mb chunks "
python IMPUTE_HEADCOMMAND_STEP3.py $1 ## this should trigger "IMPUTE_LOOP_PHASE1_STEP3.sh"

echo " Imputation in progress "
