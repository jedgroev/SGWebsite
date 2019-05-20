## Title of the lesson

- **Authors**: 
  - Tijs Bliek (technician, Plant Epigenetics & Development, SILS)
  - Marc Galland (Data analyst/manager, Plant Physiology, SILS) 
- **Lesson Topic**: How to make a bioinformatic pipeline using the workflow manager Snakemake
- **When and Where**: May 21th, 16-17h, D1.110
- **Preparation**: A laptop is not mandatory for this lesson although we recommend to bring one for the small hands-on session.
- **Level**: Beginners, no prior knowledge needed.

## Prerequisites 
Some notions about genomics and different steps that can be taken would be helpful but that's not mandatory. 

## Setup

### Softwares
:snake: **Snakemake** :snake:  
If you'd like to install Snakemake, we recommend to use the `conda` software/package manager. You can install it by getting the Miniconda distribution that contains only Python and Conda. 

Get Miniconda here: https://docs.conda.io/en/latest/miniconda.html. Make sure you choose to the `.exe` or `.pkg` installers if you don't want to install it through the command line. 

Alternatively, if you're not afraid of the command-line, start your Shell and type:
```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
When conda is installed, you can install Snakemake by typing: `conda env create --name snakemake -c bioconda snakemake-minimal`. This will install a light version of the :snake: Snakemake tool :snake:.  

:pencil2: :notebook: **Text editor**  
There are many text editors that you can use. We recommend:
- Sublime text: https://www.sublimetext.com/
- Atom: https://atom.io/  

### Datasets :
The best thing is to upload your datasets and all necessary files on a stable archive :open_file_folder: such as [Zenodo](https://zenodo.org/) or on the [UvA Figshare account](https://uvaauas.figshare.com/).  
For Zenodo, there is a Science Park Study Group community :family: that host all Study Group related files: https://zenodo.org/communities/scienceparkstudygroup/.

## Lesson outline
1. Introduction to workflows in bioinformatics (~10min): why do you need them, what is the added value of using them?
2. Demonstration of a Snakemake pipeline: downloading, running locally and on a remote compute cluster (genseq).
3. Questions and answers!
4. Small hands-on session (~15min).

We will follow this nice and simple tutorial for the lesson:  
https://slowkow.com/notes/snakemake-tutorial/
