#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12c/client64/lib
sqlplus64 "dmielnik/11128927@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    recovery_email VARCHAR(100),
    date_of_birth DATE,
    user_role VARCHAR(10) CHECK( user_role in ('Customer', 'Admin')),
    password_hash VARCHAR(100)
    UNIQUE (email)
);

-- The Customers table has the following functional dependencies:
-- customer_id → customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash
-- email → customer_name, recovery_email, user_role
-- The first dependency indicates that customer_id is a superkey, which is acceptable in BCNF. 
-- However, the second dependency shows that email (which is not a superkey) determines other attributes. 
-- This violates the BCNF condition since email is not a superkey. In order to get the table into proper BCNF form
-- we must decompose the table.

-- New Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    date_of_birth DATE,
    password_hash VARCHAR(100)
);

-- Thus the FDs become:
-- customer_id → phone_number, date_of_birth, password_hash

-- Customer_Details Table
CREATE TABLE Customer_Details (
    email VARCHAR(100) PRIMARY KEY CHECK(email LIKE '%@%'),
    customer_name VARCHAR(100) NOT NULL,
    recovery_email VARCHAR(100),
    user_role VARCHAR(10) CHECK(user_role IN ('Customer', 'Admin')),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Thus the FDs become:
-- email → customer_name, recovery_email, user_role, customer_id

-- Therefore both Customers and Customer_Details tables are in BCNF as for every functional dependency (X → Y), X is a superkey.

-- Address Table
CREATE TABLE Addresses (
    address VARCHAR(100) NOT NULL,
    customer_id INT REFERENCES Customers(customer_id)
    Primary Key (customer_id)
);

-- The Address table has the following functional dependencies:
-- customer_id -> address
-- Since the only functional dependency is customer_id → address, the table is in BCNF.

-- Sellers Table
CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    rating FLOAT,
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended'))
);

-- The Sellers table contains the following functional dependencies:
-- seller_id -> seller_name, phone_number, email, rating, account_status
-- email -> seller_name, account_status
-- The first dependency indicates that seller_id is a superkey, which satisfies BCNF. 
-- However, the second dependency shows that email can determine seller_name and account_status, 
-- but email is not a superkey since it does not uniquely identify all attributes in the table.
-- Thus, the presence of the second functional dependency violates the BCNF condition. 
-- To achieve BCNF, we would need to decompose the table into two separate tables, one for seller_id and another for email, 
-- ensuring that all functional dependencies are preserved and that every determinant is a superkey.

-- New Sellers Table
CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    rating FLOAT
);

-- The FDs for the Sellers table are:
-- seller_id -> seller_name, phone_number, rating

-- Seller_Details Table
CREATE TABLE Seller_Details (
    email VARCHAR(100) PRIMARY KEY CHECK(email LIKE '%@%'),
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended')),
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Customers(seller_id)
);

-- The FDs for the Seller_Details table are:
-- email -> account_status, seller_id
-- Thus both tables are BCNF as for every functional dependency (X → Y), X is a superkey.

-- Products Table
CREATE TABLE Products (
    product_id INT UNIQUE,
    product_name VARCHAR(100) NOT NULL,
    product_description VARCHAR(1000),
    product_price FLOAT DEFAULT 0.00,
    product_weight FLOAT,
    categories VARCHAR(25),
    rating FLOAT,
    seller_id INT,
    PRIMARY KEY (product_id)
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id),
);

-- The Products table contains the following functional dependencies:
-- product_id →  seller_id, product_name, product_description, product_price, product_weight, categories, rating
-- As there is is only one functional dependency and product_id is a primary key thus a superkey, the table is BCNF.

-- Inventory Table
CREATE TABLE Inventory (
    product_id INT REFERENCES Products(product_id),
    in_stock INT DEFAULT 0,
    min_stock_level INT,
    next_delivery_date DATE,
    next_shipment_quantity INT,
    PRIMARY KEY (product_id)
);

-- The Inventory table contains the following functional dependencies:
-- product_id -> in_stock, min_stock_level, next_delivery_date, next_shipment_quantity
-- As there is is only one functional dependency and product_id is a primary key thus a superkey, the table is BCNF.

-- Order_History Table
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

-- The Order_History table contains the following functional dependencies:
-- transaction_id -> product_id, customer_id, status, order_date, order_total, payment_method, shipping_address
-- Thus, the table satisfies the requirements of BCNF, ensuring that all non-trivial functional dependencies have a superkey on the left side.

exit;
EOF
