# Unit 9 — CASE Statements & Conditional Logic

## Objective

The objective of this unit was to practice SQL `CASE WHEN` statements and conditional logic.

In this unit, orders were classified into three categories based on their total value, and customers were classified into three levels based on their points.

## Database Used

```sql
USE sql_store;



The following tables were used:

orders
order_items
customers
1. Calculate Order Totals

The order_items table contains the quantity and unit price for each product in an order. The total value of each order was calculated by multiplying quantity by unit_price.

USE sql_store;

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id;

The SUM() function was used because an order can contain multiple products.

2. Classify Orders with CASE WHEN

Orders were classified into three categories based on their total value:

Less than 100 → Small
100 to less than 500 → Medium
500 or more → Large
USE sql_store;

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total,
    CASE
        WHEN SUM(quantity * unit_price) < 100 THEN 'Small'
        WHEN SUM(quantity * unit_price) < 500 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM order_items
GROUP BY order_id;

The CASE WHEN statement evaluates each order's total and assigns the appropriate size category.

3. Classify Customers with CASE WHEN

Customers were classified into three levels based on their points:

Less than 2,000 points → Bronze
2,000 to less than 3,000 points → Silver
3,000 or more points → Gold
USE sql_store;

SELECT
    customer_id,
    first_name,
    last_name,
    points,
    CASE
        WHEN points < 2000 THEN 'Bronze'
        WHEN points < 3000 THEN 'Silver'
        ELSE 'Gold'
    END AS customer_level
FROM customers;

The CASE WHEN statement evaluates each customer's points and assigns a Bronze, Silver, or Gold level.

4. Final SQL Script

The completed Unit 9 script contains both conditional classifications.

USE sql_store;

-- Classify orders as Small, Medium, or Large
SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total,
    CASE
        WHEN SUM(quantity * unit_price) < 100 THEN 'Small'
        WHEN SUM(quantity * unit_price) < 500 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM order_items
GROUP BY order_id;


-- Classify customers as Bronze, Silver, or Gold
SELECT
    customer_id,
    first_name,
    last_name,
    points,
    CASE
        WHEN points < 2000 THEN 'Bronze'
        WHEN points < 3000 THEN 'Silver'
        ELSE 'Gold'
    END AS customer_level
FROM customers;
Summary

This unit demonstrated how CASE WHEN can be used to apply conditional logic to SQL query results.

Task	Classification	Condition
Order Size	Small	Total < 100
Order Size	Medium	Total 100–499.99
Order Size	Large	Total >= 500
Customer Level	Bronze	Points < 2,000
Customer Level	Silver	Points 2,000–2,999
Customer Level	Gold	Points >= 3,000

The completed queries successfully classified both orders and customers into three categories using SQL CASE WHEN statements.


**Script filename:**

case_statements.sql
