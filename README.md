fou**Landscape genomics of the red warbler (*Cardellina rubra*) in Mexican fragmented forests**

  In the last 50 years, Mexico lost about 50% of its forests because of land use change. Even though birds have been considered as highly tolerant to disturbed environments because of their ability to fly, recent analyses suggest that, this is not necessarily true. Next Generation Sequencing (NGS) is a sensitive tool that allows the detection of the effects of environmental changes on species at the population genetics level and enables inferences about connectivity, population sizes and adaptation.
 
In this repository, you found the work generated to analyze Single Nucleotide Polymorphisms (SNPs) in two warblers species (*Vermivora chrysoptera, V. cyanoptera*) and a híbrid. Then, this  serve as the basis for analyze the impact of habitat fragmentation in genetic diversity, population structure and admixture of  *Cardellina rubra* along Trans-Mexican Volcanic Belt to part of phD work.


##### <div align="left"> ![](yellow.png) 
#### <div align="left"> ![](35487721.jpeg) 


### **Data**
The SNPs dataset was download from **Data Dryad**: (https://doi.org/10.5061/dryad.kb610). The original paper: Toews, David P. L. et al. (2017) [Plumage genes and little else distinguish the genomes of hybridizing warblers.](https://www.cell.com/current-biology/fulltext/S0960-9822(16)30673-X?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS096098221630673X%3Fshowall%3Dtrue).


### **Repository organization**

The repository will be organized in the following directories:
bin, data, graphics, meta, out.

**[bin](/bin)**

This folder  contain scripts to evaluate population structure, genetic diversity and admixture.

**[data](/data)**

This folder will contain a .vcf file with SNPs dataset and .str file for run fastStructure.

**[graphics](/graphics)**

This folder will contain figures and graphics related to the project.
Aditionally, .htlm files with figures and scripts development. 


**[meta](/meta)**

This folder will contain general information about samples (I.D, Geographical coordinates).

**[out](/out)**

Contains results of all analysis made in the research.

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


#### R packages
- SNPRelate
- ggplot2
- gdsfmt


