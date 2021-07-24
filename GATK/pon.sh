#!/bin/bash
#SBATCH -N 6
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 1348:48:15
#SBATCH -J pon

#Creating a panel of normals
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk Mutect2 \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
--max-mnp-distance 0 \
-I ./WGS_Normal_sorted_mrkdup_bqsr.bam \
-O WGS_Norm_PON.vcf.gz \

# Create a GenomicsDB from the normal Mutect2 calls
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk GenomicsDBImport \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
--genomicsdb-workspace-path pon_db \
-V WGS_Norm_PON.vcf.gz


# Combine the normal calls using CreateSomaticPanelOfNormals
/gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/gatk-4.2.0.0/gatk CreateSomaticPanelOfNormals \
-R /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/BWA/Reference/GRCh38.genome.fa \
--germline-resource /gpfs/research/gunjangroup/WGS/somatic/mutect/reference/af-only-gnomad.vcf.gz \
-V gendb://pon_db \
-O pon.vcf.gz
