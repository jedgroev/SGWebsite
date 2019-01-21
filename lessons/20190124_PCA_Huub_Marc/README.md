# Principal Component Analysis
 - **Authors**: 
   - Huub Hoefsloot (Assistant-Professor, UvA-BDA)
   - Marc Galland (Data Science/Manager Facilitator, UvA-SILS)
 - **Research field**: Data Analysis
 - **Lesson topic**: perforping a Principal Component Analysis (PCA) on given multivariate dataset
 - **Lesson content URL**: https://github.com/ScienceParkStudyGroup/studyGroup/tree/gh-pages/lessons/20190124_PCA_Huub_Marc/

# Introduction
Principal Component Analysis is a tool to bring out patterns in your (big) data. It can be used to visualize and explore data. In this hand on tutorial PCA will be explained in simple terms. Further it will be shown how to do a PCA and how to visualize the results in R.  
After this one-hour session you should be able to do a PCA on your own data.   
If you bring your data (not too big, please) we could even try to do some work within this hour (see below).

# Theory behind PCA (Huub)

# Practical hands-on sessions (Marc)

## Setup 
Make sure you have a working version of R and RStudio installed.
__You should have R version 3.5 or higher to be able to perform this tutorial.__ You can find the installation package for all systems [here](https://cran.r-project.org/) on the Comprehensive R Archive Network (CRAN).  
 
Once you have the right version of R (3.5 or higher), install the `mixOmics` package from the Bioconductor channel:
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("mixOmics", version = "3.8")
``` 

## PCA in R
We will make use of the [mixOmics](https://bioconductor.org/packages/release/bioc/html/mixOmics.html) R package that contains methods to conduct PCA and other analyses on multivariate datasets.


Click on the link to access the related Rmarkdown notebook

## Bring Your Own Dataset (BYOD)
If you'd like to bring your own data, please make sure it can be imported into R. 
You should be able to run this code without problem:

```
# data file import into R working memory
df = read.table(file = "[your file name]",header = TRUE,sep = "\t",dec = ".",stringsAsFactors = F)

# make sure sample names are used as row names
row.names(df) = df$column_with_sample_names
```

# References
- Rohart F, Gautier B, Singh A, Lê Cao KA (2017) mixOmics: An R package for ‘omics feature selection and multiple data integration. PLOS Computational Biology 13(11): e1005752. https://doi.org/10.1371/journal.pcbi.1005752
