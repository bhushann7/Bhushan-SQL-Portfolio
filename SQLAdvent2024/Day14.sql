/*

Day 14 of SQL Advent Calendar
Today's Question:

Which ski resorts had snowfall greater than 50 inches?

Table name: snowfall

resort_name	location	snowfall_inches
Snowy Peaks	Colorado	60
Winter Wonderland	Utah	45
Frozen Slopes	Alaska	75
Question level of difficulty:
Easy

*/


SELECT resort_name 
FROM snowfall 
WHERE snowfall_inches > 50
