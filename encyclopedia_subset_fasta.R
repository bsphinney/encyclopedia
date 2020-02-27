# create a subset fasta from Fragpipe/MSFragger results and initial database

library('tidyverse')
library("seqinr")

# setwd to your dir. Should contain the .fas database and the fragpipe/MSfragger
# protein.tsv output file
setwd("E:\\Data\\encyclopedia")

# read fasta used inencyclopedia that was associated with the library you used  search. 
#Change this to the one you used
fasta <- read.fasta("UP000005640_9606_pluscrap.fasta", seqtype = "AA",as.string = TRUE, set.attributes = FALSE)

# read fragpipe/msfragger protein results file
encyclopedia_results <- read_tsv("allmax2020_encyclopedia_concatenated_results.txt")

# create subset fasta that only includes MSFragger results (usually the FDR is 1%)
encyclopedia.subset<- names(fasta) %in% encyclopedia_results$proteinIds
encyclopedia.subset.fasta <- fasta[encyclopedia.subset]

write.fasta(sequences = encyclopedia.subset.fasta, names = names(encyclopedia.subset.fasta), nbchar = 80, file.out = "encyclopedia.subset.fasta")
