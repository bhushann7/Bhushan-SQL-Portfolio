SELECT EXTRACT(YEAR FROM transaction_date) AS year,
  product_id,spend AS curr_year_spend,
  LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend,
  ROUND(((spend - LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date))/LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date))*100,2) AS yoy_rate
FROM user_transactions

/*

Assume you're given a table containing information about Wayfair user transactions for different products. Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

The output should include the year in ascending order, product ID, current year's spend, previous year's spend, and year-on-year growth percentage, rounded to 2 decimal places.

user_transactions Table:

| Column Name       | Type      |
|-------------------|-----------|
| transaction_id    | integer   |
| product_id        | integer   |
| spend             | decimal   |
| transaction_date  | datetime  |

user_transactions Example Input:

| transaction_id | product_id | spend   | transaction_date      |
|----------------|------------|---------|-----------------------|
| 1341           | 123424     | 1500.60 | 12/31/2019 12:00:00   |
| 1423           | 123424     | 1000.20 | 12/31/2020 12:00:00   |
| 1623           | 123424     | 1246.44 | 12/31/2021 12:00:00   |
| 1322           | 123424     | 2145.32 | 12/31/2022 12:00:00   |

Example Output:

| year | product_id | curr_year_spend | prev_year_spend | yoy_rate |
|------|------------|-----------------|-----------------|----------|
| 2019 | 123424     | 1500.60         | NULL            | NULL     |
| 2020 | 123424     | 1000.20         | 1500.60         | -33.35   |
| 2021 | 123424     | 1246.44         | 1000.20         | 24.62    |
| 2022 | 123424     | 2145.32         | 1246.44         | 72.12    |

*/