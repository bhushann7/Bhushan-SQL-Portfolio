SELECT DISTINCT city
FROM station
WHERE RIGHT(city,1) IN ('a','e','i','o','u')
--WHERE SUBSTR(city,-1,1) IN ('a','e','i','o','u');

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.