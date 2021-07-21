#!/bin/bash
#SBATCH -N 4
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J ChangeGroupReads
java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar AddOrReplaceReadGroups \
VALIDATION_STRINGENCY=LENIENT \
VERBOSITY=ERROR \
SO=unsorted \
I= WGS_Normal_merged.bam \
O= WGS_Normal_usr.bam \
RGID=Normal_merged \
RGLB=WGS_lib \
RGPL=illumina \
RGPU=1 \
RGSM=merged
