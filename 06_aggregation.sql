use olist_ecommerce;

--  count
select count(*) as total_orders from orders;

-- sum 
select round(sum(price), 2) as total_revenue from order_items;

-- avg
select round(avg(price), 2) as average_price from order_items;

-- group by
select  order_status,
        count(*) as total_orders
       from orders
       group by order_status;
       
-- having       
select customer_id,
       count(*)  as total_orders 
	from orders
    group by customer_id
    having count(*) > 1;