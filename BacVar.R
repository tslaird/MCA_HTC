library(dada2); packageVersion("dada2")
# File parsing
pathF <- sort(list.files(pattern = "R1_001.fastq.filtered.gz", full.names = TRUE))[1]
pathR <- sort(list.files(pattern = "R2_001.fastq.filtered.gz", full.names = TRUE))[1]
print(pathF)
print(pathR)
sample.name <- sapply(strsplit(basename(pathF), "_R\d_"), `[`, 1) #Assumes samlename is before the fwd or rev read declaration
print(sample.name)
#some code below is commented out but from the original template on website
#if(!identical(sample.names, sample.namesR)) stop("Forward and reverse files do not match.")
#names(filtFs) <- sample.names
#names(filtRs) <- sample.names
set.seed(100)
# Learn forward error rates
errF <- learnErrors(pathF, nbases=1e8, multithread=FALSE)
# Learn reverse error rates
errR <- learnErrors(pathR, nbases=1e8, multithread=FALSE)
# Sample inference and merger of paired-end reads
#mergers <- vector("list", length(sample.names))
#names(mergers) <- sample.names
derepF <-derepFastq(pathF)
ddF <- dada(derepF, errF, multithread=FALSE)
derepR <- derepFastq(pathR)
ddR <- dada(derepR, err=errR, multithread=FALSE)
merger <-mergePairs(ddF,derepF, ddR, derepR)

rm(derepF)
rm(derepR)

# Construct sequence table and remove chimeras
seqtab <- makeSequenceTable(merger)
saveRDS(seqtab, paste0(sample.name,"seqtab.rds") # CHANGE ME to where you want sequence table saved
