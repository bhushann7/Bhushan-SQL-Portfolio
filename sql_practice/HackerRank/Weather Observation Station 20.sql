WITH cte AS (
    SELECT ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS rnk,
        lat_n
    FROM station
)

SELECT ROUND(lat_n,4)
FROM cte 
WHERE rnk = (SELECT ROUND(COUNT(*)/2) FROM cte)



/*

A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

*/