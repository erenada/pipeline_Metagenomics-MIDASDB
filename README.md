# Metagenomics_for_IgA
GitHub repository for the project "Metagenomic analysis to identify gene clusters associated with IgA production"


## Walkthrough for creating a custom database:

### Required folder structure for creating custom database


MIDAS2 main folder

- Default MIDAS2 files and folders
- Scripts 
- tests
    - genomes
      - cleaned_imports
        - folders that contain genomes (species_id/genome_id/genome_id.fa)
      - genomes.tsv
    - reads
    - build_midasDB.sh
    - midas_analysis.sh

- Download and unpack custom genomes in 'MIDAS2/tests/genomes' folder.

`tar -xvf iMGMC-mMAGs-dereplicated_genomes.tar`

- After unpacking the genomes we suggest that you change these folder names as well as the genome .fa file names in these folders.
  
- This is because of two reasons: 1) MIDAS gives an error when genome folder names are longer than certain numbers of characters. 2) If the genome name contains dots ".", this could create an error.

    - We changed the folder and the genome names using Scripts/folder-setup.sh script.
  
    - Make sure you move all genome folders in MIDAS2/tests/genomes/cleaned_imports
      - genomes.tsv file should be in the upper directory (MIDAS2/tests/genomes/).




    - run  `bash test_analysis.sh 20`
    
    
    .... in progress...
