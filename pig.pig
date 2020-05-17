zones = LOAD 'taxi_zone_lookup.csv' USING PigStorage(',');
output1 = LOAD 'output1/part-r-*' USING PigStorage('\t');

output1_with_zone = JOIN output1 BY $1, zones BY $0;

month_zone_passenger = FOREACH output1_with_zone GENERATE $0, $4, (int)$2;

month_zone_passenger_grouped_by_borough = GROUP month_zone_passenger BY $1;

month_borough_passenger = FOREACH month_zone_passenger_grouped_by_borough GENERATE $1.$4, $0, SUM($1.$2);


DUMP month_borough_passenger;

