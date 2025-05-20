-- SQL Schema: E-Commerce Customer and Sales Analysis

-- Create Tables
-- 1. Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

-- 2. Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- 3. Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Data Inserts
-- Customers
INSERT INTO customers (customer_id, name, email, city, state, signup_date) VALUES
(1, 'Customer1', 'alice@example.com', 'New York', 'NY', '2021-01-15'),
(2, 'Customer2', 'bob@example.com', 'Los Angeles', 'CA', '2021-02-20'),
(3, 'Customer3', 'carol@example.com', 'Chicago', 'IL', '2021-03-10'),
(4, 'Customer4', 'customer4@example.com', 'Seattle', 'FL', '2021-10-14'),
(5, 'Customer5', 'customer5@example.com', 'Denver', 'AZ', '2021-05-17'),
(6, 'Customer6', 'customer6@example.com', 'Seattle', 'WA', '2021-12-17'),
(7, 'Customer7', 'customer7@example.com', 'Austin', 'TX', '2021-12-02'),
(8, 'Customer8', 'customer8@example.com', 'Denver', 'CO', '2021-04-24'),
(9, 'Customer9', 'customer9@example.com', 'Phoenix', 'AZ', '2021-06-30'),
(10, 'Customer10', 'customer10@example.com', 'Phoenix', 'AZ', '2021-12-23'),
(11, 'Customer11', 'customer11@example.com', 'Phoenix', 'TX', '2021-11-28'),
(12, 'Customer12', 'customer12@example.com', 'Seattle', 'FL', '2021-10-14'),
(13, 'Customer13', 'customer13@example.com', 'Miami', 'WA', '2021-10-30'),
(14, 'Customer14', 'customer14@example.com', 'Seattle', 'CO', '2021-03-06'),
(15, 'Customer15', 'customer15@example.com', 'Austin', 'WA', '2021-01-21'),
(16, 'Customer16', 'customer16@example.com', 'Denver', 'CO', '2021-04-09'),
(17, 'Customer17', 'customer17@example.com', 'Phoenix', 'AZ', '2021-10-20'),
(18, 'Customer18', 'customer18@example.com', 'Miami', 'FL', '2021-10-21'),
(19, 'Customer19', 'customer19@example.com', 'Miami', 'AZ', '2021-05-11'),
(20, 'Customer20', 'customer20@example.com', 'Denver', 'AZ', '2021-02-20');

-- Products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99),
(2, 'Bluetooth Headphones', 'Electronics', 49.99),
(3, 'Coffee Maker', 'Home Appliances', 89.99),
(4, 'USB Cable', 'Electronics', 9.99),
(5, 'Laptop Stand', 'Electronics', 29.99),
(6, 'Desk Lamp', 'Home Appliances', 19.99),
(7, 'Water Bottle', 'Fitness', 14.99),
(8, 'Yoga Mat', 'Fitness', 24.99),
(9, 'Backpack', 'Accessories', 39.99),
(10, 'Notebook', 'Stationery', 3.99),
(11, 'Pen Set', 'Stationery', 5.49);

-- Orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2021-04-01', 75.98),
(2, 2, '2021-04-03', 89.99),
(3, 1, '2021-04-10', 25.99),
(4, 16, '2021-06-14', 164.96),
(5, 14, '2021-10-12', 77.97),
(6, 20, '2021-09-16', 7.98),
(7, 16, '2021-02-14', 65.96),
(8, 12, '2022-01-01', 79.97),
(9, 20, '2021-06-28', 32.97),
(10, 17, '2021-11-19', 49.99),
(11, 7, '2021-10-10', 227.94),
(12, 1, '2021-01-01', 19.99),
(13, 4, '2021-07-26', 64.96),
(14, 11, '2021-06-24', 7.98),
(15, 17, '2021-01-22', 117.95),
(16, 13, '2021-01-29', 29.98),
(17, 5, '2021-05-07', 14.99),
(18, 8, '2021-03-31', 94.96),
(19, 17, '2021-07-07', 377.91),
(20, 9, '2021-01-13', 209.93),
(21, 19, '2021-11-12', 169.95),
(22, 14, '2021-06-13', 164.95),
(23, 6, '2021-02-15', 159.95),
(24, 4, '2021-02-05', 49.98),
(25, 12, '2021-07-05', 7.98),
(26, 19, '2021-11-21', 224.95),
(27, 15, '2021-09-27', 74.97),
(28, 12, '2021-02-19', 271.93),
(29, 8, '2021-05-03', 51.98),
(30, 6, '2021-03-18', 95.96),
(31, 11, '2021-09-22', 59.97),
(32, 14, '2021-10-22', 134.96),
(33, 10, '2021-05-09', 197.94);

-- Order Items
INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 2, 25.99),
(2, 2, 3, 1, 89.99),
(3, 3, 1, 1, 25.99),
(4, 4, 7, 1, 14.99),
(5, 4, 2, 3, 49.99),
(6, 5, 1, 3, 25.99),
(7, 6, 10, 2, 3.99),
(8, 7, 4, 1, 9.99),
(9, 7, 10, 1, 3.99),
(10, 7, 1, 2, 25.99),
(11, 8, 2, 1, 49.99),
(12, 8, 7, 2, 14.99),
(13, 9, 8, 1, 24.99),
(14, 9, 10, 2, 3.99),
(15, 10, 2, 1, 49.99),
(16, 11, 1, 3, 25.99),
(17, 11, 2, 3, 49.99),
(18, 12, 6, 1, 19.99),
(19, 13, 7, 1, 14.99),
(20, 13, 4, 2, 9.99),
(21, 13, 5, 1, 29.99),
(22, 14, 10, 2, 3.99),
(23, 15, 5, 2, 29.99),
(24, 15, 10, 2, 3.99),
(25, 15, 2, 1, 49.99),
(26, 16, 7, 2, 14.99),
(27, 17, 7, 1, 14.99),
(28, 18, 4, 2, 9.99),
(29, 18, 8, 1, 24.99),
(30, 18, 2, 1, 49.99),
(31, 19, 4, 3, 9.99),
(32, 19, 1, 3, 25.99),
(33, 19, 3, 3, 89.99),
(34, 20, 6, 2, 19.99),
(35, 20, 5, 3, 29.99),
(36, 20, 9, 2, 39.99),
(37, 21, 9, 1, 39.99),
(38, 21, 7, 2, 14.99),
(39, 21, 2, 2, 49.99),
(40, 22, 5, 2, 29.99),
(41, 22, 9, 2, 39.99),
(42, 22, 8, 1, 24.99),
(43, 23, 5, 2, 29.99),
(44, 23, 6, 1, 19.99),
(45, 23, 9, 2, 39.99),
(46, 24, 8, 2, 24.99),
(47, 25, 10, 2, 3.99),
(48, 26, 7, 1, 14.99),
(49, 26, 9, 3, 39.99),
(50, 26, 3, 1, 89.99),
(51, 27, 5, 2, 29.99),
(52, 27, 7, 1, 14.99),
(53, 28, 1, 2, 25.99),
(54, 28, 9, 3, 39.99),
(55, 28, 2, 2, 49.99),
(56, 29, 1, 2, 25.99),
(57, 30, 4, 1, 9.99),
(58, 30, 5, 2, 29.99),
(59, 30, 1, 1, 25.99),
(60, 31, 6, 3, 19.99),
(61, 32, 8, 1, 24.99),
(62, 32, 4, 2, 9.99),
(63, 32, 3, 1, 89.99),
(64, 33, 9, 3, 39.99),
(65, 33, 1, 3, 25.99);

-- Queries for Analysis
-- Top-Selling Products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Repeat Customers
SELECT customer_id, COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1;

-- Average Order Value by State
SELECT c.state, AVG(o.total_amount) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.state
ORDER BY avg_order_value DESC;

-- Customer Lifetime Value
SELECT c.customer_id, c.name, SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value DESC
LIMIT 10;
