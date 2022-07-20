library(dada2); packageVersion("dada2")
# File parsing
pathF <- sort(list.files(pattern = "R1_001.fastq", full.names = TRUE))
pathR <- sort(list.files(pattern = "R2_001.fastq", full.names = TRUE))
#pathF <- "MiSeq_SOP/FWD" # CHANGE ME to the directory containing your demultiplexed forward-read fastqs
#pathR <- "MiSeq_SOP/REV" # CHANGE ME ...
#filtpathF <- file.path(pathF, "filtered") # Filtered forward files go into the pathF/filtered/ subdirectory
#filtpathR <- file.path(pathR, "filtered") # ...
fastqFs <- sort(list.files(pathF, pattern="fastq"))
fastqRs <- sort(list.files(pathR, pattern="fastq"))
if(length(fastqFs) != length(fastqRs)) stop("Forward and reverse files do not match.")
# Filtering: THESE PARAMETERS ARENT OPTIMAL FOR ALL DATASETS
#filterAndTrim(fwd=file.path(pathF, fastqFs), filt=file.path(filtpathF, fastqFs),
#              rev=file.path(pathR, fastqRs), filt.rev=file.path(filtpathR, fastqRs),
#              truncLen=c(240,200), maxEE=2, truncQ=11, maxN=0, rm.phix=TRUE,
#              compress=TRUE, verbose=TRUE, multithread=TRUE)
filterAndTrim(fwd=file.path(pathF, fastqFs), filt=paste0("filtered_",pathF),
              rev=file.path(pathR, fastqRs), filt.rev=paste0("filtered_",pathR),
              truncLen=c(240,200), maxEE=2, truncQ=11, maxN=0, rm.phix=TRUE,
              compress=TRUE, verbose=TRUE, multithread=TRUE)
