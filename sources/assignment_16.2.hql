
DROP DATABASE IF EXISTS assignment_16_2 CASCADE;

CREATE DATABASE IF NOT EXISTS assignment_16_2;

USE assignment_16_2;

DROP TABLE IF EXISTS arr_table;
-- create the arr_table table as an external and specify the location of the data in HDFS
create EXTERNAL table IF NOT EXISTS arr_table
(
	arr array<string>
)
row format delimited
fields terminated by '\t'
collection items terminated by '|'
LOCATION '/user/arvind/hive/acadgild/assignments/assignment_16.2/input/';

select * from arr_table;

--register the JAR which contains the implementation of UDF
ADD JAR /home/arvind/hive/acadgild/assignments/assignment_16.2/lib/hive-udf.jar;

-- create an alias for the UDF
CREATE TEMPORARY FUNCTION concat_ws as 'ConcatWS';

-- use the UDF and write the output to a file in the local file system
INSERT OVERWRITE LOCAL DIRECTORY '/home/arvind/hive/acadgild/assignments/assignment_16.2/output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
select concat_ws("-",arr) FROM arr_table;
