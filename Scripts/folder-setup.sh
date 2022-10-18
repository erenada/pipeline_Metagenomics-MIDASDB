#!/bin/bash

declare -i id_var=100000

for genome in $(ls);
do
  id_var=$id_var+1
  #genomeName=$(echo ${genome} | sed -s 's/\./_/' | sed -s 's/.fa//')
  #new_genome_name=$id_var
  mkdir ${id_var}
  mkdir ${id_var}/${id_var} 
  mv ${genome} ${id_var}/${id_var}/${id_var}.fna

#create the genome.tsv file (and another file to save the original .fasta sequence names in case of a need)

  echo ${genome} >> org_genome_id
  echo "1" >> reps
done

paste genome_id species_id genome_id reps > temp

echo -e "genome\tspecies\trepresentative\tgenome_is_representative" | cat - temp > ../genomes.tsv

paste org_genome_id genome_id > ../org_id_index.tsv

rm genome_id
rm species_id
rm reps
rm temp