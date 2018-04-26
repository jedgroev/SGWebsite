RNAseq
# Description
This lesson is an introduction to analysing your sequencing data. We will use some Arabidopsis Thaliana data, with and without drought stress. We will be making  use of FastQC, kallisto and sleuth (in R).
**Don't forget to bring your own laptop.** 

# Time and Place
**Where:** Room B0.206, Science Park 904
**When:**  Tuesday, february 20, 2018 at 17:00 PM

# Required Preparation
## Prior knowledge 
No prior knowledge required. 

## Software Dependencies
A working Python distribution. You can install Anaconda for an all-in-one setup. [https://www.anaconda.com/distribution/](Anaconda)

# Link to the lesson notebook
## To visualise 
[Click here!](https://github.com/ScienceParkStudyGroup/studyGroup/blob/gh-pages/lessons/20171010_Intro_to_Python_Like/1hr_python_workshop.ipynb)
## To download 
[Right-click "Save link as" keeping the .ipynb extension](https://github.com/ScienceParkStudyGroup/studyGroup/tree/gh-pages/lessons/20171010_Intro_to_Python_Like) 

# Credits
This lesson is based on a Software Carpentry lesson available [here](http://swcarpentry.github.io/python-novice-inflammation/) 

# Introduction #
Welcome to this brief walkthrough of doing an analysis of an RNA-seq experiment. We will use some Arabidopsis Thaliana data, with and without drought stress. We will be making  use of FastQC, kallisto and sleuth (in R).
For each step we have provided the starting files, so you can jump into the walkthrough wherever you want.

# FastQC #
The first step after getting back your RNA-sequencing results is to check if your reads are of decent quality. In order to do this we will use FastQC, it is much used tool that is freely avalable.[here](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

Download software if you don’t have it already. IT works by simple drag and drop.

The data we will be using today has been sequenced using Ion-torrent sequencing, the results from this have a different quality than that of illumina, for which FastQC has been optimized. Therefore fastQC will contain some more errors than you might get when you try this with your own data.

You can look through the data file to see if anything looks wrong to you. We will focus only on quality of reads and read size, for more information about the different options of FastQC there are more ellaborate manuals [like this one](https://dnacore.missouri.edu/PDF/FastQC_Manual.pdf)
If we look at the per base sequence quality we see that if reads are longer, the sequencing quality goes down. In the "Per sequence quality score we see that there are some reads with a quality score of less than 17. For Ion-torrent-sequencing a 17 is the cut-off value you want to take. In the case of Illumina data ???? is generally accepted.

In order to get rid of the reads with low quality we can run the following line in the ?shell?
download$ fastq_quality_filter -q 17 -p 75 -o testrun.fastq
q standing for the quality cut off. p for the percentage of the read 

After we have taken a look at the data we see that the there are some samples which have a low read quality and a group of mRNA that are smaller than 15nt.
For this research project we are not interested in these small RNA’s and therefore we will take them out.

For this we will use “fastx_clipper” which will take out all reads that are to small. And we will use fastq_quality filter which will take out all the samples that have a q (quality) score of 17, in 75 p (percentage) of their samples.
We want the output to go to the file “testrun.fastq”

subsetdata MaxvH$ fastx_clipper -l 25 -i subset-S01.fastq | fastq_quality_filter -q 17 -p 75 -o testrun.fastq

Since doing this for all samples seperatly will take quite some time we can loop this procedure to cut and filter all samples in the folder at once.

for filename in Ion-torrent-raw-data/S*.fastq; 
do fastx_clipper -l 25 -i $filename | fastq_quality_filter -q 17 -p 75 -o $filename-filtered.fastq; 
done

These new filtered data we can put back in FastQC to see if indeed we have gotten rid of our small samples.

# Kallisto #
When we have made sure that the input data is correct we can now use kallisto to align our reads to our reference genome.
*how does kallisto work, with reference*

Kallisto requires, next to the reference genome and your reads also the information of your average read length and the standard deviation.
I have done this before in two steps. First I used a command line to extract the length information of every read.

for filename in filtered/*.fastq; 
do cat $filename | awk '{if(NR%4==2) print length($1)}' > $filename.readslength.txt; 
done
(a fastq file has 4 lines per read, 1 with the name, 1 with the sequence, 1 with the quality score and a blank to line. This script will take the second line for every 4 lines and count the number of characters in that line.)

This text file can now be inserted into either R or excel, to get the average length and the standard deviation.

Now that we have all our puzzle pieces we can use kallisto.

kallisto/kallisto quant -i practice/TAIR10_cdna_20101214_updated_ERCC92.idx -o practice/output/ownLSDS46 -b 500 --single -l91.10572 -s 38.41601 Ion-torrent-raw-data/filtered/S46.fastq-filtered.fastq;

we first ask for kallisto to run: kallisto/kallisto quant
we give the reference genome: -I …
and we show where we want the results: -o …
next we supply some information:
bootstraps, this will indicate how many times Kallisto refines the alignment procedure. We will start at #3, but you can easily go up to 500 without a big increase in alignment time: -b 3
our data here is single reads: --single
If your data is paired end you can use here –paired
Then we supply the average length of your sample: -l
And the standard deviation: -s
The last bit of information is the fastq file you want to map to your reference: …

Simply press enter and Kallisto will start aligning.
Also this script can be looped if you have many samples:

for filename in Ion-torrent-raw-data/filtered/*.fastq; 
do kallisto/kallisto quant -i practice/TAIR10_cdna_20101214_updated_ERCC92.idx -o $filename-folder -b 500 --single -l90 -s 18 $filename; 
done

Your output folder will contain 3 files.
..
..
..

The output from this run can be directly used to start comparing samples. In in for example excel.

# sleuth #
We also quickly showcase Sleuth, an analysing tool especially made to be used in conjuction with Kallisto, it has the great advantage that it will take the variation you get in your bootstraps into account when determining the significance of any difference in expression, increasing your statistical power.

Sleuth is ran in R, so if you want to run Sleuth you will first need to install R (studios).
https://www.rstudio.com/

R needs the input of your experimental set-up, including the location of each of your samples.
The kind of test that you want to do.
And what kind of variable you want to explore.
We have already seen the experimental set-up of the experiment. However, we only want to compare some of these samples right now, so we will need to create txt file with only these conditions:
…
*Sample_id <- load table*

This file with sample_id now only contains the experimental conditions, sleuth likes to know where to look for the files that match this description, so next we will add the file path to the sample_id R table.
sample_id <- dir(file.path("Ion-torrent-raw-data","outputfilterdata", "deel"))

euhh
kal_dirs <- file.path("Ion-torrent-raw-data","outputfilterdata", "deel", sample_id)

maakte een sleuth object.
s2c <- read.table(file.path("Ion-torrent-raw-data","sample_conditions", "WtVSmutantSDrought.txt"), header = TRUE, stringsAsFactors=FALSE)

select the criteria that you want to choose the stuff fro.
s2c <- dplyr::select(s2c, sample = sample, mutant)
s2c <- dplyr::mutate(s2c, path = kal_dirs)
s2c
so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE);so <- sleuth_fit(so, ~mutant, 'full')
so <- sleuth_fit(so, ~1, 'reduced')
so <- sleuth_lrt(so, 'reduced', 'full')
models(so)
this model is now done, this contains all your information. Before we are going to look in the data we will save the the genes to a file:
sleuth_table <- sleuth_results(so, 'reduced:full', 'lrt', show_all = FALSE)
sleuth_significant <- dplyr::filter(sleuth_table, qval <= 0.15)
head(sleuth_significant, 20)
write.table(sleuth_significant, "ion-torrent-raw-data/outputfilterdata/sleuth_output/WtVSmutantSDrought_mutant_0.15.txt", sep="\t") 
sleuth_significant <- dplyr::filter(sleuth_table, qval <= 0.05)
head(sleuth_significant, 20)
write.table(sleuth_significant, "ion-torrent-raw-data/outputfilterdata/sleuth_output/WtVSmutantSDrought_mutant_0.05.txt", sep="\t")

Jupiler. notebook online
