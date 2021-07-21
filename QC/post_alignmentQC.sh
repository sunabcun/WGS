#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J postqc


samtools flagstat ./WGS_Keloids_sorted_mrkdup_bqsr.bam > ./WGS_Keloids_merged_flagstat.txt

java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar CollectInsertSizeMetrics \
I=./WGS_Keloids_sorted_mrkdup_bqsr.bam \
O=./WGS_Keloids_insert_size_metrics.txt \
H=./WGS_Keloids_insert_size_metrics.pdf

java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar \
CollectAlignmentSummaryMetrics \
I=./WGS_Keloids_sorted_mrkdup_bqsr.bam \ O=./WGS_Keloids_alignment_metrics.txt \
R=/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa

java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar CollectGcBiasMetrics \
I=./WGS_Keloids_sorted_mrkdup_bqsr.bam \
O=./WGS_Keloids_merged_gc_bias_metrics.txt \
R=/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
CHART=./WGS_Keloids_merged_gc_bias_metrics.pdf S=./WGS_Keloids_merged_gc_bias_summary.txt


#First we need to create the Autosomal Chromosome Interval List
egrep 'chr[0-9]{1,2}\s' ./GRCh38.genome.fa.fai | awk '{print $1"\t1\t"$2"\t+\t"$1}' | cat ./GRCh38.genome.dict - > ./GRCh38_genome_autosomal.interval_list

java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar CollectWgsMetrics \
I=./WGS_Keloids_sorted_mrkdup_bqsr.bam \
O=./WGS_Keloids_merged_metrics.txt \
R=/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
INTERVALS=/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38_genome_autosomal.interval_list

module load fastqc
fastqc -t 8 WGS_Keloids_sorted_mrkdup_bqsr.bam
tree

# Run MultiQC
python3 -m multiqc ./
tree
