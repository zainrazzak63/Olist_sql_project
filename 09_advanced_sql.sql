use olist_ecommerce;

## cte customer spending

WITH customer_sales AS (
    SELECT
        c.customer_unique_id,
        SUM(oi.price) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,
    ROUND(total_spent, 2) AS total_spent
FROM customer_sales
ORDER BY total_spent DESC
LIMIT 10;




## subquery -- above average products

SELECT
    product_id,
    revenue
FROM (
    SELECT
        product_id,
        SUM(price) AS revenue
    FROM order_items
    GROUP BY product_id
) AS product_sales
WHERE revenue > (
    SELECT AVG(revenue)
    FROM (
        SELECT
            product_id,
            SUM(price) AS revenue
        FROM order_items
        GROUP BY product_id
    ) AS avg_sales
);
