-- select * from customers;
-- select * from products;
-- select * from orders;
-- select * from order_items;
-- select * from payments;


--TOP CUSTOMERS
-- select
--     c.full_name,
-- 	sum(oi.quantity * oi.unit_price) as total_spent
-- from customers c
-- join orders o on c.customer_id = o.customer_id
-- join order_items oi on  o.order_id = oi.order_id
-- group by c.full_name
-- order by total_spent desc;


--MONTHLY SALES
-- select
-- 	date_trunc('month', o.order_date) as month,
-- 	sum(oi.quantity * oi.unit_price) as revenue
-- from orders o
-- join order_items oi on o.order_id = oi.order_id
-- group by month
-- order by month;


--BEST SELLING PRODUCTS
-- select
-- 	p.product_name,
-- 	sum(oi.quantity) as total_sold
-- from product p
-- join order_items oi on p.product_id = oi.product_id
-- group by p.product_name
-- order by total_sold desc;


--UNSOLD PRODUCTS
-- select p.product_name
-- from products p
-- left join order_items oi
-- on p.product_id = oi.product_id
-- where oi.product_id is null;


--CUSTOMERS WITHOUT ORDERS
-- select c.full_name
-- from customers c
-- left join orders o
-- on c.customer_id = o.customer_id
-- where o.order_id is null;


--TOP 3 PRODUCTS (windows function)
-- select
-- 	product_name,
-- 	total_sold,
-- 	rank() over (order by total_sold desc) as rank
-- from(
-- 	select
-- 		p.product_name,
-- 		sum(oi.quantity) as total_sold
-- 	from products p
-- 	join order_items oi on p.product_id = oi.product_id
-- 	group by p.product_name
-- ) sub;


