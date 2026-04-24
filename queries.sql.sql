-- BASIC QUESTION:
-- 1) Total customers?
SELECT count(*) FROM customers;

-- 2) Total orders?
SELECT count(*) FROM orders;

-- INTERMEDIATE QUESTIONS:
-- 1) TOTAL REVENUE?
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- 2) FIND city-wise orders?
SELECT c.city, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- 3) top selling products?
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC;

-- ADVANCED QUESTIONS:
-- 1) AVG DELIVERY TIME?
SELECT AVG(TIMESTAMPDIFF(MINUTE, order_time, delivery_time)) 
FROM orders;

-- 2) fastest delivery partner?
SELECT dp.name,
AVG(TIMESTAMPDIFF(MINUTE, o.order_time, o.delivery_time)) AS avg_time
FROM delivery_partners dp
JOIN orders o ON dp.partner_id = o.partner_id
GROUP BY dp.partner_id
ORDER BY avg_time ASC;

-- 3) Peak order hour?
SELECT HOUR(order_time), COUNT(*) 
FROM orders
GROUP BY HOUR(order_time)
ORDER BY COUNT(*) DESC;

