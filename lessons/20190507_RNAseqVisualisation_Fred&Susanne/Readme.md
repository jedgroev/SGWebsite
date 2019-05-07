# RNAseq data visualisation
 - **Authors**: Fred White (Master student, SILS) & Susanne Wilkens (Assistant-Professor, IBED)
 - **Research topic**: data visualisation
 - **Language**: R
 - **Level**: for beginners (all commands will be performed together)
 - **Lesson topic**: visualise RNA-Seq results 


## Setup

### R and RStudio
You should have R and RStudio installed on your machine.

Get R here: https://lib.ugent.be/CRAN/

Get RStudio here: https://www.rstudio.com/

You should know how to start RStudio and have an understanding of the different panels of RStudio.

To speed up set up copy and paste the code block below into Rstudio to install the packages needed for the session (especially if R has been freshly installed.

```R
install.packages("ggplot2", repos = "https://cloud.r-project.org/")
install.packages("pheatmap", repos = "https://cloud.r-project.org/")
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("DESeq2", version = "3.8")
```
### Data
[**The data provided for this session is already in a counts table format (i.e. has already been trimmed and aligned)**](https://github.com/ScienceParkStudyGroup/studyGroup/blob/gh-pages/lessons/20190507_RNAseqVisualisation_Fred%26Susanne/data/counts.txt)

For previous stages of RNA-sequencing data anlysis to prepare your own data for this phase see: [RNA-Seq Workshop](https://scienceparkstudygroup.github.io/2019-03-07-rnaseq-workshop/)


### Part 1 Preprocessing 
After loading the packages we'll need for the lesson, we will do some data preprocessing.  
To begin, the data needs to be downloaded/read in to R from the URL provided (Tip: You can change this destination for your own data).  
`counts <- read.table("https://raw.githubusercontent.com/ScienceParkStudyGroup/studyGroup/gh-pages/lessons/20190507_RNAseqVisualisation_Fred%26Susanne/data/counts.txt", sep = "\t", header = T`  

Here we can also make the design object (indicating condition/cell-type etc. of each sample)

### Part 2 DESeq2 and PCA plot
Next we will perform some preliminary data visualisation to get a feel for the dataset we have.

For more information on PCA see: [Huub and Marc's PCA Lesson](https://github.com/ScienceParkStudyGroup/studyGroup/tree/gh-pages/lessons/20190124_PCA_Huub_Marc)

PCA is used to visualise whether or not there is a separation between the conditions/cell-type/class (the effect we want to investigate). If the data points cluster in a way that does not fit with our idea of how it should look then this is an indication that something could have gone wrong up to this point (for example not correcting for batch/cell-type effects in data preprocessing).
If the PCA plot clusters as expected from the experimental design then we can move on.

Differential expression analyses with DESeq2. This is sometimes the goal of an RNA-seq experiment to test and obtain a list of genes that are up or downregulated in a certain condition compared to another. Here we are interested in the dispersion plot to decide whether or not to continue with the analysis. 

Next the MAplot is another typical starter visualisation. This shows the distribution of differentially expressed genes. Those highlighed red are the genes that are significantly differentially expressed between the two conditions.

### Part 3 Heatmap 
To plot a heatmap we first need to reduce the number of genes that are being assesed. An easy way to quickly get rid of non-interesting genes is to use the padj column of the DESeq results table and make a new dataframe with only those genes that have a p-value <0.05.

We can now use the filtered and ordered DESeq results object `resordered` to filter the counts object with however many genes we would like to see in a heatmap. Here we have chosen the 25 genes that have the lowest adjusted p-values.

Find more information about pheatmap [here](https://cran.r-project.org/web/packages/pheatmap/pheatmap.pdf) and see the options that can be used for clustering and annotation.





