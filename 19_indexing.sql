use olist_ecommerce;

## existing indexes check
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;
SHOW INDEX FROM customers;


## useful indexex
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);
CREATE INDEX idx_order_items_order_id
ON order_items(order_id);
CREATE INDEX idx_order_items_seller_id
ON order_items(seller_id);
CREATE INDEX idx_order_items_product_id
ON order_items(product_id);


### compare performance

EXPLAIN
SELECT
    *
FROM orders
WHERE customer_id = 'some_customer_id'