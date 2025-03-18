SELECT ROUND(SUM(lat_n),4) as sum_lat_n
FROM station
WHERE lat_n BETWEEN 38.7881 AND 137.2344


/*

Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7881 and less than 137.2345. Truncate your answer to 4 decimal places.

*/