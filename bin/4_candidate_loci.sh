##!/bin/bash 
#Script for evaluate putative snps with Bayescan.
#Author: Veronica L. Gonzalez Valdez

#Software Bayescan
####VERSION BayeScan2.1_linux64bits

#YOU NEED BayeScan software PREVIOUSLY INSTALLED IN YOUR PATH
# data are available in ~/data/input_bayescan_maf
#input_bayescan_maf, is a file filtered with VCFTOOLS with a MAF MAX 0.05, then transform with PGDSpider to bayescan_input
#ARCHIVO cate_maf.recode.vcf


#short run, parameters default
./BayeScan2.1_linux64bits ../data/input_bayescan_maf -od ../out/ -all_trace -n 5000 -thin 20 -nbp 10 -pilot 5000 -burn 50000 -pr_odds 100 -out_pilot -out_freq



