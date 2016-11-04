#!/bin/bash
# Copyright © 2016 Martin Ueding <dev@martin-ueding.de>
# Licensed under the MIT license.

set -e
set -u
set -x

hmc -i testrun.ini.xml -o testrun.out.xml -geom 1 1 1 2 #> testrun.log.txt
