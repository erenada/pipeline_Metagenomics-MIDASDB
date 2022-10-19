#!/bin/bash

## Aligning sequence data and creating phylogenetic trees for each OTUs


module load seqtk/1.3-GCC-11.2.0 # only for phyloscript

#marker_dir="/data/schwartzlab/eren/MIDAS2/tests/midasdb_newdb/markers/phyeco"
## get genes (i.e: markers) reads from each sample 

basedir=`pwd`
pan_data_dir"/data/schwartzlab/eren/MIDAS2/tests/midasdb_newdb/pangenomes"

for sample in $(ls);
        for species_table in $(ls $basedir/$sample/genes/*.genes.*);
            do
            species_id="echo $species_table | cut -f 1 -d ".""
            lz4 $species_table
            new_species_table=echo $species_table | cut -f -3 -d "."
            rm $species_table
            cat $new_species_table | cut -f 1  | tail -n +2 > temp_${species_id}_table.tsv
            seqtk subseq $pan_data_dir/$species_id/centroids.ffn temp_${species_id}_table.tsv > ${species_id}_all_genes.fa
            rm temp_${species_id}_table.tsv
        done
    done


phy_input_dir="/data/schwartzlab/eren/MIDAS2/tests/phylogenize_input"

algn_input_dir="/data/schwartzlab/eren/MIDAS2/tests/phylogenize_input/alignments"

cp *.fa /data/schwartzlab/eren/MIDAS2/tests/phylogenize_input/alignments/20091FL-01-01-13/seq_files/


 
# pan_data_dir="/data/schwartzlab/eren/MIDAS2/tests/midasdb_newdb/pangenomes"

# for species_table in $(ls *.genes.*);
#     do
#     species_id=$(echo $species_table | cut -f 1 -d ".")
#     lz4 $species_table
#     new_species_table=$(echo $species_table | cut -f -3 -d ".")
#     rm $species_table
#     cat $new_species_table | cut -f 1  | tail -n +2 > "temp_${species_id}_table.tsv"
#     seqtk subseq $pan_data_dir/$species_id/centroids.ffn "temp_${species_id}_table.tsv" > "${species_id}_all_genes.fa"
#     rm "temp_${species_id}_table.tsv"
#     done





