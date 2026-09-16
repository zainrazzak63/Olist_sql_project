use olist_ecommerce;

## row number

SELECT
    product_id,
    price,
    ROW_NUMBER() OVER (
        ORDER BY price DESC
    ) AS row_num
FROM order_items
LIMIT 20;


## rank
SELECT
    product_id,
    SUM(price) AS revenue,
    RANK() OVER (
        ORDER BY SUM(price) DESC
    ) AS revenue_rank
FROM order_items
GROUP BY product_id
LIMIT 20;



## lag

SELECT
    product_id,
    SUM(price) AS revenue,
    RANK() OVER (
        ORDER BY SUM(price) DESC
    ) AS revenue_rank
FROM order_items
GROUP BY product_id
LIMIT 20;


## sum over
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(
            o.order_purchase_timestamp,
            '%Y-%m'
        ) AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    SUM(revenue) OVER (
        ORDER BY month
    ) AS cumulative_revenue
FROM monthly_sales;


