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

# Introduction to PCA (Huub)
The aim of PCA (Jolliffe 2005) is to reduce the dimensionality of the data whilst retaining as much information as possible. ‘Information’ is referred here as variance. The idea is to create uncorrelated artificial variables called principal components (PCs) that combine in a linear manner the original (possibly correlated) variables (e.g. genes, metabolites, etc.).

Dimension reduction is achieved by projecting the data into the space spanned by the principal components (PC). In practice, it means that each sample is assigned a score on each new PC dimension - this score is calculated as a linear combination of the original variables to which a weight is applied. The weights of each of the original variables are stored in the so-called loading vectors associated to each PC. The dimension of the data is reduced by projecting the data into the smaller subspace spanned by the PCs, while capturing the largest sources of variation between samples.

The principal components are obtained so that their variance is maximised. To that end, we calculate the eigenvectors/eigenvalues of the variance-covariance matrix, often via singular value decomposition when the number of variables is very large. The data are usually centred (center = TRUE), and sometimes scaled (scale = TRUE) in the method. The latter is especially advised in the case where the variance is not homogeneous across variables.

The first PC is defined as the linear combination of the original variables that explains the greatest amount of variation. The second PC is then defined as the linear combination of the original variables that accounts for the greatest amount of the remaining variation subject of being orthogonal (uncorrelated) to the first component. Subsequent components are defined likewise for the other PCA dimensions. The user must therefore report how much information is explained by the first PCs as these are used to graphically represent the PCA outputs.

# Practical hands-on sessions (Marc)

## Prerequesites / level
You should be able to start R and RStudio. Most commands will be thoroughly explained so no need to be an R expert!

## Setup 
Make sure you have a working version of R and RStudio installed.
__You should have R version 3.5 or higher to be able to perform this tutorial.__ You can find the installation package for all systems [here](https://cran.r-project.org/) on the Comprehensive R Archive Network (CRAN).  
 
Once you have the right version of R (3.5 or higher), install the `mixOmics` package from the Bioconductor channel:
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("mixOmics", version = "3.8")
``` 

## PCA in R using the mixOmics package
We will make use of the [mixOmics](https://bioconductor.org/packages/release/bioc/html/mixOmics.html) R package that contains methods to conduct PCA and other analyses on multivariate datasets.
The related Rmarkdown notebook is [here](https://github.com/ScienceParkStudyGroup/studyGroup/blob/gh-pages/lessons/20190124_PCA_Huub_Marc/PCA.Rmd).

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
