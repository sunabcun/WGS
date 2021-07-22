#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 1348:48:15
#SBATCH -J varscan

java -jar /gpfs/research/gunjangroup/WGS/Varscan/VarScan.v2.4.2.jar \
somatic <(samtools mpileup --no-BAQ -f \
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
./WGS_Normal_sorted_mrkdup_bqsr.bam \
/gpfs/research/gunjangroup/WGS/BAM/Keloids/WGS_Keloids_sorted_mrkdup_bqsr.bam) \
/gpfs/research/gunjangroup/WGS/somatic/varscan/wgs \
--mpileup 1 --output-vcf

java -jar /gpfs/research/gunjangroup/WGS/Varscan/VarScan.v2.4.2.jar \
processSomatic wgs.snp.vcf wgs.snp
java -jar /gpfs/research/gunjangroup/WGS/Varscan/VarScan.v2.4.2.jar \
processSomatic wgs.indel.vcf wgs.indel


find /gpfs/research/gunjangroup/WGS/somatic/varscan \
-name '*.vcf' -exec bgzip -f {} \;


find /gpfs/research/gunjangroup/WGS/somatic/varscan \
-name '*.vcf.gz' -exec tabix -f {} \;

/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk VariantFiltration \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
-V wgs.snp.Somatic.vcf.gz \
--mask wgs.snp.Somatic.hc.vcf.gz \
--mask-name "processSomatic" \
--filter-not-in-mask \
-O wgs.snp.Somatic.hc.filter.vcf.gz


/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk VariantFiltration \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
-V wgs.indel.Somatic.vcf.gz \
--mask wgs.indel.Somatic.hc.vcf.gz \
--mask-name "processSomatic" \
--filter-not-in-mask \
-O wgs.indel.Somatic.hc.filter.vcf.gz
/gpfs/research/gunjangroup/WGS/bcftools/bcftools-1.3.1/bcftools concat -a \
-o wgs.vcf.gz \
-O z wgs.snp.Somatic.hc.filter.vcf.gz wgs.indel.Somatic.hc.filter.vcf.gz


tabix -f /gpfs/research/gunjangroup/WGS/somatic/varscan/wgs.vcf.gz
