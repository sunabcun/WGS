#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J Create_BAM_INDEX
java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar \
BuildBamIndex \
I=WGS_Keloids_sorted_mrkdup_bqsr.bam
