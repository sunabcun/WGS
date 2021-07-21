#!/bin/bash
#SBATCH --job-name="trap"
#SBATCH -N 1
#SBATCH --mem=16G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 148:48:15
#SBATCH -J SortBAM
java -jar /gpfs/research/medicine/sequencer/NovaSeq/Outputs_fastq/2020_Outputs/Akash_Gunjan_05-19-2020_Yuna-samples/WGS/Tools/picard.jar SortSam I=WGS_Normal_usr.bam O=WGS_Normal_namesorted.bam SO=queryname TMP_DIR=`pwd`/tmp
