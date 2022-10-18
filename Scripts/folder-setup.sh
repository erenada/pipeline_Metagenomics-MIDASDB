#!/bin/bash

# create new names for genomes and species names. Also create genomes.tsv files. 

declare -i genome_id_var=900000
declare -i species_id_var=100000

for genome in $(ls);
do
  genome_id_var=$genome_id_var+1
  species_id_var=$species_id_var+1
  #genomeName=$(echo ${genome} | sed -s 's/\./_/' | sed -s 's/.fa//')
  #new_genome_name=$id_var
  mkdir ${species_id_var}
  mkdir ${species_id_var}/${genome_id_var} 
  mv ${genome} ${species_id_var}/${genome_id_var}/${genome_id_var}.fa

#create the genome.tsv file (and another file to save the original .fasta sequence names in case of a need)

  echo ${genome} >> org_genome_id
  echo ${genome_id_var} >> genome_id
  echo ${species_id_var} >> species_id
 
  echo "1" >> reps
  
done

paste genome_id species_id genome_id reps > temp

echo -e "genome\tspecies\trepresentative\tgenome_is_representative" | cat - temp > ../genomes.tsv

paste org_genome_id genome_id species_id > ../org_id_index

rm genome_id
rm species_id
rm reps
rm temp
rm org_genome_id