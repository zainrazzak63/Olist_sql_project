use olist_ecommerce;

-- customer duplicates
select 
     customer_unique_id,
     COUNT(*) AS occurrences 
from customers
group by customer_unique_id having count(*) >1;


-- missing order dates 
select 
      count(*) as total_orders,
      sum(order_purchase_timestamp is null) as missing_purchase,
      sum(order_delivered_customer_date is null) as missing_delivery
      from orders;
      
-- missing product data 
select 
     count(*) as total_products,
     sum(product_category_name is null) as missing_category,
     sum(product_weight_g is null) as missing_weight 
     from products;
     
     
-- invalid delivery dates
select * from orders where order_delivered_customer_date < order_purchase_timestamp;

-- incalid price 
select * from order_items where price < 0
                or freight_value < 0;     
     
      