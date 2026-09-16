use olist_ecommerce;

## top products
SELECT
    product_id,
    COUNT(*) AS units_sold,
    ROUND(SUM(price), 2) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;


## top categories

SELECT
    p.product_category_name,
    COUNT(oi.order_id) AS units_sold,
    ROUND(SUM(oi.price), 2) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;