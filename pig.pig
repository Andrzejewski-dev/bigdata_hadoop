zones = LOAD 'project/taxi_zone_lookup.csv' USING PigStorage(',');
output1 = LOAD 'project/output1/part-r-*' USING PigStorage('\t');

output1_with_zone = JOIN output1 BY $1, zones BY $0;

month_zone_passenger = FOREACH output1_with_zone GENERATE $0, $4, (int)$2;

month_zone_passenger_grouped_by_borough = GROUP month_zone_passenger BY ($0, $1);

month_borough_passenger = FOREACH month_zone_passenger_grouped_by_borough GENERATE $0.$0, $0.$1, SUM($1.$2);

month_borough_passenger_grouped_month = GROUP month_borough_passenger BY $0;

final_result = FOREACH month_borough_passenger_grouped_month {
 sorted = ORDER $1 BY $2 DESC;
 only_three = LIMIT sorted 3;
 
 GENERATE flatten(only_three);
}

STORE final_result
    INTO 'project/output2.json'
    USING JsonStorage();
