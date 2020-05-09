#!/bin/bash

wget https://raw.githubusercontent.com/Andrzejewski-dev/bigdata_hadoop/master/passengerperarea.jar

wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-01.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-02.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-03.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-04.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-05.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-06.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-07.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-08.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-09.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-10.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-11.csv
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-12.csv
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv

mkdir tripdata
mkdir output1

hadoop fs -mkdir tripdata
hadoop fs -mkdir output1

mv yellow_tripdata_2019-01.csv tripdata/
mv yellow_tripdata_2019-02.csv tripdata/
mv yellow_tripdata_2019-03.csv tripdata/
mv yellow_tripdata_2019-04.csv tripdata/
mv yellow_tripdata_2019-05.csv tripdata/
mv yellow_tripdata_2019-06.csv tripdata/
mv yellow_tripdata_2019-07.csv tripdata/
mv yellow_tripdata_2019-08.csv tripdata/
mv yellow_tripdata_2019-09.csv tripdata/
mv yellow_tripdata_2019-10.csv tripdata/
mv yellow_tripdata_2019-11.csv tripdata/
mv yellow_tripdata_2019-12.csv tripdata/
mv taxi+_zone_lookup.csv taxi_zone_lookup.csv

hadoop fs -copyFromLocal passengerperarea.jar passengerperarea.jar
hadoop fs -copyFromLocal taxi_zone_lookup.csv taxi_zone_lookup.csv
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-01.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-02.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-03.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-04.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-05.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-06.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-07.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-08.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-09.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-10.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-11.csv tripdata/
hadoop fs -copyFromLocal tripdata/yellow_tripdata_2019-12.csv tripdata/

hadoop jar passengerperarea.jar PassengerPerArea tripdata/*.csv output1

hadoop fs -copyToLocal output1/part-r-00000 output1/
hadoop fs -copyToLocal output1/part-r-00001 output1/
hadoop fs -copyToLocal output1/part-r-00002 output1/
hadoop fs -copyToLocal output1/part-r-00003 output1/
hadoop fs -copyToLocal output1/part-r-00004 output1/
