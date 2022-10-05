## supplemental info & codes for running the pipeline

## following codes work for URI's Andromeda cluster.

1) Start an interactive session.

    `srun --exclusive --time=168:00:00 --nodes=1 --ntasks=1 --cpus-per-task 20 --pty /bin/bash`

2) Open a screen (or submit jobs by sbatch but produces error in Andromeda)

    `screen`

3) Load the modules (and activate conda environment if MIDAS2 installed in that way)

    `module load MIDAS2/1.0.2`
    `conda activate midas2.0`

4) Follow the steps in README file.



non-defult settings:


1) 
echo "Testing Across-Samples SNV Module"
midas2 merge_snps --samples_list ${pool_fp} \
    --midasdb_name ${midas_dbname} --midasdb_dir ${midas_db} \
    --advanced --num_cores ${num_cores} --chunk_size 1000000 \
    --genome_coverage 0.4 ${merge_midas_outdir} \ ### coverage from 0.7
    &> ${logs_dir}/merge_snps_${num_cores}.log



2) echo "Testing Single-Sample CNV Module With Existing Bowtie Database"
cat ${samples_fp} | uniq | xargs -Ixx bash -c \ # previous code: head -n 2 ${samples_fp} | xargs -Ixx bash -c \
    "midas2 run_genes --sample_name xx -1 ${testdir}/reads/xx_R1.fastq.gz -2 ${testdir}/reads/xx_R2.fastq.gz --num_cores ${num_cores} \
     --midasdb_name ${midas_dbname} --midasdb_dir ${midas_db} --select_threshold=-1 \
     --prebuilt_bowtie2_indexes ${merge_midas_outdir}/bt2_indexes/pangenomes \
     --prebuilt_bowtie2_species ${merge_midas_outdir}/bt2_indexes/pangenomes.species \
     ${midas_outdir} &> ${logs_dir}/xx_genes_${num_cores}_w_bowtie2.log"


3) cat ${samples_fp} | xargs -Ixx bash -c \
    "midas2 run_snps --sample_name xx -1 ${testdir}/reads/xx_R1.fastq.gz -2 ${testdir}/reads/xx_R2.fastq.gz \
    --num_cores ${num_cores} --chunk_size 500000 \
    --midasdb_name ${midas_dbname} --midasdb_dir ${midas_db} \
    --advanced --ignore_ambiguous \
    --select_by median_marker_coverage,unique_fraction_covered \
    --select_threshold=1,0.5 \              ##previous code: --select_threshold=5,0.5
    ${midas_outdir} &> ${logs_dir}/xx_snps_${num_cores}.log"

