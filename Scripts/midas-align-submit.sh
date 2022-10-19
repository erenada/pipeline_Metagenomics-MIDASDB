#!/bin/bash
#SBATCH --job-name="midas_align"
#SBATCH --time=220:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=20   # CHANGE THIS to processor core(s) per node
#SBATCH --mail-user="erenada@uri.edu" #CHANGE THIS to your user email address
#SBATCH --mail-type=END,FAIL
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err
#SBATCH --exclusive

#align all genes data 

module purge 

module load MAFFT/7.475-gompi-2020b-with-extensions


for seq in $(ls *.fa);
    do
    sp_id=$(echo $seq | cut -f 1 -d "_")
        mafft --auto --thread 20 $seq > ${sp_id}_aligned.fa
    done
done