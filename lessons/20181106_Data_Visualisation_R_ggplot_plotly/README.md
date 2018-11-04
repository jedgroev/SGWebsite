# Data visualisation with R using ggplot and plotly libraries
This session will show how to get more insights about an experimental dataset. How to understand the variables, get an idea of what to plot and how. We will use R and RStudio for this lesson.

# Outline
- (5min) Introduction to Marijn's dataset: what it is, what you want to show, etc.
- (5min) first peek at the data frame on Github 
- (10min) pen and paper for everyone: make your ideal plot (pair of 2 persons)
- (10min) introduction to the ggplot2 and plotly R libraries
- (30min) hands-on + questions/answers

# Lesson 
## Introduction 
We want to measure the effect of a bacteria (E.coli) on the immune system of plants.   
To do so, we measure the fluorescence of leaf disks at two different wavelenghts and at three different time points (0,2 and 4 hours after inoculation).  
In the provided dataset, each row is a measurement of the fluorescence (column `fluorescence`) of one leaf disc. There is also a column (`fluo_normalised`) of the normalised fluorescence (normalised relatively to timepoint 0h).   

## Data visualisation 
You can visualise the dataframe on Github: https://github.com/ScienceParkStudyGroup/studyGroup/blob/gh-pages/lessons/20181106_Data_Visualisation_R_ggplot_plotly/data.tsv      
You can download the dataset at Zenodo (stable data archive): https://doi.org/10.5281/zenodo.1477672  
Have a first look at the dataframe. What are the different experimental variables? Where are the measurements stored?  

## Draw your ideal plot
How could you visualise this (complex) dataset? What kind of plot would you draw?      
Time for pen and paper!

## The ggplot2 and plotly R libraries
### ggplotz
Read the introduction page here: https://ggplot2.tidyverse.org/

### plotly
Plotly is a library to make interactive plots: https://plot.ly/r/

## Hands-on
If you don't have it already, install the `tidyverse` library:   
```
install.packages("tidyverse")
library(tidyverse)
```
If you have it installed, load the library:`library(tidyverse)`  
This will load a few R packages such as `dplyr` (for data transformation) and `ggplot2` (for plotting).

### data input
You can import the `data.tsv` using the command`df = read.delim("data.tsv",header = T,quote = F,quote=F)`  
Have a look at the structure of the dataframe using `str(df)` and `head(df)` 

### plotting (live session)
- Make a plot using the ggplot2 library
- Make this plot interactive using plotly 

# Going further / Useful links
- R for Data Science (data visualisation chapter): https://r4ds.had.co.nz/data-visualisation.html
- The "Grammar of graphics" clearly explained: the theoretical foundation of ggplot2: https://moderndive.com/3-viz.html

