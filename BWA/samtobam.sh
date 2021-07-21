#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 548:48:15
#SBATCH -J SAMtoBAM
for i in *.sam; do
samtools view -@ 8 -S -b -h -o ${i%.sam}.bam $i
done
