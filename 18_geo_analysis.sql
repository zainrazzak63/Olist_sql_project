use olist_ecommerce;

## customerrs by state
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM customers
GROUP BY customer_state
ORDER BY customers DESC;


## revenue by state

SELECT
    c.customer_state,
    ROUND(SUM(oi.price), 2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;


## sellers by state
SELECT
    seller_state,
    COUNT(*) AS sellers
FROM sellers
GROUP BY seller_state
ORDER BY sellers DESC;