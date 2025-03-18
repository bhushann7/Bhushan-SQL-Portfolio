SELECT DISTINCT city
FROM station
WHERE SUBSTR(city,1,1) NOT IN  ('a', 'e', 'i', 'o', 'u')  AND SUBSTR(CITY,-1,1) NOT IN  ('a', 'e', 'i', 'o', 'u') 

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates. 