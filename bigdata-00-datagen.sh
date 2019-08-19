#! /bin/bash

#Create Directories
cd /bigdata
mkdir emrdata
mkdir redshiftdata


#EMR data
cd /bigdata/tpch-kit/dbgen
make OS=LINUX
export DSS_PATH=/bigdata/emrdata
./dbgen -v -T o -s 10


#Redshift data
export DSS_PATH=/bigdata/redshiftdata
./dbgen -v -T o -s 40

#Split redshift data
cd /big_data/redshiftdata
split -d -l 15000000 -a 4 orders.tbl orders.tbl.
split -d -l 60000000 -a 4 lineitem.tbl lineitem.tbl.