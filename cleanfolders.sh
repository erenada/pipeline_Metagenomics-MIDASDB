#!/bin/bash
#SBATCH --job-name="cleaning_run"
#SBATCH --time=99:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=20   # CHANGE THIS to processor core(s) per node
#SBATCH --mail-user="erenada@uri.edu" #CHANGE THIS to your user email address
#SBATCH --mail-type=END,FAIL
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err
#SBATCH --exclusive



rm -rf /data/schwartzlab/eren/delete

rm -rf /data/schwartzlab/eren/rm_test

rm -rf /data/schwartzlab/eren/rmv_contigs_outputs

rm -rf /data/schwartzlab/eren/to_delete

rm -rf /data/schwartzlab/eren/MIDAS2/almost_output

rm -rf  /data/schwartzlab/eren/MIDAS2/rmm2o

rm -rf /data/schwartzlab/eren/MIDAS2/rmrmrmr

rm -rf /data/schwartzlab/eren/MIDAS2/rmm2o





