#!/bin/sh


# execute this bash script in the directory where you have the forward (R1) and reverse (R2) reads
# [Usage] bash trim.sh


# listing forward and reverse files in two bash arrays
for=(./*R1_001.fastq)
rev=(./*R2_001.fastq)

#for item in ${for[*]};do
#	echo $item
#done



for ((i=0;i<${#for[*]};i++)) # iterates over the forward reads array
do
	# get short sample names
	fullname=$(basename -- ${for[i]})
	sample="${fullname%_S[0-9+]*}"
	echo "processing" $sample
	trimmed_for="$sample _R1.trim.fastq"
	trimmed_rev="$sample _R2.trim.fastq"
	echo $trimmed_for
	# cutadapt
	cutadapt -a TTGTACACACCGCCC...GTAGGTGAACCTGCRGAAGG -A CCTTCYGCAGGTTCACCTAC...GGGCGGTGTGTACAA --match-read-wildcards --discard-untrimmed --pair-filter=any --minimum-length 100 -o $trimmed_for -p $trimmed_rev ${for[i]} ${rev[i]} 
done
