#!/bin/bash

rm -rf project
hadoop fs -rm -r project

mkdir project
hadoop fs -mkdir -p project

mkdir project/tripdata
hadoop fs -mkdir -p project/tripdata

mkdir project/output1

wget https://raw.githubusercontent.com/Andrzejewski-dev/bigdata_hadoop/master/passengerperarea.jar -P project/
wget https://raw.githubusercontent.com/Andrzejewski-dev/bigdata_hadoop/master/pig.pig -P project/

wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-01.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-02.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-03.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-04.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-05.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-06.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-07.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-08.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-09.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-10.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-11.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-12.csv -P project/tripdata/
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv -O project/taxi_zone_lookup.csv


hadoop fs -copyFromLocal project/passengerperarea.jar project/passengerperarea.jar
hadoop fs -copyFromLocal project/taxi_zone_lookup.csv project/taxi_zone_lookup.csv
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-01.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-02.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-03.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-04.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-05.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-06.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-07.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-08.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-09.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-10.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-11.csv project/tripdata/
hadoop fs -copyFromLocal project/tripdata/yellow_tripdata_2019-12.csv project/tripdata/

hadoop jar project/passengerperarea.jar PassengerPerArea "project/tripdata/*.csv" "project/output1"

hadoop fs -copyToLocal project/output1/part-r-00000 project/output1/
hadoop fs -copyToLocal project/output1/part-r-00001 project/output1/
hadoop fs -copyToLocal project/output1/part-r-00002 project/output1/
hadoop fs -copyToLocal project/output1/part-r-00003 project/output1/
hadoop fs -copyToLocal project/output1/part-r-00004 project/output1/
