#!/bin/bash/

#PCA SNPRelate y plot con ggplot
#Este Script es para realizar un analisis exploratorio de datos yellow warbler, PCA con SNPrelate y graficarlo con ggplot


library(gdsfmt) 
library(SNPRelate)
library(ggplot2)
#all data
#BRWA blue-winged warbler; Vermivora pinus
#BWWA golden-winged warbler; Vermivora chrysoptera
#GWWA Brewster's warbler hybrid

#Input data
vcf.fn<-("../data/data_warbler.vcf")

#Transform .vcf to gds
snpgdsVCF2GDS(vcf.fn, "warbler1.gds", method="biallelic.only", verbose = TRUE)
snpgdsSummary("warbler1.gds")

genocat <- snpgdsOpen("warbler1.gds")


pcagral<-snpgdsPCA(genocat,autosome.only=FALSE, num.thread=2)

# variance proportion (%)
pc.percent <- pcagral$varprop*100
head(round(pc.percent, 2))

x<-round(pc.percent, 2)
sum(x[1:4])
sum(x[1:10])
sum(x[1:30])

# make a data.frame, para hacer la base con los pca y los id de los individuos
tab <- data.frame(sample.id = pcagral$sample.id,
                  EV1 = pcagral$eigenvect[,1], # the first eigenvector
                  EV2 = pcagral$eigenvect[,2], # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

##Para hacer una base con los datos de pca (EVI Y EV2) export?? los datos a traves de crear un .csv y lo un?? con mi base de datos  1
write.table(tab, file = "../out/pca_warbler.csv", sep = ",")

#merge pca with meta
bgen <- read.csv("../meta/met_yw.csv", header = T,sep = "," )
head(bgen)
pca_data <- cbind(bgen,tab)
##GGPLOT by species
#BRWA blue-winged warbler; Vermivora pinus
#BWWA golden-winged warbler; Vermivora chrysoptera
#GWWA Brewster's warbler hybrid

p <- ggplot(pca_data, aes(x=EV2, y=EV1))+
  geom_point(aes(color=phenotype)) +
theme(legend.title = element_text(size=13))+
  theme(legend.text = element_text(size = 12))+
  xlab(paste0("Eigenvector 2 explaining ", round(pc.percent, 2)[2], "%")) +
  ylab(paste0("Eigenvector 1 explaining ", round(pc.percent, 2)[1], "%"))
p

#plot by site
ggplot(pca_data, aes(x=EV2, y=EV1))+
  geom_point(aes(color=site)) + 
  theme(legend.title = element_text(size=13))+
  theme(legend.text = element_text(size = 12))+
  xlab(paste0("Eigenvector 2 explaining ", round(pc.percent, 2)[2], "%")) +
  ylab(paste0("Eigenvector 1 explaining ", round(pc.percent, 2)[1], "%"))+
  theme(axis.title.y = element_text(size = rel(1.5), angle = 90))+
  theme(axis.title.x = element_text(size = rel(1.5), angle = 360))+
  theme(axis.text.x = element_text(hjust = .5, size=11, color="black"))+
  theme(axis.text.y = element_text(hjust = .5, size=11, color="black"))


