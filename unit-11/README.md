# Unit 11 — Window Functions & Advanced Analytics

## Objective

The objective of this unit was to practice SQL window functions for ranking, cumulative calculations, and partitioned analysis.

The main concepts practiced were `ROW_NUMBER()`, `RANK()`, running totals using `SUM() OVER()`, and `PARTITION BY`.

## Database Used

```sql
USE sql_store;

Tables Used
orders
order_items

1. ROW_NUMBER() Ranking

ROW_NUMBER() was used to assign a unique sequential number to each order item based on its total value.

The highest-value item receives row number 1.

SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total,
    ROW_NUMBER() OVER (
        ORDER BY quantity * unit_price DESC
    ) AS row_num
FROM order_items;

The quantity * unit_price calculation determines the value of each order item.

The ROW_NUMBER() window function then ranks the rows from the highest item value to the lowest.

2. RANK() Leaderboard

RANK() was used to create a leaderboard based on the total value of each order item.

SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total,
    RANK() OVER (
        ORDER BY quantity * unit_price DESC
    ) AS item_rank
FROM order_items;

Unlike ROW_NUMBER(), RANK() gives the same rank to rows with equal values.

For example:

Item Total	Rank
500	1
500	1
400	3

This makes RANK() useful for leaderboard-style analysis where tied values should receive the same position.

3. Running Total

A running total was created using SUM() OVER().

SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total,
    SUM(quantity * unit_price) OVER (
        ORDER BY order_id
    ) AS running_total
FROM order_items;

The running_total column continuously adds each item's value to the previous total.

For example:

Item Total	Running Total
100	100
250	350
150	500
300	800

This demonstrates how window functions can perform cumulative calculations without using GROUP BY.

4. PARTITION BY

PARTITION BY was used to calculate a separate running total for each customer.

Because customer_id is stored in the orders table rather than the order_items table, the two tables were joined using order_id.

SELECT
    o.customer_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS item_total,
    SUM(oi.quantity * oi.unit_price) OVER (
        PARTITION BY o.customer_id
        ORDER BY oi.order_id
    ) AS customer_running_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

PARTITION BY o.customer_id separates the calculation by customer.

The running total therefore starts again for each customer instead of calculating one total across all customers.

5. Final Unit 11 Script

The completed Unit 11 script combines all four required window-function exercises.

USE sql_store;


-- ROW_NUMBER() Ranking
SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total,
    ROW_NUMBER() OVER (
        ORDER BY quantity * unit_price DESC
    ) AS row_num
FROM order_items;


-- RANK() Leaderboard
SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total,
    RANK() OVER (
        ORDER BY quantity * unit_price DESC
    ) AS item_rank
FROM order_items;


-- Running Total
SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total,
    SUM(quantity * unit_price) OVER (
        ORDER BY order_id
    ) AS running_total
FROM order_items;


-- PARTITION BY Customer
SELECT
    o.customer_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS item_total,
    SUM(oi.quantity * oi.unit_price) OVER (
        PARTITION BY o.customer_id
        ORDER BY oi.order_id
    ) AS customer_running_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;
Summary

This unit demonstrated how window functions can be used for advanced SQL analytics without collapsing the result set into grouped rows.

Technique	Purpose
ROW_NUMBER()	Assigns a unique sequential number to each row
RANK()	Creates rankings while allowing ties
SUM() OVER()	Calculates running or cumulative totals
PARTITION BY	Performs calculations separately within groups
ORDER BY inside OVER()	Controls the order used by the window calculation
JOIN	Connects customer information from orders with order-item data
Skills Practiced
SQL window functions
ROW_NUMBER()
RANK()
SUM() OVER()
PARTITION BY
Window ORDER BY
Running totals
Ranking and leaderboard analysis
Joining related tables
Advanced analytical SQL

SQL Script

The completed SQL script for this unit is:

window_functions.sql
