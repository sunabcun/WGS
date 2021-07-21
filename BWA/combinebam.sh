#!/bin/bash
#SBATCH -N 4
#SBATCH --mem=64G
#SBATCH -p medicine_q
#SBATCH --mail-type="ALL"
#SBATCH -t 348:48:15
#SBATCH -J MergeBam
samtools merge -@ 8 WGS_Normal_merged.bam HDF1.bam HDF2.bam HDF3.bam HDFPA.bam
