CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, phone)
VALUES 
('Pradeep Kumar', 'pradeep@example.com', '9876543210'),
('Sneha Reddy', 'sneha@example.com', '9876543211'),
('Ravi Teja', 'ravi@example.com', '9876543212'),
('Kavya Sree', 'kavya@example.com', '9876543213');
-----------------------------------------------------------------
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, category, price, stock_quantity)
VALUES
('iPhone 13', 'Electronics', 69999.00, 20),
('Samsung Galaxy M33', 'Electronics', 17999.00, 30),
('Nike Running Shoes', 'Footwear', 4999.00, 50),
('Fastrack Watch', 'Accessories', 1999.00, 40);
--------------------------------------------------------------------------


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO orders (user_id, total_amount)
VALUES 
(1, 71998.00),
(2, 1999.00),
(3, 4999.00),
(4, 87998.00);
--------------------------------------------------------------------------------


CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_each DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity, price_each)
VALUES 
(1, 1, 1, 69999.00),  -- iPhone
(1, 4, 1, 1999.00),   -- Watch
(2, 4, 1, 1999.00),
(3, 3, 1, 4999.00),   -- Shoes
(4, 2, 2, 17999.00),  -- Samsung
(4, 1, 1, 69999.00);  -- iPhone
---------------------------------------------------------------------------------

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (order_id, payment_method, payment_status, payment_date)
VALUES 
(1, 'Credit Card', 'Paid', NOW()),
(2, 'UPI', 'Paid', NOW()),
(3, 'COD', 'Pending', NOW()),
(4, 'Credit Card', 'Paid', NOW());
