USE store;

-- 1. SUM: Calculate total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items;


-- 2. AVG: Calculate average unit price
SELECT AVG(unit_price) AS average_unit_price
FROM order_items;


-- 3. COUNT: Count total order items
SELECT COUNT(*) AS total_order_items
FROM order_items;


-- 4. MAX: Find the highest unit price
SELECT MAX(unit_price) AS highest_unit_price
FROM order_items;


-- 5. MIN: Find the lowest unit price
SELECT MIN(unit_price) AS lowest_unit_price
FROM order_items;


-- 6. GROUP BY: Calculate total quantity sold for each product
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;


-- 7. Revenue Summary: Calculate revenue for each product
SELECT
    product_id,
    SUM(quantity * unit_price) AS total_revenue
FROM order_items
GROUP BY product_id
ORDER BY total_revenue DESC;