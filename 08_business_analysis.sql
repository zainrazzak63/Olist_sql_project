use olist_ecommerce;

## sales

select 
      round(sum(price), 2) as total_revenue  
      from order_items;
      
## average order value 
      
select 
      round(
            sum(oi.price) /
            count(distinct oi.order_id),
              2
            )  as average_order_value
           from order_items oi; 
           
## top customers
           
select
      c.customer_unique_id,
      round(sum(oi.price), 2) as 
   total_spend
   from customers c 
   join orders o
      on c.customer_id = o.customer_id 
   join order_items oi
      on o.order_id = oi.order_id
   group by c.customer_unique_id
   order by total_spend desc
   limit 10;
   
   
## top products   
   
select
       product_id,
       round(sum(price), 2) as revenue 
    from order_items
    group by product_id
    order by revenue desc
    limit 10;
    
    
## top sellers

 select 
       seller_id,
       round(sum(price), 2) as revenue 
	from order_items
    group by seller_id
    order by revenue desc
    limit 10;
    