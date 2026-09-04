# Unit 10 — Subqueries & CTEs

## Objective

The objective of this unit was to practice **SQL subqueries** and **Common Table Expressions (CTEs)**.

In this unit, customer spending was analyzed using aggregate functions and subqueries, products that had never been ordered were identified, and a reusable CTE was created to simplify customer spending analysis.

## Database Used

```sql
USE sql_store;

## Tables Used
customers
orders
order_items
products
1. Find Customers Spending Above Average

The first task was to calculate the total amount spent by each customer and identify customers whose spending was above the average customer spending.

The total spending was calculated using:

SUM(quantity * unit_price)

An aggregate subquery was then used to calculate the average spending.

SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING SUM(oi.quantity * oi.unit_price) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            o2.customer_id,
            SUM(oi2.quantity * oi2.unit_price) AS customer_total
        FROM orders o2
        JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        GROUP BY o2.customer_id
    ) AS customer_spending
);
Concepts Practiced
Aggregate functions
SUM()
AVG()
JOIN
GROUP BY
Subqueries
Comparing results against an aggregate value
2. Find Products That Were Never Ordered

The second task was to identify products that do not appear in the order_items table.

A subquery was used with NOT IN to compare the products in the products table against products that had been ordered.

SELECT
    product_id,
    name
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);

The inner query returns the IDs of products that have been ordered.

The outer query then returns products whose IDs are not included in that list.

Concepts Practiced
Subqueries inside WHERE
NOT IN
Filtering data
Comparing data between tables
3. Create a Reusable CTE

A Common Table Expression (CTE) was created to calculate the total spending for each customer.

The CTE was named customer_spending.

WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    total_spent
FROM customer_spending
ORDER BY total_spent DESC;

The CTE makes the customer spending calculation easier to read and allows the result to be reused by the main query.

4. Use the CTE to Find Above-Average Customers

The CTE was then reused to find customers whose spending was greater than the average spending of all customers.

WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    total_spent
FROM customer_spending
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_spending
)
ORDER BY total_spent DESC;

This approach is more readable because the customer spending calculation only needs to be defined once in the CTE.

5. Final SQL Script

The completed Unit 10 exercises include the following concepts:

USE sql_store;


-- Customers spending above average
SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING SUM(oi.quantity * oi.unit_price) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            o2.customer_id,
            SUM(oi2.quantity * oi2.unit_price) AS customer_total
        FROM orders o2
        JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        GROUP BY o2.customer_id
    ) AS customer_spending
);


-- Products that were never ordered
SELECT
    product_id,
    name
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);


-- Reusable CTE for customer spending
WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    total_spent
FROM customer_spending
ORDER BY total_spent DESC;


-- Customers spending above average using a CTE
WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    total_spent
FROM customer_spending
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_spending
)
ORDER BY total_spent DESC;
Summary
Task	SQL Concept	Purpose
Above-average customers	Aggregate Subquery	Find customers spending more than average
Never-ordered products	NOT IN Subquery	Find products with no orders
Customer spending	CTE	Create a reusable spending calculation
Above-average customers using CTE	CTE + Subquery	Reuse calculated results efficiently
Skills Practiced
SQL Subqueries
Subqueries inside WHERE
Aggregate subqueries
Common Table Expressions (WITH)
SUM()
AVG()
JOIN
GROUP BY
HAVING
ORDER BY
NOT IN
Data filtering
Query readability and reusability

SQL Script

The completed SQL script for this unit is:

subqueries_ctes.sql
