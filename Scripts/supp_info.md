## supplemental info & codes for running the pipeline

## following codes work for URI's Andromeda cluster.

1) Start an interactive session.

    `srun --exclusive --time=48:00:00 --nodes=1 --ntasks=1 --cpus-per-task 20 --pty /bin/bash`

2) Open a screen (or submit jobs by sbatch but produces error in Andromeda)

    `screen`

3) Load the modules (and activate conda environment if MIDAS2 installed in that way)

`module purge`

`module load SAMtools/1.15.1-GCC-11.2.0`

`module load BamTools/2.5.2-GCC-11.2.0`

`module load MIDAS2/1.0.2`

`bash build_midasDB.sh 20`

1) Follow the steps in README file.


