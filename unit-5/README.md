# Unit 5 – HAVING, ORDER BY & Aliasing

## Objective

The objective of this unit is to practice using SQL aggregation, `HAVING`, `ORDER BY`, and column aliases to create a revenue report.

## Database

This exercise uses the `store` database.

## Task

Create a revenue report that:

- Calculates total revenue for each product.
- Uses `JOIN` to connect `order_items` with `products`.
- Uses `SUM()` to calculate revenue.
- Uses `AS` to create readable aliases.
- Uses `GROUP BY` to group the results by product.
- Uses `HAVING` to display only products whose revenue is above the average.
- Uses `ORDER BY` to sort the results from highest to lowest revenue.

## SQL Concepts Practiced

### 1. JOIN

The `order_items` and `products` tables are joined using `product_id`.

### 2. SUM()

Revenue is calculated using:

`quantity × unit_price`

and summed for each product.

### 3. GROUP BY

The results are grouped by product ID and product name.

### 4. HAVING

`HAVING` is used to filter grouped results and keep only products with revenue above the average revenue.

### 5. ORDER BY

The final results are sorted by revenue in descending order.

### 6. Aliasing

`AS` is used to give meaningful names to calculated columns and subqueries.

## SQL Files:
HAVING, ORDER BY & Aliasing.sql


## Query

```sql
USE store;

SELECT
    p.name AS category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
HAVING SUM(oi.quantity * oi.unit_price) > (
    SELECT AVG(revenue)
    FROM (
        SELECT
            SUM(quantity * unit_price) AS revenue
        FROM order_items
        GROUP BY product_id
    ) AS average_sales
)
ORDER BY revenue DESC;
