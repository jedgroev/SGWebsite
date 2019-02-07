# RNA-Seq workshop
This is the first event focused on RNA-Seq

* __topic__: mRNA-Seq
* __authors__: Tijs and Marc  
* __level__: beginners  
* __learning objectives__:  
    - understand the main steps of a typical mRNA-Seq analysis
    - know about some basic information about how (Illumina) sequencing works 
    - obtain some hands-on experience on remote/cloud computing
    - know what quality checks actually means: fastq formatting, quality encoding, etc.
    - know what trimming consists of: quality + adapters
    - what does read mapping look like in practice?
    - how do you count reads per gene? Difference between raw counts and scaled/normalised counts
    - how to analyse the scaled/normalised read counts? Differential expression, clustering, etc.

# Prerequisites 

## The Shell
Ideally you should know a little bit about the Shell: for instance, some of the common commands (`cd`, `ls`, `ssh`). It is not mandatory and you can come without any previous knowledge.

## A genseq account
You should be able to access the genseq supercomputer using the ssh protocol (`ssh username@genseq-cn00.science.uva.nl`).   
If you don't have an account, please contact Wim de Leeuw (W.C.deLeeuw@uva.nl).

# Setup

# Schedule
14.00 - 14.15: know about some basic information about how (Illumina) sequencing works (fastq format)
14.15 - 14.30: main steps of a typical mRNA-Seq analysis (Ernest Aliche)
14.30 - 15.00: setup for the practical session: mRNA fastq files + genome + annotation + softwares through conda environment 
15.00 - 15.30: fastQC of the raw sequencing files. 
15.30 - 16.00: 
16.45 - 17.00:
(if time allows and/or interest from people): demo of the RNA-Seq Snakemake pipeline (Tijs )

## Description of the files
Genome: 1 chromosome of Arabidopsis
mRNA: a randomly downsampled subset of the original files
GFF annotation: 

