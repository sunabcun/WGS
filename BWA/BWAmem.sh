#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 1348:48:15
#SBATCH -J BWA_WGS
for i in *_R1.fastq.gz; do
bwa mem -t 8 -Y -R "@RG\tID:${i%_R1.fq.gz}_ID\tPL:ILLUMINA\tLB:${i%_R1.fq.gz}_wgs_keloids\tSM:${i%_R1.fq.gz}_SM" \
-o /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/trimmed_FASTQ/Keloids/Aligned_Keloids/${i%_R1.fq.gz}.sam \
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
$i ${i%_R1.fq.gz}_R2.fq.gz
done
