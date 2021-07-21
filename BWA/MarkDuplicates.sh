#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p genacc_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J MarkDuplicates
java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar \
MarkDuplicates \
I=WGS_Normal_namesorted.bam \
O=WGS_Normal_mrkdup.bam \
ASSUME_SORT_ORDER=queryname \
METRICS_FILE=WGS_Normal_mrkdup_metrics.txt \
QUIET=true \
COMPRESSION_LEVEL=0 \
VALIDATION_STRINGENCY=LENIENT \
TMP_DIR=`pwd`/tmp
