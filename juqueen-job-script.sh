#@ job_name = chroma-test-run
#@ output = $(job_name)-$(jobid)-out.txt
#@ error = $(job_name)-$(jobid)-err.txt
#@ environment = COPY_ALL
#@ wall_clock_limit = 00:30:00
#@ notification = error
#@ notify_user = ueding@hiskp.uni-bonn.de
#@ job_type = bluegene
#@ bg_size = 32
#@ queue

LD_LIBRARY_PATH=local/lib runjob --ranks-per-node 1 : ../local/bin/hmc -i testrun.ini.xml -o testrun.out.xml
