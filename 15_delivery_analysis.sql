use olist_ecommerce;

## average delivery time
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


## last order

SELECT
    COUNT(*) AS late_orders
FROM orders
WHERE order_delivered_customer_date >
      order_estimated_delivery_date;
      
      
      
## last delivery percentage

SELECT
    ROUND(
        100.0 *
        SUM(
            order_delivered_customer_date >
            order_estimated_delivery_date
        ) / COUNT(*),
        2
    ) AS late_delivery_percentage
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;      