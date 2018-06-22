# Sequencing primers removal

## cutadapt 
[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg?style=flat-square)](http://bioconda.github.io/recipes/cutadapt/README.html)  
Version 1.16 was used and installed using [Conda](https://conda.io/) and the Bioconda channel.

## Sequencing primer sequences

3' primer: CCTTC**Y**GCAGGTTCACCTAC (note the Y)  
5' primer:  TTGTACACACCGCCC  

## Trimming with cutadapt

The library fragment size can be quite short (>90nts) so the forward and reverse reads can overlap both sequencing primers. Thus, both sequencing primers need to be trimmed for forward and for reverse reads:    

If your original fastq files are in a `DSEL15_SIPE1_18SV9_examples/` folder then type:

`for f in ../DSEL15_SIPE1_18SV9_examples/*fastq; do 
	filename=$(basename -- "$f")
	filename="${filename%.*}"
	cutadapt -g TTGTACACACCGCCC -a CCTTCYGCAGGTTCACCTAC --match-read-wildcards --discard-untrimmed --minimum-length 100 $f > $filename.trimmed.fastq;done`

The `--minimum-length 100` discards the few reads that are shorted than 100nts. The reads of length 0 that are kept can mess around with the `plotQualityProfile` function of `dada2`. 

# quality filtering using dada2
Using the `filterAndTrim` function specify `rm.phix=TRUE` and do not truncate the reads. 

# Examples of output from cutadapt 

##  Sample DSEL15-E1-B11-11_S34_L001_R1_001.fastq 
`cutadapt -g TTGTACACACCGCCC -a CCTTCYGCAGGTTCACCTAC --match-read-wildcards --discard-untrimmed ../DSEL15_SIPE1_18SV9_examples/DSEL15-E1-B11-11_S34_L001_R1_001.fastq `

Finished in 9.49 s (71 us/read; 0.85 M reads/minute).

=== Summary ===

Total reads processed:                 134,488  
Reads with adapters:                   134,282 (99.8%)  
Reads written (passing filters):       134,282 (99.8%)  

Total basepairs processed:    22,904,121 bp  
Total written (filtered):     20,852,928 bp (91.0%)  

=== Adapter 1 ===  

Sequence: CCTTCYGCAGGTTCACCTAC; Type: regular 3'; Length: 20; Trimmed: 19 times.  

No. of allowed errors:
0-9 bp: 0; 10-19 bp: 1; 20 bp: 2

Bases preceding removed adapters:
  A: 5.3%
  C: 0.0%
  G: 5.3%
  T: 0.0%
  none/other: 89.5%

Overview of removed sequences  
length	count	expect	max.err	error counts  
3	1	2101.4	0	1  
4	1	525.3	0	1  
157	2	0.0	2	2  
164	1	0.0	2	0 1  
165	7	0.0	2	7  
166	1	0.0	2	1  
167	3	0.0	2	3  
168	2	0.0	2	2  
169	1	0.0	2	1  

=== Adapter 2 ===  

Sequence: TTGTACACACCGCCC; Type: regular 5'; Length: 15; Trimmed: 134263 times.  

No. of allowed errors:  
0-9 bp: 0; 10-15 bp: 1  

Overview of removed sequences  
length	count	expect	max.err	error counts  
7	2	8.2	0	2  
8	1	2.1	0	1  
9	2	0.5	0	2  
10	5	0.1	1	3 2  
11	6	0.0	1	3 3  
12	21	0.0	1	15 6  
13	13	0.0	1	2 11  
14	1255	0.0	1	212 1043  
15	132832	0.0	1	131726 1106  
16	117	0.0	1	45 72  
18	1	0.0	1	1  
20	1	0.0	1	1  
25	1	0.0	1	1  
27	1	0.0	1	1  
29	3	0.0	1	3  
37	2	0.0	1	2   
 
(dada2) Marco:trimmed mgalland$ 
