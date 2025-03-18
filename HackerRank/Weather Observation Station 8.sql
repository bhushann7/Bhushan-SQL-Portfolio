SELECT DISTINCT city
FROM station
WHERE SUBSTR(city,1,1) IN ('a','e','i','o','u') AND SUBSTR(city,-1,1) IN ('a','e','i','o','u')


-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.