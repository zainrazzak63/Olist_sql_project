use olist_ecommerce;

-- inner join
select
      o.order_id,
      c.customer_unique_id,
      o.order_status
  from orders o
  inner join customers c
	   on o.customer_id = c.customer_id
      limit 20; 
      
      
      -- left join
select 
      p.product_id,
      p.product_category_name,
      oi.order_id
from products p
left join order_items oi
      on p.product_id = oi.product_id
      limit 20;
      
      
-- multiple join
select 
      o.order_id,
      c.customer_unique_id,
      oi.product_id,
      oi.price
from orders o
join customers c 
     on o.customer_id
join order_items oi
      on o.order_id = oi.order_id
limit 20;      
      
      
      
      
      
      
      
      
      