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
write.table(Ho.locus, file = "../out/Ho.csv", sep = ",")

#mean by group
for (i in 1:3) {
  Ho.pob <- mean(na.omit(Ho.locus[,i]))
  Ho <-rbind(Ho, Ho.pob)
}


#expected heterozygosity(He)
Hs <-numeric(0)

Hs.locus <- aa$Hs
write.table(Hs.locus, file = "../out/Hs_locus.csv", sep = ",")

for (i in 1:3) {
  Hs.pob <- mean(na.omit(Hs.locus[,i]))
  Hs <-rbind(Hs, Hs.pob)
}

#inbreeding 
Fis <- numeric(0)

Fis.locus <- aa$Fis
Fis.locus[is.na(Fis.locus)] <- 0
write.table(Fis.locus, file = "../out/Fis_yw.csv", sep = ",")

#loop for mean of gruop
for (i in 1:3) {
  Fis.pob <- mean(Fis.locus[,i], na.rm = FALSE)
  Fis <-rbind(Fis, Fis.pob)
}
#merge genetics data
statis <- cbind(Ho.locus, Hs.locus, Fis.locus)
write.table(statis, file = "../out/genetic_summary.txt", sep = "\t")

#merge mean genetics
stats <- cbind(Ho, Hs, Fis)
write.table(stats, file = "../out/Het_group_gen.txt", row.names = Pob, col.names = c("Ho", "He", "Fis"))
