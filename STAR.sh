#!/bin/bash
filename='../sample.list'
exec < $filename
while read line
do
   echo $line
   find ../FASTQ/$line*_R1_*.fastq.gz > fq1.txt
   ../FASTQ/$line*_R2_*.fastq.gz > fq2.txt
   fq1=$(cat fq1.txt | tr '\n' ',')
   fq2=$(cat fq2.txt | tr '\n' ',')
   /home/chenh15/tools/STAR/bin/Linux_x86_64/STAR --quantMode GeneCounts --runThreadN 5 --genomeDir /home/chenh15/ref/Homo_sapiens/UCSC/hg19/Sequence/STARIndex/ --sjdbGTFfile /home/chenh15/ref/Homo_sapiens/UCSC/hg19/Annotation/Genes/genes.gtf --outSAMtype None --readFilesCommand zcat --readFilesIn $fq1 $fq2 --outFileNamePrefix ./$line
done
