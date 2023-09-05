#!/bin/bash
#SBATCH --job-name=hello-world-job
#SBATCH --partition=compute
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --ntasks=4

mpirun ./mpi_hello_world
