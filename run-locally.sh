#!/bin/bash
# Copyright © 2016 Martin Ueding <dev@martin-ueding.de>
# Licensed under the MIT license.

set -e
set -u
set -x

if [[ ../chroma/mainprogs/main/hmc ]]
then
    hmc=../chroma/mainprogs/main/hmc
else
    hmc=hmc
fi


$hmc -i testrun.ini.xml -o testrun.out.xml -geom 1 1 1 2 > testrun.log.txt

../hmc-analysis-tools/plaquette.py testrun.out.xml
convert testrun.out-deltaH.pdf -resize 400x400 plots/${1}-deltaH.png
convert testrun.out-plaquette.pdf -resize 400x400 plots/${1}-plaquette.png
