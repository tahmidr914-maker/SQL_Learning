USE store;
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
    SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
    SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
    SELECT
    o1.customer_id,
    o1.order_id AS first_order,
    o2.order_id AS second_order
FROM orders AS o1
INNER JOIN orders AS o2
    ON o1.customer_id = o2.customer_id
    AND o1.order_id < o2.order_id;
    
    SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    p.name AS product_name,
    oi.quantity,
    oi.unit_price
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN products AS p
    ON oi.product_id = p.product_id;