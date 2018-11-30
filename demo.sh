#!/bin/bash

# We request a compute nodes with 10 CPUs and 3 GB of memory, and at
# most 10 minutes of runtime.

#PBS -N demo
#PBS -S /bin/bash
#PBS -l mem=3gb
#PBS -l walltime=00:10:00 
#PBS -l nodes=1:ppn=10

# For reproducibility, add version numbers to "module load" calls.
module load gcc/6.2.0 R/3.5.0

# Run classic R benchmark from https://github.com/jtalbot/riposte.
Rscript R-benchmark-25.R
