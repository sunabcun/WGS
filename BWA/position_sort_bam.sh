#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p genacc_q
#SBATCH --mail-type="ALL"
#SBATCH -t 148:48:15
#SBATCH -J PositionSortBam
java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar \
SortSam \
I=WGS_Normal_mrkdup.bam \
O=WGS_Normal_sorted_mrkdup.bam \
SO=coordinate \
TMP_DIR=`pwd`/tmp
