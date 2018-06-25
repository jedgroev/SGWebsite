#!/bin/sh

for f in DSEL15_SIPE1_18SV9_examples_trimmed/*_R1_001.trim.fastq
do 
	fullname=$(basename -- $f)
	sample=${fullname%_S[0-9]*}
	seqtk sample -s100 $f 10000 > "$sample _R1.trim.sub.fastq"
done

for f in DSEL15_SIPE1_18SV9_examples_trimmed/*_R2_001.trim.fastq
do 
	fullname=$(basename -- $f)
	sample=${fullname%_S[0-9]*}
	seqtk sample -s100 $f 10000 > "$sample _R2.trim.sub.fastq"
done