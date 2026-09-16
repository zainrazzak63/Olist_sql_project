use olist_ecommerce;

-- select
select * from customers limit 10;

-- where 
select * from orders where order_status = 'delivered';

-- order by
select * from order_items order by price desc limit 10;

-- limit
select * from products limit 20;