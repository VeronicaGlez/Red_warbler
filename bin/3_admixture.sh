#Script for evaluate admixture
#Author: Veronica L. Gonzalez Valdez

#ADMIXTURE
####VERSION 1.3.0
#YOU NEED ADMIXTURE PREVIOUSLY INSTALLED IN YOUR PATH

# data are available in ~/data/warbler
#This script run in the program admixture with bed file 


##1) RUN admixture
### Make a loop, with k= 6 
	for K in 1 2 3 4 5 6; do 
	./admixture --cv=6 warbler.bed $K | tee log${K}.out; done

#Choose K
	grep -h CV log*.out > SNPS_CV.txt


##3) Plot admixture
###NOTE:
#This part can be run in R STUDIO


	t1=read.table("SNPS_bed.1.Q")
	barplot(t(as.matrix(t1)), col=rainbow(3),
    xlab="Individual", ylab="Ancestry", border=NA)
