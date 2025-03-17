/*

Day 9 of SQL Advent Calendar
Today's Question:

A community is hosting a series of festive feasts, and they want to ensure a balanced menu. Write a query to identify the top 3 most calorie-dense dishes (calories per gram) served for each event. Include the dish_name, event_name, and the calculated calorie density in your results.

Table name: events

event_id	event_name
1	Christmas Eve Dinner
2	New Years Feast
3	Winter Solstice Potluck
Table name: menu

dish_id	dish_name	event_id	calories	weight_g
1	Roast Turkey	1	3500	5000
2	Chocolate Yule Log	1	2200	1000
3	Cheese Fondue	2	1500	800
4	Holiday Fruitcake	3	4000	1200
5	Honey Glazed Ham	2	2800	3500
Question level of difficulty:
Hard


*/


WITH cte AS (
    SELECT m.dish_name AS dish_name,
        e.event_name AS event_name,
        (m.calories/m.weight_g) AS calorie_density,
        RANK() OVER ( PARTITION BY e.event_name ORDER BY (m.calories/m.weight_g) DESC ) AS calorie_density_rank
    FROM events e
    JOIN menu m 
        ON e.event_id = m.event_id
 )

 SELECT dish_name,event_name,calorie_density FROM cte
 WHERE calorie_density_rank<=3

