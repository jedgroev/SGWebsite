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
First, please download the lesson files from Zenodo [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1201035.svg)](https://doi.org/10.5281/zenodo.1201035) and unzip it.

The lesson files come in two flavors:
1. ``RNAseq_lesson_only_start_files.zip`` contains the RNA sequencing file (fastq format), a reference transcriptome sequence (fasta format) and experimental setup info.
2. ``RNAseq_lesson_all_files.zip`` contains the same files above and the results of the complete analysis.  

## Create a working environment 
One good practice is to create a working environment  that contains softwares, Python packages, R packages etc. It should remain separated from your default `root` environment (sometimes called "Anaconda3" also) because some libraries or some other installation bugs can appear later on (softwares sometimes depend on different libraries and they then enter in conflict).

There are two ways to do it. With the _Anaconda navigator_ or from the _command line_

__Using Anaconda Navigator__

1. Start the 'Anaconda Navigator'
2. Click on 'Environments' 
3. Click on 'Create'
4. Name it 'bio' (or any other name that make sense to you)
5. Select Python 3.6  (__do not select r__)
6. Click on 'channels' and make sure you have `bioconda` as a channel
7. Search for `kallisto` and `r-sleuth` and select apply
8. Search and install `jupyter` 
9. Open the downloaded jupyter notebook ``RNAseq_lessonv1.05.ipynb`` 


__From the command line__ 

The conda package/software manager should be accessible directly. In other words, your computer should know where to find the `conda` program. It should be in your PATH variable. Check it with `echo $PATH`. 

If you don't see anything like `/Users/[yourname]/anaconda/bin/` then you have to add it to your PATH. To do so, in the command line terminal, type `echo "export PATH=$PATH:/Users/[yourname]/anaconda/test/" >> ~/.bash_profile`. On some systems, it can be `echo "export PATH=$PATH:/Users/[yourname]/anaconda/test/" >> ~/.bashrc`.
1. Make a new environment called "bio" with: `conda create --name bio python=3.6 kallisto r-sleuth` 
2. Type `y` when asked. 
3. Activate this new environment with `source activate bio` 
4. Also install "jupyter" by typing `conda install jupyter` to get the capacity to launch Jupyter notebooks.  
5. Run ``jupyter notebook RNAseq_lessonv1.05.ipynb``

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
