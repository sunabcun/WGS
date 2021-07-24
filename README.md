# WGS
This is the code and files for WGS analysis.

1. Trimming the fastq files and get QC data.
  - TrimGalore: https://github.com/FelixKrueger/TrimGalore
  - To run this, need to have cutadapt and fastq
  - cutadapt: https://cutadapt.readthedocs.io/en/stable/installation.html python3 -m pip install --user --upgrade cutadapt

2. Creating Reference for BWA-MEM
  - Download Ref: wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/GRCh38.p12.genome.fa.gz
  - $bwa index GRCh38.genome.fa

3. Base Quality Score Recalibration (Post Alignment)
  - gatk Baserecalibrator: https://gatk.broadinstitute.org/hc/en-us/articles/360036898312-BaseRecalibrator

4. Post Alignment QC
  - Flagstat
  - Picard CollectMetrics
  - Run FASTQC

5. Somatic mutations
  1) Running VARSCAN
    - A platform-independent mutation caller for targeted, exome, and whole-genome resequencing data and employs a robust heuristic/statistic approach to call variants that meet         desired thresholds for read depth, base quality, variant allele frequency, and statistical significance.
  2) Running STRELKA
    - Strelka calls germline and somatic small variants from mapped sequencing reads and is optimized for rapid clinical analysis of germline variation in small cohorts and            somatic variation in tumor/normal sample paris. Both germline callers include a final empirical variant rescoring step using a random forest model to reflect numerous              features indicative of call reliability which may not be represented in the core variant calling probability model.
  3) MuTect2
    - MuTect2 is a somatic SNP and indel caller that combines the DREAM challenge-winning somatic genotyping engine of the original MuTect with the assembly-based machinery of           HaplotypeCaller.
    (1) Panel of Normal
    
 
6. Merge Variants: With outputs from all three algorithms, merge the variants to generate a comprehensive list of detected variants.
  - Installation of GATK 3.6 is need for the further processing (GATK4.0 doesn't have the function).
  - wget http://genomedata.org/pmbio-workshop/references/gatk/GenomeAnalysisTK-3.6-0-g89b7209.tar.bz2
