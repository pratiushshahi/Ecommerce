-- CREATE TABLE Customers (
--     customer_id VARCHAR(255) PRIMARY KEY,
--     customer_zip_code_prefix INT,
--     customer_city VARCHAR(100),
--     customer_state VARCHAR(50)
-- );

-- CREATE TABLE OrderItems (
--     order_id VARCHAR(255),
--     product_id VARCHAR(255),
--     seller_id VARCHAR(255),
--     price DECIMAL(10, 2),
--     shipping_charges DECIMAL(10, 2),
--     PRIMARY KEY (order_id, product_id)
-- );

-- CREATE TABLE TempOrders (
--     order_id VARCHAR(255),
--     customer_id VARCHAR(255),
--     order_status ENUM('delivered','canceled','shipped','processing','invoiced','unavailable','approved') NOT NULL,
-- 	order_purchase_timestamp VARCHAR(50),
--     order_approved_at VARCHAR(50),
--     order_delivered_timestamp VARCHAR(50),
--     order_estimated_delivery_date VARCHAR(50)
-- );


-- INSERT INTO Orders (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_timestamp, order_estimated_delivery_date)
-- SELECT 
--     order_id,
--     customer_id,
--     order_status,
--     STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i'),
--     STR_TO_DATE(order_approved_at, '%d-%m-%Y %H:%i'),
--     STR_TO_DATE(order_delivered_timestamp, '%d-%m-%Y %H:%i'),
--     STR_TO_DATE(order_estimated_delivery_date, '%d-%m-%Y')
-- FROM TempOrders;

-- CREATE TABLE Payments (
--     order_id VARCHAR(255),
--     payment_sequential INT,
--     payment_type ENUM('credit_card', 'wallet', 'voucher', 'debit_card') NOT NULL,
--     payment_installments INT,
--     payment_value DECIMAL(10, 2),
--     PRIMARY KEY (order_id, payment_sequential),
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id)
-- );

-- CREATE TABLE Products (
--     product_id VARCHAR(255) PRIMARY KEY,
--     product_category_name VARCHAR(100),
--     product_weight_g INT,
--     product_length_cm INT,
--     product_height_cm INT,
--     product_width_cm INT
-- );



