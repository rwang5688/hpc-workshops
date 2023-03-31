#!/bin/bash
#SBATCH --job-name=nextflow-job
#SBATCH --partition=queue1
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --ntasks=1

srun singularity run --bind /shared/nextflow-tutorial:/mnt \
    docker://`echo ${CONTAINER_REPOSITORY_URI}`:v2 \
    nextflow run /mnt/script7.nf --reads '/mnt/data/ggal/*_{1,2}.fq' --outdir=/mnt
