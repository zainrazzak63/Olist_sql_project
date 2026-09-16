USE olist_ecommerce;

-- =========================================================
-- STEP 1: REMOVE EXISTING FOREIGN KEYS / INDEXES
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE orders DROP FOREIGN KEY  fk_orders_customer;
ALTER TABLE order_items DROP FOREIGN KEY  fk_items_order;
ALTER TABLE order_items DROP FOREIGN KEY  fk_items_product;
ALTER TABLE order_items DROP FOREIGN KEY  fk_items_seller;
ALTER TABLE order_payments DROP FOREIGN KEY  fk_payments_order;
ALTER TABLE order_reviews DROP FOREIGN KEY  fk_reviews_order;

SET FOREIGN_KEY_CHECKS = 1;


-- =========================================================
-- STEP 2: REMOVE EXISTING PRIMARY KEYS
-- =========================================================

ALTER TABLE customers DROP PRIMARY KEY;
ALTER TABLE orders DROP PRIMARY KEY;
ALTER TABLE products DROP PRIMARY KEY;
ALTER TABLE sellers DROP PRIMARY KEY;
ALTER TABLE order_items DROP PRIMARY KEY;




-- =========================================================
-- STEP 4: FIX INVALID ZERO DATES
-- =========================================================

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_approved_at = NULL
WHERE YEAR(order_approved_at) = 0;

UPDATE orders
SET order_delivered_carrier_date = NULL
WHERE YEAR(order_delivered_carrier_date) = 0;

UPDATE orders
SET order_delivered_customer_date = NULL
WHERE YEAR(order_delivered_customer_date) = 0;

UPDATE orders
SET order_purchase_timestamp = NULL
WHERE YEAR(order_purchase_timestamp) = 0;

UPDATE orders
SET order_estimated_delivery_date = NULL
WHERE YEAR(order_estimated_delivery_date) = 0;


-- =========================================================
-- STEP 5: FIX KEY COLUMN TYPES
-- =========================================================

ALTER TABLE customers
MODIFY customer_id VARCHAR(50) NOT NULL;

ALTER TABLE customers
MODIFY customer_unique_id VARCHAR(50) NOT NULL;


ALTER TABLE orders
MODIFY order_id VARCHAR(50) NOT NULL;

ALTER TABLE orders
MODIFY customer_id VARCHAR(50) NOT NULL;


ALTER TABLE order_items
MODIFY order_id VARCHAR(50) NOT NULL;

ALTER TABLE order_items
MODIFY order_item_id INT NOT NULL;

ALTER TABLE order_items
MODIFY product_id VARCHAR(50) NOT NULL;

ALTER TABLE order_items
MODIFY seller_id VARCHAR(50) NOT NULL;


ALTER TABLE order_payments
MODIFY order_id VARCHAR(50) NOT NULL;


ALTER TABLE order_reviews
MODIFY order_id VARCHAR(50) NOT NULL;


ALTER TABLE products
MODIFY product_id VARCHAR(50) NOT NULL;


ALTER TABLE sellers
MODIFY seller_id VARCHAR(50) NOT NULL;


-- =========================================================
-- STEP 6: PRIMARY KEYS
-- =========================================================


ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE products
ADD PRIMARY KEY (product_id);

ALTER TABLE sellers
ADD PRIMARY KEY (seller_id);


-- order_items has multiple items per order
ALTER TABLE order_items
ADD PRIMARY KEY (order_id, order_item_id);

-- order_reviews.review_id has duplicates,
-- so create a unique technical key instead
ALTER TABLE order_reviews
ADD COLUMN review_pk INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;


-- =========================================================
-- STEP 7: FOREIGN KEYS
-- =========================================================

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);


ALTER TABLE order_items
ADD CONSTRAINT fk_items_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


ALTER TABLE order_items
ADD CONSTRAINT fk_items_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);


ALTER TABLE order_items
ADD CONSTRAINT fk_items_seller
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);


ALTER TABLE order_payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


ALTER TABLE order_reviews
ADD CONSTRAINT fk_reviews_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-- =========================================================
-- STEP 8: USEFUL INDEXES
-- =========================================================

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_order_items_product_id
ON order_items(product_id);

CREATE INDEX idx_order_items_seller_id
ON order_items(seller_id);

CREATE INDEX idx_order_reviews_order_id
ON order_reviews(order_id);

CREATE INDEX idx_payment_order_id
ON order_payments(order_id);


-- =========================================================
-- STEP 9: VERIFY PRIMARY KEYS
-- =========================================================

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'olist_ecommerce'
AND CONSTRAINT_NAME = 'PRIMARY'
ORDER BY TABLE_NAME;


-- =========================================================
-- STEP 10: VERIFY FOREIGN KEYS
-- =========================================================

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'olist_ecommerce'
AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;


-- =========================================================
-- STEP 11: FINAL TABLE CHECK
-- =========================================================

SHOW TABLES;


-- =========================================================
-- STEP 12: FINAL ROW COUNTS
-- =========================================================

SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers

UNION ALL

SELECT 'orders', COUNT(*)
FROM orders

UNION ALL

SELECT 'order_items', COUNT(*)
FROM order_items

UNION ALL

SELECT 'order_payments', COUNT(*)
FROM order_payments

UNION ALL

SELECT 'order_reviews', COUNT(*)
FROM order_reviews

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'sellers', COUNT(*)
FROM sellers

UNION ALL

SELECT 'geolocation', COUNT(*)
FROM geolocation

UNION ALL

SELECT 'product_category_name_translation', COUNT(*)
FROM product_category_name_translation;