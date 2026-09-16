# Olist E-Commerce SQL Analysis Project

## 📌 Project Overview

This project is an end-to-end SQL data analysis project based on the Brazilian Olist E-Commerce dataset.

The goal of this project is to analyze e-commerce orders, customers, products, sellers, payments, reviews, delivery performance, and geographical information using MySQL.

The project demonstrates practical SQL skills including data loading, data cleaning, database relationships, joins, aggregations, CTEs, subqueries, window functions, time-series analysis, indexing, and business insights.

---

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- Git & GitHub
- Olist Brazilian E-Commerce Dataset

---

## 📊 Dataset

The dataset contains approximately 100,000 e-commerce orders and multiple related tables.

Main tables include:

- Customers
- Orders
- Order Items
- Order Payments
- Order Reviews
- Products
- Sellers
- Geolocation
- Product Category Translation

---

# 📁 Project Structure

```text
Olist-SQL-Project/
│
├── data/
│   ├── olist_customers_dataset.csv
│   ├── olist_geolocation_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_order_payments_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_products_dataset.csv
│   ├── olist_sellers_dataset.csv
│   └── product_category_name_translation.csv
│
├── sql/
│   ├── 01_setup.sql
│   ├── 02_load_data.sql
│   ├── 03_database_structure.sql
│   ├── 04_data_quality.sql
│   ├── 05_basic_sql.sql
│   ├── 06_aggregation.sql
│   ├── 07_joins.sql
│   ├── 08_business_analysis.sql
│   ├── 09_advanced_sql.sql
│   ├── 10_window_functions.sql
│   ├── 11_time_analysis.sql
│   ├── 12_customer_analysis.sql
│   ├── 13_product_analysis.sql
│   ├── 14_seller_analysis.sql
│   ├── 15_delivery_analysis.sql
│   ├── 16_review_analysis.sql
│   ├── 17_payment_analysis.sql
│   ├── 18_geo_analysis.sql
│   ├── 19_indexing.sql
│   └── 20_final_business_insights.sql
│
├── ER_Diagram/
│   └── olist_er_diagram.png
│
└── README.md