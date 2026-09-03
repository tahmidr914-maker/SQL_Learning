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
