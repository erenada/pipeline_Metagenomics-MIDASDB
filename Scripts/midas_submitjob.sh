#!/bin/bash
#SBATCH --job-name="midas_run"
#SBATCH --time=99:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=20   # CHANGE THIS to processor core(s) per node
#SBATCH --mail-user="erenada@uri.edu" #CHANGE THIS to your user email address
#SBATCH --mail-type=END,FAIL
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err
#SBATCH --exclusive

module purge

#module load Biopython/1.75-foss-2019b-Python-3.7.4

#module load Anaconda3/5.3.0

#module load Pysam/0.16.0.1-GCC-8.3.0

module load SAMtools/1.15.1-GCC-11.2.0

module load BamTools/2.5.2-GCC-11.2.0

#module load Bowtie2/2.3.5.1-GCC-8.3.0

#module load bio/prodigal/2.6.3-GCCcore-8.3.0

#module load HMMER/3.3.1-foss-2019b

module load MIDAS2/1.0.2

bash test_analysis.sh 20