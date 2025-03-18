SELECT DISTINCT city
FROM station
WHERE SUBSTR(city,1,1) NOT IN  ('a', 'e', 'i', 'o', 'u')  OR SUBSTR(CITY,-1,1) NOT IN  ('a', 'e', 'i', 'o', 'u') 


-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.