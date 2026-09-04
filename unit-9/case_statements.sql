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