#!/bin/bash -l

#SBATCH --partition=panda_physbio   # cluster-specific
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=AzDE_%A_%a.txt
#SBATCH --job-name=AzDE
#SBATCH --mem=32G   # memory requested, units available: K,M,G,T

echo We are now running an R script.
echo "Job ID : $JOB_ID"  ${SLURM_ARRAY_TASK_ID}

conda activate r4.1.1
path=/athena/elementolab/scratch/yah2014/Projects/scRNAseq-Alzheimer
cd $path
file=R/Rscripts/differential_expression.R
echo $(ls -l $path/$file)
Rscript $path/$file ${SLURM_ARRAY_TASK_ID}
