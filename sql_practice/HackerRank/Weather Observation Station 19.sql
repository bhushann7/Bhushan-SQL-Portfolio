SELECT ROUND(
                 SQRT(
                    POW(MIN(lat_n)-MAX(lat_n),2)+POW(MIN(long_w)-MAX(long_w),2)
                 )
        ,4)
FROM station


/*

Consider p1(a,b) and p2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points p1 and p2 and format your answer to display  decimal digits.

*/