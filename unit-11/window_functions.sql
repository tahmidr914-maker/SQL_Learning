USE sql_store;


-- 1. ROW_NUMBER() Ranking
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


-- 2. RANK() Leaderboard
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


-- 3. Running Total
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


-- 4. PARTITION BY Customer
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