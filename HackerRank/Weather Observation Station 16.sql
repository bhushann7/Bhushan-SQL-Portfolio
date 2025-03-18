
SELECT ROUND(MIN(lat_n),4) AS lat_n
FROM station
WHERE lat_n > 38.7780
ORDER BY lat_n 
LIMIT 1

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

