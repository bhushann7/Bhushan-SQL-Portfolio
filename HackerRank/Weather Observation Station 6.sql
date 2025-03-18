SELECT DISTINCT city
FROM station 
WHERE LEFT(city,1) IN ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

