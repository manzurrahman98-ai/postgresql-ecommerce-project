--CUSTOMERS
create table customers (
customer_id serial primary key,
full_name varchar(100) not null,
email varchar(120) unique not null,
phone varchar(20),
city varchar(50),
created_at timestamp default current_timestamp
);

--CATEGORIES
create table categories (
category_id serial primary key,
category_name varchar(100) unique not null
);

--PRODUCTS
create table products (
product_id serial primary key,
product_name varchar(150) not null,
category_id int references categories(category_id),
price numeric(10,2) check (price > 0),
stock_quantity int check (stock_quantity >= 0)
);

--ORDERS
create table orders (
order_id serial primary key,
customer_id int references customers(customer_id),
order_status varchar(30),
order_date timestamp default current_timestamp
);

--ORDER ITEMS
create table order_items (
order_item_id serial primary key,
order_id int references orders(order_id) on delete cascade,
product_id int references products(product_id),
quantity int check (quantity > 0),
unit_price numeric(10,2)
);

--PAYMENTS
create table payments (
payment_id serial primary key,
order_id int references orders(order_id),
payment_method varchar(50),
payment_status varchar(30),
amount numeric(10,2),
payment_date timestamp default current_timestamp
);

--INDEXES
create index idx_orders_customer on orders(customer_id);
create index idx_order_items_product on order_items(product_id);
create index idx_orders_date on orders(order_date);

--VIEW
create view vw_total_sales as
select
   o.order_id,
   c.full_name,
   sum(oi.quantity * oi.unit_price) as total_amount
from orders o
join customers c on o.customer_id = c.customer_id
join order_items oi on o.order_id = oi.order_id
group by o.order_id, c.full_name;
