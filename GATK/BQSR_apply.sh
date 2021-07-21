#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 1348:48:15
#SBATCH -J BQSRapply
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk ApplyBQSR \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
-I ./WGS_Keloids_sorted_mrkdup.bam \
-O ./WGS_Keloids_sorted_mrkdup_bqsr.bam \
--bqsr-recal-file ./WGS_Keloids_merged_sorted_mrkdup_bqsr.table \
--preserve-qscores-less-than 6 \
--static-quantized-quals 10 \
--static-quantized-quals 20 \
--static-quantized-quals 30
