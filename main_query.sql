CREATE TABLE mobile_data (
    name varchar(100),	
	battery varchar(100),	
	camera varchar(100),	
	display varchar(100),	
	processor	varchar(100), 
	memory varchar(100),	
	warranty varchar(100),	
	price varchar(100),	
	rating varchar(100),	
	reviews Numeric
	);
--display table
select * 
from mobile_data
order by price asc;

--uploading csv file
COPY mobile_data(name, battery, camera, display, processor, memory, warranty, price, rating, reviews)
FROM 'C:\Users\shikh\Desktop\JA_Assignment\mobile_dataset.csv'
DELIMITER ','
CSV HEADER;
--count no of data avaiable
select count(*)
from mobile_data;
--no of null values
SELECT 
    COUNT(*) AS total_records,
    COUNT(CASE WHEN name = 'Null' THEN 1 END) AS name_null_count,
    COUNT(CASE WHEN battery = 'Null' THEN 1 END) AS battery_null_count,
    COUNT(CASE WHEN camera = 'Null' THEN 1 END) AS camera_null_count,
    COUNT(CASE WHEN display = 'Null' THEN 1 END) AS display_null_count,
    COUNT(CASE WHEN processor = 'Null' THEN 1 END) AS processor_null_count,
    COUNT(CASE WHEN memory = 'Null' THEN 1 END) AS memory_null_count,
    COUNT(CASE WHEN warranty = 'Null' THEN 1 END) AS warranty_null_count,
    COUNT(CASE WHEN price = 'Null' THEN 1 END) AS price_null_count,
    COUNT(CASE WHEN rating = 'Null' THEN 1 END) AS rating_null_count,
    COUNT(CASE WHEN reviews = 'Null' THEN 1 END) AS reviews_null_count
FROM mobile_data;
--delete any null rows
DELETE FROM mobile_data
WHERE name = 'Null'
   OR battery = 'Null'
   OR camera = 'Null'
   OR display = 'Null'
   OR processor = 'Null'
   OR memory = 'Null'
   OR warranty = 'Null'
   OR price = 'Null'
   OR rating = 'Null'
   OR reviews = 'Null';
--categorising battery, processor, memory, display
SELECT battery, COUNT(*) AS count
FROM mobile_data
GROUP BY battery
ORDER BY count DESC;

SELECT camera, COUNT(*) AS count
FROM mobile_data
GROUP BY camera
ORDER BY count DESC;

SELECT display, COUNT(*) AS count
FROM mobile_data
GROUP BY display
ORDER BY count DESC;

SELECT processor, COUNT(*) AS count
FROM mobile_data
GROUP BY processor
ORDER BY count DESC;

--price clusterring