# RNA-Seq data visualization - Max van Hooren (PhD student, Plant Cell Biology)

## Description
This one-hour session will be a follow up to this lesson: https://github.com/ScienceParkStudyGroup/studyGroup/tree/gh-pages/lessons/20180220_RNA-Seq_Max_and_Fred  
If you just got your FASTA files back you can start of there. The lessons ends where this lesson will start off.

In order to get started you can find files to work with over here:
https://www.dropbox.com/sh/w6954s2pyja1m8z/AAAyNyECfRqRrahy2CpKjkQKa?dl=0  
These files might change location at some point, in this case the digital version of this document will also be updated.

We will start of by using the “shiny app” which is run in R by using Sleuth.
If you don’t have R already you can get it over here: https://www.rstudio.com/
and sleuth can be gotten by running this command in R:

__If you haven't already. first install Sleuth. Just copy paste the following command in R and you should be good to go.__
`
source("http://bioconductor.org/biocLite.R")  
biocLite("rhdf5")  
install.packages("devtools")
devtools::install_github("pachterlab/sleuth")
`

## Load sleuth
suppressMessages({
 		library("sleuth")
})

Now that we have sleuth installed and opened we can load in the “.Rdata” This file already contains already aligned RNA-seq data, for which differential gene expression is already determined.
If we run:
`sleuth_live(so)`

This will open the shiny app, and use the “so” (sleuth object) as the data to visualize. 

Lots of tools to use inside of shiny: volcona plot, transcript view, diagnositcs etc.

## Gene annotation: What even are these genes??  
You can anotate your genes in R, I suggest using either “BiomaRt“ or “Bioconductor“. I have, however, never did this. I just used the bulk search from Arabidopsis.org, however, as the name suggests this only works for Arabidopsis, though for other organisms similar sources might be available:  
https://www.arabidopsis.org/tools/bulk/genes/index.jsp

 
## Go term analysis. 
Go terms are a  way to sort genes by function. Go terms can be nested within each other, so there is a go term for  “abiotic stress“ which includes all the terms included in “metal stress“
For this there are many, many tools available. It can be done with R, other software packages, and online. An easy to use online tool is: 
http://bioinfo.cau.edu.cn/agriGO/analysis.php

 
## Venn diagrams.
Comparing data can be very useful, maybe you tested different conditions that you want to compare, or you want to compare your data to that from somebody else. In those cases it can be useful to use venn diagrams to get a quick overview of how much your data has in common.  
I used: http://bioinformatics.psb.ugent.be/webtools/Venn/  
With the files supplied there is also the results from an drought experiment performed by Georgi et al  2017, this can be used to compare to   

However drawing venn diagams in R quite easy as well. And depending on the package you can determine color, and size
For this example you can compare to differential expressed genes to the


## MapMan
Mapman is a visualization tool to find if your genes are involved in specific pathways. This is many ways very similar to Go term analysis. Mapman is a freeware that you need to install before you can work with it.  
Many plant reference genomes and pathways are available: https://mapman.gabipd.org/mapman-download  
You can select different pathways to take a look at, depending on your question some pathways might pose special interest. In this case the overviews are most interesting to check  out to get an idea of what the drought stress has changed.


## Follow ups / Going further. 
- __Cytoscape:__ a freeware tool to draw networks, which you can use to  visualize which of your genes might be interacting hubs, this especially useful if you want to find regulators or transcription factors.
- __Heat maps:__ can be done in R
- Suggestions? .. 

