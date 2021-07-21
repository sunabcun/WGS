#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 1348:48:15
#SBATCH -J BQSR_table_calculate
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk BaseRecalibrator \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
-I ./WGS_Keloids_sorted_mrkdup.bam \
-O ./WGS_Keloids_merged_sorted_mrkdup_bqsr.table \
--known-sites /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/reference/gatk/Homo_sapiens_assembly38.dbsnp138.vcf.gz \
--known-sites /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/reference/gatk/Homo_sapiens_assembly38.known_indels.vcf.gz \
--known-sites /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/reference/gatk/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz \
--preserve-qscores-less-than 6
