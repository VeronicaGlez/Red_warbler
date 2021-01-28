**Background**

***

In this repository, you found the work generated to analyze Single Nucleotide Polymorphisms (SNPs) in two warblers species *Vermivora chrysoptera and  V. cyanoptera*, two phenotypically divergent warblers that have a high rate of hibridization. 



##### <div align="center"> ![](gr1.jpg) 

##### **Figure 1.**  Geographic Variation across the Golden-Winged and Blue-Winged Warbler Complex

**Objective**

The principal aim for this proyect was  compare genome variation in golden-winged (Vermivora chrysoptera) and blue-winged (V. cyanoptera) warblers, which hybridize across a broad zone of eastern North America  

**Secondary objectives**

1. Explore data sets with Principal Components Analysis for evaluate if exist any estructure between the populations.
2. Make genetic diversity analysis between species and hybrids.
3. Evaluate admixture between GWWA - blue-winged warbler; GWWA - golden-winged warbler; BRWA - Brewster's warbler hybrid.
4. Explore if the dataset with whole gemone resequencing has any estructure between populations. 
5. Finally, the scripts generated for this proyect, will serve as the basis for evaluate at genetic level to red warbler (*Cardellina rubra*), an endemic complex species, with a stronge structure associated to the Mexican mountains, as a part to doctoral work "Landscape genomics of the red warbler (Cardellina rubra) in Mexican fragmented forests".

### *Dryad dataset*

The SNPs dataset was download from **Data Dryad**: (https://doi.org/10.5061/dryad.kb610). The first dataset contain 151 Individuals with genotype information generated from the ddRAD protocol, with individuals sampled across the range of both species and hybrids. The original download dataset is GWWA_BWWA.GATK.filtered.removed.minGQ.20.removed.indv.max.missing.4.maf.02.vcf.recode.vcf. This dataset was rename to data_warbler.vcf.
An additional data set (GWWA_BWWA.resequencing.variant.dryad.vcf), was evaluated. This vcf has a genotype information for 24 individuals sampled in 2015 with re-sequencing data.  The "species" corresponds to the coarse scale phenotype information: BWWA - blue-winged warbler; GWWA - golden-winged warbler; BRWA - Brewster's warbler hybrid; INTR - intermediate hybrid, mostly GWWA characters with additional yellow on the breast. This dataset was rename like "GWWA_BWWA_reseq.vcf"
 

The original paper: Toews, David P. L. et al. (2017) [Plumage genes and little else distinguish the genomes of hybridizing warblers.](https://www.cell.com/current-biology/fulltext/S0960-9822(16)30673-X?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS096098221630673X%3Fshowall%3Dtrue)


### **Repository organization**

The repository be organized in the following directories:
bin, data, graphics, meta, out and project.

**[bin](/bin)**

This folder  contain scripts used for this project.

**Script list:**
 - `1_exploratory analysis.R` Explore the SNP dataset with PCA analyses.
 - `2_genetic diversity.R` Script for evaluate genetic diversity (Observed heterozygosity, expected heterozygosity and inbreeding) for pupulations.
 - `3_Admixture.sh` make admixture analysis.
 - `4_exploratory analysis` Explore resequencing SNPs dataset with PCA.


**[data](/data)**

This folder contain different dataset for each analysis.

**Dataset list:**
 - `data_warbler.vcf ` Contain 151 Individuals with genotype information generated from the ddRAD protocol. Dataset for run `1. exploratory analysis script.`
 - `SNPs_012.012 ` SNPs dataset in format .012 for run `2. genetic diversity analysis.`
 - `data_warbler_newchr.bed,data_warbler_newch.bim and data_warbler_newchr.fam.` A datasets of plink format for run `3_Admixture.sh script.` 
 - `GWWA_BWWA_reseq.vcf` Contain genotype information for 24 individuals sampled  with re-sequencing data. Dataset for run `4_exploratory analysis script`.

**[graphics](/graphics)**

This folder contain PCA figures and .htlm files obtained to `1. exploratory analysis` and  `4_exploratory analysis scripts`.

**[meta](/meta)**

This folder contain a met_yw.csv file with information about samples: indiv (ID), site, coordinates, band number, sex.
The species name corresponds to the coarse scale phenotype, classified in the hand as either: BWWA - blue-winged warbler; GWWA - golden-winged warbler; BRWA - Brewster's warbler hybrid.
The second files is reseq_meta. csv and contain the information for 24 individuals sampled  with re-sequencing data: individual, record number, phenotype (BWWA - blue-winged warbler; GWWA - golden-winged warbler; BRWA - Brewster's warbler hybrid and INTR - intermediate hybrid).

**[out](/out)**

Contains results of any analysis made in the research.
The results are divided into different folders for each analysis that correspond to each script.

 - `1_exploratory analysis:` cointain a pca_warbler.csv from `1. exploratory analysis script.`
 - `2_genetic diversity:` Ho.csv, Hs.locus.csv,Fis.csv files from `2_genetic diversity.script.`
 - `3_Admixture:` output data for k= 6 and a SNPS.CV.txt file with the summary admixtures K.
 - `4_exploratory analysis:` cointain a pca_warbler.txt file from `4. exploratory analysis script.

**[project](/project)**
This folder cointain a .md file with summary and results of thi project.

### Prerequisites
* R version 3.6.3 (2020-02-29)
* Platform: x86_64-pc-linux-gnu (64-bit)
* Running under: Ubuntu 18.04.5 LTS

#### Software
* PGDSpider 2.1.1.5
* RStudio  3.6.3
* vcftools 0.1.17
* plink 0.70
* ADMIXTURE 1.3.0
* BAYESCAN 2.1


#### Packages
- SNPRelate
- ggplot2
- gdsfmt

### Created by: Veronica L.Gonzalez Valdez
