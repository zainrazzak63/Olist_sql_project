use olist_ecommerce;

## payment methods 
SELECT
    payment_type,
    COUNT(*) AS transactions,
    ROUND(SUM(payment_value), 2) AS total_payment
FROM order_payments
GROUP BY payment_type
ORDER BY total_payment DESC;


## installments
SELECT
    payment_installments,
    COUNT(*) AS transactions,
    ROUND(SUM(payment_value), 2) AS total_payment
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;


## average payment
SELECT
    ROUND(AVG(payment_value), 2) AS average_payment
FROM order_payments;
