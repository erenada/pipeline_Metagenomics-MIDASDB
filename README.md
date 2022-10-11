# Metagenomics_for_IgA
GitHub repository for the project "Metagenomic analysis to identify gene clusters associated with IgA production"


## Walkthrough for creating a custom database:

- Download and unpack the genomes that you want to build database from:

`tar -xvf iMGMC-mMAGs-dereplicated_genomes.tar`

- After unpacking the genomes we suggest that you change these folder names as well as the genome .fasta file names in these folders. This is because of two reasons: 1) MIDAS gives error when genome folder names are longer than certain numbers of characters. 2) If genome name contains dots ".", this also will produce error.

    - We changed the folder and genome names using custom script: Scripts/folder-setup.sh

....

    - run  `bash test_analysis.sh 20`
    
    
    .... in progres...
