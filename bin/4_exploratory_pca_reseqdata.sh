#!/bin/bash/

#Exploratory analysis with resequencing warblers data
#Author: Veronica L. Gonzalez Valdez
# Run this script from directory ~/bin/ and the data are in ~/data/
#The metadata file is available in  ~/meta/met_yw.csv
#This script is to make a exploratory analysis using Principal Component Analysis with the packages SNPRelate and ggplot.

library(gdsfmt) 
library(SNPRelate)
library(ggplot2)

#all data
#BRWA blue-winged warbler; Vermivora pinus
#BWWA golden-winged warbler; Vermivora chrysoptera
#GWWA Brewster's warbler hybrid

#Input data
vcf.fn1<-("../data/GWWA_BWWA_reseq.vcf")

#Transform .vcf to gds
snpgdsVCF2GDS(vcf.fn1, "warbler2.gds", method="biallelic.only", verbose = TRUE)
snpgdsSummary("warbler2.gds")

genocat <- snpgdsOpen("warbler2.gds")


pcagral<-snpgdsPCA(genocat,autosome.only=FALSE, num.thread=2)

# variance proportion (%)
pc.percent <- pcagral$varprop*100
head(round(pc.percent, 2))

x<-round(pc.percent, 2)
sum(x[1:4])
sum(x[1:10])

sum(x[1:30])
# make a data.frame, with pca informatin and merge with individuals IDs.
tab <- data.frame(sample.id = pcagral$sample.id,
                  EV1 = pcagral$eigenvect[,1], # the first eigenvector
                  EV2 = pcagral$eigenvect[,2], # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)
##Write dataframe with PCA data (EVI Y EV2
write.table(tab, file = "../out/pca_warbler_reseq.txt", sep = "\t")

#merge pca with meta
bgen <- read.csv("../meta/reseq_meta.csv", header = T,sep = "," )
head(bgen)

pca_data <- cbind(bgen,tab)
##GGPLOT by species
#BRWA blue-winged warbler; Vermivora pinus
#BWWA golden-winged warbler; Vermivora chrysoptera
#GWWA Brewster's warbler hybrid
#INTR intermediat hybrid


p <- ggplot(pca_data, aes(x=EV2, y=EV1))+
  geom_point(aes(color=Species)) +
theme(legend.title = element_text(size=13))+
  theme(legend.text = element_text(size = 12))+
  xlab(paste0("Eigenvector 2 explaining ", round(pc.percent, 2)[2], "%")) +
  ylab(paste0("Eigenvector 1 explaining ", round(pc.percent, 2)[1], "%"))
p 
p + theme_classic()

closefn.gds(genocat)
