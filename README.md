# WGS
This is the code and files for WGS analysis.

1. Trimming the fastq files and get QC data.
  - TrimGalore: https://github.com/FelixKrueger/TrimGalore
  - To run this, need to have cutadapt and fastq
  - cutadapt: https://cutadapt.readthedocs.io/en/stable/installation.html python3 -m pip install --user --upgrade cutadapt

2. Creating Reference for BWA-MEM
  - Download Ref: wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/GRCh38.p12.genome.fa.gz
  - $bwa index GRCh38.genome.fa
