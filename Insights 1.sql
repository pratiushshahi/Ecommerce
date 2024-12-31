-- 1. Which cities have the most customers ?

-- Select customer_city, count(customer_city) from customers
-- group by customer_city
-- order by count(customer_city) desc
-- limit 5;




-- 2. Which state contribute the most revenue ?

-- Select customer_state, sum(p.payment_value) as revenue from customers as c
-- inner join orders as o on c.customer_id = o.customer_id
-- inner join payments as p on p.order_id = o.order_id
-- group by c.customer_state
-- order by 2 desc
-- limit 5;




-- 3. Which customers have placed the most orders ?

-- Select o.customer_id, count(o.order_id) from orders as o
-- group by o.customer_id
-- order by count(o.order_id) desc
-- limit 5;

-- no repeat buyers





-- 4. What percentage of customers are repeat buyers?
-- No repeat buyers so 0 %





-- 5. What is the total number of orders over time (weekly, yearly) ?

-- Select 
-- 	year(order_purchase_timestamp) as year, 
--     week(order_purchase_timestamp) as week, 
--     count(*) as total_orders
-- from orders
-- group by 1, 2
-- order by 1, 2;




-- 6. What is the trend in delivered vs. canceled orders (weekly, monthly)?

-- Select 
-- 	year(order_purchase_timestamp) as year,
--     week(order_purchase_timestamp) as week,
--     sum(case when order_status = 'delivered' then 1 else 0 end) as delivered_orders,
--     sum(case when order_status = 'canceled' then 1 else 0 end) as canceled_orders
-- from orders
-- group by 1, 2
-- order by 1, 2;


-- Select 
-- 	year(order_purchase_timestamp) as year,
--     month(order_purchase_timestamp) as month,
--     sum(case when order_status = 'delivered' then 1 else 0 end) as delivered_orders,
--     sum(case when order_status = 'canceled' then 1 else 0 end) as canceled_orders
-- from orders
-- group by 1, 2
-- order by 1, 2;




-- 7. What is the average delievery time (actual vs estimated) ?

-- Select Avg(Datediff(order_delivered_timestamp, order_purchase_timestamp)) as Avg_delivery_actual
-- from orders
-- where order_delivered_timestamp IS NOT null;

-- Select Avg(Datediff(order_estimated_delivery_date, order_purchase_timestamp)) as Avg_delivery_estimated
-- from orders
-- where order_estimated_delivery_date IS NOT null;




-- 8. How many orders are in each status ?

-- Select order_status, count(*) as count from orders
-- group by 1;




-- 9. What percentage of orders get delayed beyound the estimated delivery date ?

-- Select 
-- 	(sum(
-- 		case when order_delivered_timestamp > order_estimated_delivery_date then 1 else 0 end
--         )*100 / count(*)) as delayed_order_percentage
-- from orders
-- where order_estimated_delivery_date is not null and order_delivered_timestamp is not null;




-- 10. Which are top 10 most expensive orders ?

-- Select order_id, sum(payment_value) as order_price from payments
-- group by order_id
-- order by payment_value desc
-- limit 10;




-- 11. What is the average order value?

-- SELECT avg(payment_value) as avg_order_val
-- from payments;




-- 12. Which products are sold the most ?

-- Select o.product_id, count(o.product_id) as count from orderitems as o
-- inner join products as p on o.product_id = p.product_id
-- group by 1
-- order by 2 desc
-- limit 10;




-- 13. What is average weight and size (length, height, width) of products sold?

-- SELECT 
-- 	avg(product_weight_g) as average_weight_in_g,
--     avg(product_length_cm) as average_length_in_cm,
--     avg(product_height_cm) as avergae_height_in_cm,
--     avg(product_width_cm) as average_width_in_cm
-- FROM products;




-- 14. Are there any products with zero sales? 

-- SELECT product_id from products
-- where product_id not in (Select distinct product_id from orderitems);




-- 15. What are the most popular payment methods?

-- SELECT payment_type, count(*) as count from payments
-- group by 1
-- order by 2 desc;




-- 16. What is average number of installments used for payments?

-- Select avg(payment_installments) as avg_no_installments from payments;




-- 17. How much revenue is generated from each payment type ?

-- Select payment_type, sum(payment_value) as revenue from payments
-- group by 1
-- order by 2 desc; 





-- 18. Which products or categories have the highest shipping costs?

-- Select product_id, max(shipping_charges) as shipping_charges from orderitems
-- group by 1
-- order by 2 desc
-- limit 10;

-- Select p.product_category_name, max(o.shipping_charges) as shipping_charges 
-- from orderitems as o
-- inner join products as p on o.product_id = p.product_id
-- group by 1
-- order by 2 desc
-- limit 10;




-- 19. What is the average shipping charge per order ?

-- Select order_id, avg(shipping_charges) as avg_shipping_charge
-- from orderitems
-- group by 1
-- order by 2 desc;




-- 20. Which regions face the most delivery delays ?

-- SELECT 
-- 	c.customer_state, count(*) as count
-- from orders as o
-- inner join customers as c on o.customer_id = c.customer_id
-- where o.order_delivered_timestamp > o.order_estimated_delivery_date
-- group by 1
-- order by 2 desc;




-- 21. What is the relationship between shipping cost and delivery speed ?

-- Select oi.order_id, oi.product_id, oi.shipping_charges, avg(Datediff(o.order_delivered_timestamp, o.order_purchase_timestamp)) as average_delay
-- from orderitems as oi
-- inner join orders as o on o.order_id = oi.order_id
-- where o.order_delivered_timestamp is not null
-- group by 1
-- order by 3 desc, 4 desc;




-- 22. What is the total revenue by month, year, or quarter?

-- Select 
-- year(o.order_purchase_timestamp)as year, sum(p.payment_value) as revenue
-- from payments as p
-- inner join orders as o on p.order_id = o.order_id
-- group by 1
-- order by 1;

-- Select 
-- month(o.order_purchase_timestamp) as month, sum(p.payment_value) as revenue
-- from payments as p
-- inner join orders as o on p.order_id = o.order_id
-- group by 1
-- order by 1;

-- Select 
-- quarter(o.order_purchase_timestamp) as quarter, sum(p.payment_value) as revenue
-- from payments as p
-- inner join orders as o on p.order_id = o.order_id
-- group by 1
-- order by 1;




-- 23. Which time of the year sees highest sales?

-- Select 
-- year(o.order_purchase_timestamp)as year, sum(p.payment_value) as revenue
-- from payments as p
-- inner join orders as o on p.order_id = o.order_id
-- group by 1
-- order by 2 desc
-- limit 1;



