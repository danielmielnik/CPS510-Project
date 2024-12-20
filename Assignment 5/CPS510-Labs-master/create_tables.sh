#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12c/client64/lib
sqlplus64 "dmielnik/11128927@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    recovery_email VARCHAR(100),
    address VARCHAR(100),
    date_of_birth DATE,
    user_role VARCHAR(10) CHECK( user_role in ('Customer', 'Admin')),
    password_hash VARCHAR(100)
);

-- Functional Dependencies
-- { customer_id → customer_name, phone_number, email, recovery_email, address, date_of_birth, user_role, password_hash 
--   email -> customer_name, recover_email, user_role }
-- All these attributes are specific details about a customer. Since customer_id is unique, it determines these attributes.
-- Because the email is unique it can reveal details about the customer such as customer_name, recovery_email, and user_role.


CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    rating FLOAT,
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended'))
);

-- Functional Dependencies
-- { seller_id -> seller_name, phone_number, email, rating, account_status
     email -> seller_name, account_status }
-- All these attributes are specific details about a seller. Since seller_id is unique, it determines these attributes.
-- Because the email is unique it can reveal details about the seller such as seller_name and account_status.

CREATE TABLE Products (
    product_id INT UNIQUE,
    product_name VARCHAR(100) NOT NULL,
    product_description VARCHAR(1000),
    product_price FLOAT DEFAULT 0.00,
    product_weight FLOAT,
    categories VARCHAR(25),
    rating FLOAT,
    seller_id INT REFERENCES Sellers(seller_id),
    PRIMARY KEY (product_id, seller_id)
);
-- Functional Dependencies
-- { product_id →  seller_id, product_name, product_description, product_price, product_weight, categories, rating }
-- All these attributes are specific details about a product. Since product_id is unique, it determines these attributes.

CREATE TABLE Inventory (
    product_id INT REFERENCES Products(product_id),
    in_stock INT DEFAULT 0,
    min_stock_level INT,
    next_delivery_date DATE,
    next_shipment_quantity INT,
    PRIMARY KEY (product_id)
);
-- Functional Dependencies
-- { product_id -> in_stock, min_stock_level, next_delivery_date, next_shipment_quantity }
-- All these attributes are specific details about a product. Since product_id is unique, it determines these attributes.


CREATE TABLE Order_History (
    transaction_id INT PRIMARY KEY,
    product_id INT REFERENCES Products(product_id),
    order_date DATE,
    status VARCHAR(20) CHECK( status in ('Pending', 'Shipped', 'Delivered')),
    order_total FLOAT DEFAULT 0.00,
    payment_method VARCHAR(20) CHECK( payment_method in ('Credit Card', 'Debit Card', 'PayPal', 'Gift Card')),
    shipping_address VARCHAR(100) NOT NULL,
    customer_id INT REFERENCES Customers(customer_id)
);
-- Functional Dependencies
-- { transaction_id -> product_id, customer_id, status, order_date, order_total, payment_method
--   customer_id -> shipping_address }
-- All these attributes are specific details about an order. Since transaction_id is unique, it determines these attributes.
-- Since each customer has one individual address, customer_id can reveal the shipping_address.

exit;
EOF
