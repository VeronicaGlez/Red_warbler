#Script for genetic analysis

library("hierfstat")

#load dataset
yw <-read.delim("../data/SNPs_012.012", sep = "\t", header = FALSE, na.strings = -1)

#delete first column
yw <- yw[,-1]
class(yw)

#Replace format 012 by 2 digits 
yw[yw==0] <- 55
yw[yw==1] <- 56
yw[yw==2] <- 66


#load metadata
meta <- read.delim("../meta/met_yw.csv", sep = ",")

#merge phenotypes with database
yw2 <- cbind(meta$phenotype, yw)
yw2<- as.data.frame(yw2)

##basic statistics of geneti by phenotype
aa <-basic.stats(yw2, diploid = T)

# Observed heterozygosity(Ho)
Pob <- levels(meta$phenotype)
Ho <-numeric(0)
Ho.locus <- aa$Ho
write.table(Ho.locus, file = "../out/Ho.txt", sep = "\t")
#expected heterozygosity(He)
Hs <-numeric(0)

Hs.locus <- aa$Hs
write.table(Hs.locus, file = "../out/Hs_locus.txt", sep = "\t")
#inbreeding 
Fis <- numeric(0)

Fis.locus <- aa$Fis
Fis.locus[is.na(Fis.locus)] <- 0
write.table(Fis.locus, file = "../out/Fis_yw.txt", sep = "\t")

#merge genetics data
statis <- cbind(Ho.locus, Hs.locus, Fis.locus)
write.table(statis, file = "../out/genetic_summary.txt", sep = "\t")
