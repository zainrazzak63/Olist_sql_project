USE olist_ecommerce;

-- =========================================================
-- 1. CREATE TABLES
-- =========================================================

-- CUSTOMERS
CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);


-- GEOLOCATION
CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(12,8),
    geolocation_lng DECIMAL(12,8),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);


-- ORDERS
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);


-- ORDER ITEMS
CREATE TABLE IF NOT EXISTS order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);


-- ORDER PAYMENTS
CREATE TABLE IF NOT EXISTS order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);


-- ORDER REVIEWS
CREATE TABLE IF NOT EXISTS order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);


-- PRODUCTS
CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g DECIMAL(10,2),
    product_length_cm DECIMAL(10,2),
    product_height_cm DECIMAL(10,2),
    product_width_cm DECIMAL(10,2)
);


-- SELLERS
CREATE TABLE IF NOT EXISTS sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);


-- CATEGORY TRANSLATION
CREATE TABLE IF NOT EXISTS product_category_name_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);


-- =========================================================
-- 2. CLEAR CUSTOMERS TABLE
--    (because customers CSV was already imported once)
-- =========================================================

TRUNCATE TABLE customers;


-- =========================================================
-- 3. IMPORT CUSTOMERS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_customers_dataset.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 4. IMPORT GEOLOCATION
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_geolocation_dataset.csv'
INTO TABLE geolocation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 5. IMPORT ORDERS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_orders_dataset.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 6. IMPORT ORDER ITEMS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_order_items_dataset.csv'
INTO TABLE order_items
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 7. IMPORT ORDER PAYMENTS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_order_payments_dataset.csv'
INTO TABLE order_payments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 8. IMPORT ORDER REVIEWS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 9. IMPORT PRODUCTS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_products_dataset.csv'
INTO TABLE products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 10. IMPORT SELLERS
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/olist_sellers_dataset.csv'
INTO TABLE sellers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 11. IMPORT CATEGORY TRANSLATION
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/Dr.Abdul Razzaque/Documents/hello world/Olist_SQL_project/data/product_category_name_translation.csv'
INTO TABLE product_category_name_translation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================================
-- 12. CHECK ROW COUNTS
-- =========================================================

SELECT 'customers' AS table_name, COUNT(*) AS rows_count
FROM customers

UNION ALL

SELECT 'geolocation', COUNT(*)
FROM geolocation

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

SELECT 'product_category_name_translation', COUNT(*)
FROM product_category_name_translation;