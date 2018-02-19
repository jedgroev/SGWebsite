# RNA-Seq analysis
A one-hour demo on how to perform RNA-Seq analysis. 

### Time and Place
- Where: room B0.203, Science Park 904  
- When:  Tuesday, February 20th, 2018 at 17:00 PM

### Authors
- Fred White (Master student, Molecular Neuroscience@SILS)
- Max van Hooren  (PhD student, Plant Cell Biology@SILS)

### Level
Absolute beginners and begginers.  

# Setup
## Lesson files
First, please download the lesson files [here](https://www.dropbox.com/sh/lrl7q4c6yv4y3va/AABsQTqVj47a5C_o8MxL-n2xa?dl=0) or [here](https://doi.org/10.5281/zenodo.1175858).

1. Download the file and unzip it.
2. Inside the zipped folder, you will find the jupyter notebook (with the ``.ipynb`` extension) and the sequencing files information. 

If you choose the zip file with "all results", it will also contain all the intermediate files. 
On a mac or linux computer you will be able to run the lesson from jupyter, if you are on  a windows computer it is easier to copy paste the the commands from the lesson to your terminal and execute from them for there.

## Softwares
###### If you are on a **Mac** or a **Linux** computer the anaconda navigator is a easy tool to install other packages. 
- The Anaconda distribution for data science. [Find it here](https://www.anaconda.com/download/) distributions. The Kallisto software and the Sleuth R package can be downloaded using Anaconda. 
- Rstudio: A tool to easily run R, you can find it [here](https://www.rstudio.com/products/rstudio/download/#download)
###### If you are on a **Windows** computer you will have to install Kallisto and Sleuth manually.
- Kallisto: a software to align RNA-Seq reads to a transcriptome reference. Download and document can be found [here](https://pachterlab.github.io/kallisto/about).
- Sleuth: a software to perform the statistical analysis of the Kallisto alignment results. Download and documentation can be found [here](https://pachterlab.github.io/sleuth/about).

# Lesson outline
## Time to Complete
One hour: half presentation, half hands-on. Going through the complete processing of raw data to differential gene expression is too much to go through in one hour. 
However, the lesson contains enough information on each step to complete on your own.

## Schedule
**Fred** (presentation)
Short presentation about mRNA-Seq analysis and workflow. 

**Max** (hands-on)
1. Generation of the transcriptome reference index with Kallisto
2. Alignment of clean RNA-Seq reads with Kallisto
3. Exploration of the results with Sleuth

### Expected results 
1. A list of differentially expressed genes.
2. Multiple exploratory plots (PCA, Clustering, etc.)
3. New hypotheses
4. UCSC coverage tracks 

# Additional Resources 
The Kallisto paper in Nature [link](https://www.nature.com/articles/nbt.3519)  
The Sleuth paper in bioXRiv [link](https://www.biorxiv.org/content/early/2016/06/10/058164)  
Lesson on read quality check with FastQC [link](http://www.datacarpentry.org/wrangling-genomics/00-quality-control/)
