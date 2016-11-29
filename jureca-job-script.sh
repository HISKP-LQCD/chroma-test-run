#!/bin/bash -x

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#BATCH --partition=batch

srun ./hmc -i testrun.ini.xml -o testrun.out.xml
