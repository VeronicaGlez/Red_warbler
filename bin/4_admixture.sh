#ADMIXTURE
####VERSION 1.3.0

#This script run in the program admixture with bed file 


##1) RUN admixture
### Make a loop, with k= 6 
	for K in 1 2 3 4 5 6; do 
	./admixture --cv=6 warbler.bed $K | tee log${K}.out; done


##2) Elegir la K
	grep -h CV log*.out > SNPS_CV.txt


##3) Plot admixture
###NOTA:
#Se corre desde R STUDIO


	t1=read.table("SNPS_bed.1.Q")
	barplot(t(as.matrix(t1)), col=rainbow(3),
    xlab="Individual", ylab="Ancestry", border=NA)
