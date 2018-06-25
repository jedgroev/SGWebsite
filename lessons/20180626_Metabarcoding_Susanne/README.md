# Metabarcoding for Microbial Ecology

 - **Authors**: 
   - Susanne Wilken (Assistant-Professor, UvA-IBED FAME)
   - Mattias de Hollander (Bioinformatician NIOO)
   - Marc Galland (Postdoc, UvA-SILS)
 - **Research field**: Microbial Ecology / Bioinformatics
 - **Lesson topic**: metabarcoding through 16S and 18S rRNA  
 - **Lesson content URL**: <https://github.com/ScienceParkStudyGroup/studyGroup/tree/gh-pages/lessons/20180626_Metabarcoding_Susanne/>

# Introduction

# Getting the files

## 18S rRNA Fastq files
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1297334.svg)](https://doi.org/10.5281/zenodo.1297334)  
Click on the Zenodo badge to get the files. Download the trimmed fastq zip file (exact name: "DSEL15_SIPE1_18SV9_examples_trimmed_subsampled.zip") that was subsampled to 20,000 reads per file.

##  Reference database for taxonomic assignment
Download the PR2 (Protist Reference) reference database at https://github.com/vaulot/pr2database/releases.  
Select the `pr2_version_4.10.0_dada2.fasta.gz` and save it. 

# Lesson objectives
At the end of this lesson, you will:
- Be able to understand the major steps of a 16S/18S rRNA metabarcoding analysis
- Have undertaken one to several steps of the workflow (see below)
- Have identified potential pitfalls in these steps.

# Analysis steps
- **Step 0**: Trimming (removing of the sequencing primers) --> 
- **Step 1**: Quality filter raw reads (example workflow for workshop)  
- **Step 2**: Dereplicate your dataset    
- **Step 3**: Make a sequence variant table  
- **Step 4**: Identify chimeras and remove chimeric sequences   
- **Step 5**: Assign taxonomy to your sequences based on a reference database    
- **Step 6**: Visualize and analyze microbial community composition  

# Step 0: trimming
Fragment insert size can be quite short meaning that the reads could contain sequencing primers and eventually remnants of the adapters from the sequencing center (combined 5' and 3' adapters).  
We have already removed the eventual residual sequencing primers from the reads (DSEL15_SIPE1_18SV9_examples_trimmed.zip)

# Step 1 to 6                         
These steps will be done through the `dada2.Rmd` notebook. 

# Going further
- [Callahan et al., 2018](https://www.nature.com/articles/nmeth.3869)
- [Silva ribosomal RNA databases](https://www.arb-silva.de/) 
- [Introduction to Microbial Ecology (metagenomics here) from the Freiburg Galaxy team](http://galaxyproject.github.io/training-material/topics/metagenomics/slides/introduction.html#14)
