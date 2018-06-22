#!/bin/sh


# execute this bash script in the directory where you have the forward (R1) and reverse (R2) reads
# [Usage] bash trim.sh


# listing forward and reverse files in two bash arrays
for=(./*R1_001.fastq)
rev=(./*R2_001.fastq)


for ((i=0;i<${#for[*]};i++)) # iterates over the forward reads array
do
	# get short sample names
	fullname=$(basename -- ${for[i]})
	shortname="${fullname%_S[0-9+]*}"
	echo "processing" $shortname
	# cutadapt
	cutadapt -a CCTTCYGCAGGTTCACCTAC -g TTGTACACACCGCCC -A GTAGGTGAACCTGCRGAAGG	-G GGGCGGTGTGTACAA --match-read-wildcards --discard-untrimmed --minimum-length 100 -o ./trimmed/$shortname_R1.trim.fastq -p ./trimmed/$shortname_R2.trim.fastq ${for[i]} ${rev[i]} 2>./trimmed/$shortname.report.txt 
done