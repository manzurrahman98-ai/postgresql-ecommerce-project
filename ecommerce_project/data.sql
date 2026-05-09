--CATEGORIES
insert into categories (category_name) values
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books'),
('Sports');

--CUSTOMERS
insert into customers (full_name, email, phone, city) values
('Rahim Uddin', 'rahim@gmail.com', '01710000001', 'Dhaka'),
('Karim Ahmed', 'karim@gmail.com', '01700000002', 'Chattogram'),
('Sadia Islam', 'sadia@gmail.com', '01710000003', 'Khulna'),
('Nusrat Jahan', 'nusrat@gmail.com', '01710000004', 'Sylhet'),
('Tanvir Hossain', 'tanvir@gmail.com', '01710000005', 'Rajshahi');

--PRODUCTS
insert into products(product_name, category_id, price, stock_quantity) values
('Laptop', 1, 75000, 10),
('Smartphone', 1, 30000, 25),
('T-Shirt', 2, 500, 100),
('Blender', 3, 2500, 20),
('Cricket Bat', 5, 2000, 40);

--ORDERS
insert into orders(customer_id, order_status) values
(1, 'Completed'),
(2, 'Pending'),
(3, 'Completed'),
(4, 'Completed'),
(5, 'Cancelled');

--ORDER ITEMS
insert into order_items (order_id, product_id, quantity, unit_price) values
(1, 1, 1, 75000),
(1, 3, 2, 500),
(2, 2, 1, 30000),
(3, 4, 1, 2500),
(4, 5, 1, 2000);

--PAYMENTS
insert into payments (order_id, payment_method, payment_status, amount) values
(1,'Card', 'Paid', 76000),
(2,'Cash', 'Pending', 30000),
(3,'Bkash', 'Paid', 2500),
(4,'Card', 'Paid', 2000),
(5,'Cash', 'Cancelled', 0);
