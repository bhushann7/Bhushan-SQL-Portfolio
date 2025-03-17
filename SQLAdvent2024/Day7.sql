/*

Day 7 of SQL Advent Calendar
Today's Question:

The owner of a winter market wants to know which vendors have generated the highest revenue overall. For each vendor, calculate the total revenue for all their items and return a list of the top 2 vendors by total revenue. Include the vendor_name and total_revenue in your results.

Table name: vendors

vendor_id	vendor_name	market_location
1	Cozy Crafts	Downtown Square
2	Sweet Treats	Central Park
3	Winter Warmers	Downtown Square
Table name: sales

sale_id	vendor_id	item_name	quantity_sold	price_per_unit
1	1	Knitted Scarf	15	25
2	2	Hot Chocolate	50	3.5
3	3	Wool Hat	20	18
4	1	Handmade Ornament	10	15
5	2	Gingerbread Cookie	30	5
Question level of difficulty:
Medium

*/

WITH cte AS (
    SELECT v.vendor_id, v.vendor_name as vendor_name, (s.quantity_sold * s.price_per_unit) AS revenue
    FROM sales s
    JOIN vendors v
        ON s.vendor_id = v.vendor_id 
)

SELECT vendor_name, SUM(revenue) AS total_revenue
FROM cte
GROUP BY vendor_name
ORDER BY 2 DESC
LIMIT 2