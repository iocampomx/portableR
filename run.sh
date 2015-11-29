#!/bin/bash
export LD_LIBRARY_PATH=`pwd`/lib
export R_HOME=`pwd`
export R_LIBS=`pwd`/site-library
# Use cases
./R
# Run a script with parameters
#./R --no-restore --file=examples/redshift.R --args PID tehuixtla.png
