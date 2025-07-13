

Top Selling Products:

SELECT p.name, SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_units_sold DESC;

-------------------------------------------------------------------------
Orders with User Details:


SELECT o.order_id, u.name AS customer, o.total_amount, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id;
-------------------------------------------------------------------------

SELECT p.payment_method, COUNT(*) AS count, SUM(o.total_amount) AS total_collected
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE p.payment_status = 'Paid'
GROUP BY p.payment_method;




-
