## edit phyeco marker map file

library(dplyr)
library(tidyverse)


temp_marker_map <- read.csv("/Users/eren/Documents/GitHub/Metagenomics_for_IgA/phylogenize_prep/midasdb_newdb/marker_genes/phyeco.map", sep = "", header = F)

marker_map <- temp_marker_map %>% select(3,4)  %>% mutate("phyeco")

names(marker_map) <- NULL

write_delim(marker_map, file = "/Users/eren/Documents/GitHub/Metagenomics_for_IgA/phylogenize_prep/midasdb_newdb/marker_genes/gene_length.txt", col_names = F, delim = "\t")
