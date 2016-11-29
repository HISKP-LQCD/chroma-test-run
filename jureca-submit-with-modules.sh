#!/bin/bash -e -u -x
# Copyright © 2016 Martin Ueding <dev@martin-ueding.de>

# Submits the job to the JURECA queue and makes sure that the needed modules to
# run `hmc` are loaded before submitting.

module load Intel
module load IntelMPI

sbatch "$1"
