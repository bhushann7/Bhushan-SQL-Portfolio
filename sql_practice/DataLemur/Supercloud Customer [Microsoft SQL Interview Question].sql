WITH cte AS (
  SELECT cc.customer_id,
  COUNT(DISTINCT pr.product_category) AS total_categories_bought
  FROM customer_contracts cc
  LEFT JOIN products pr
  ON cc.product_id = pr.product_id
  GROUP BY cc.customer_id
)

SELECT customer_id
FROM cte
WHERE total_categories_bought = (SELECT COUNT(DISTINCT product_category) FROM products)


/*

A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.

Write a query that identifies the customer IDs of these Supercloud customers.

customer_contracts Table:

| customer_id | product_id | amount |
|-------------|------------|--------|
| 1           | 1          | 1000   |
| 1           | 3          | 2000   |
| 1           | 5          | 1500   |
| 2           | 2          | 3000   |
| 2           | 6          | 2000   |

products Table:

| product_id | product_category | product_name           |
|------------|------------------|------------------------|
| 1          | Analytics        | Azure Databricks       |
| 2          | Analytics        | Azure Stream Analytics |
| 4          | Containers       | Azure Kubernetes Service |
| 5          | Containers       | Azure Service Fabric   |
| 6          | Compute          | Virtual Machines       |
| 7          | Compute          | Azure Functions        |

Example Output:

| customer_id |
|-------------|
| 1           |

*/