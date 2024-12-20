#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12c/client64/lib
sqlplus64 "dmielnik/11128927@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

-- 3NF must satisfy 2NF and 1NF
-- 1NF Requirements:
    -- The table must have a primary key.
    -- All columns must contain atomic values, no repeating groups or arrays.
    -- All columns must contain a single value for each row.
-- 2NF Requirements:
    -- The table must first meet the requirements of 1NF.
    -- All non-key columns must be fully functionally dependent on the entire primary key, 
    -- meaning there should be no partial dependencies (i.e., no column depends only on part of the primary key).
-- 3NF Requirements:
    -- The table must first meet the requirements of 2NF.
    -- No non-key column should be transitively dependent on the primary key, 
    -- meaning that non-key columns should not depend on other non-key columns.

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

-- Customers Table 3NF Analysis:
    -- 1NF Analysis:
        -- The table contains a primary key (customer_id)
        -- Most of the columns in the Customers table contain atomic values, although the adress column can contain multiple values.
        -- We must seperate this value from the table into a new table called adresses.
        -- Thus this table does not satisfy 1NF.
    -- 2NF Analysis:
        -- Since the table does not satisfy 1NF it will not be able to satisfy 2NF.

-- Updating Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    recovery_email VARCHAR(100),
    date_of_birth DATE,
    user_role VARCHAR(10) CHECK( user_role in ('Customer', 'Admin')),
    password_hash VARCHAR(100)
);

-- Adding Addresses Table
CREATE TABLE Addresses (
    address VARCHAR(100) NOT NULL,
    customer_id INT REFERENCES Customers(customer_id)
    Primary Key (customer_id)
    );

-- New Customers Table 3NF Analysis:
    -- 1NF Analysis:
        -- The table contains a primary key (customer_id)
        -- The columns in the Customers table contain atomic values, so this table is in 1NF.
    -- 2NF Analysis:
        -- The primary key is customer_id, which is a single column, so there's no issue with partial dependency.
        -- All non-key columns (customer_name, phone_number, email, recovery_email, address, date_of_birth, user_role, and password_hash),
        -- are fully dependent on customer_id. So, this table is in 2NF.
    -- 3NF Analysis:
        -- The non-key columns in this table are not transitively dependent on the primary key (customer_id).
        -- customer_name, phone_number, email, recovery_email, address, date_of_birth, user_role, and password_hash, 
        -- all describe attributes of the customer and are directly dependent on customer_id
-- As all conditions are satisfied, we can determine that this table is in Third Normal Form (3NF)


CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    rating FLOAT,
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended'))
);

-- Sellers Table 3NF Analysis:
    -- 1NF Analysis:
        -- The Sellers table has a primary key (seller_id).
        -- All columns contain atomic values.
        -- There is no duplication of rows, and the primary key ensures uniqueness.
        -- Thus, the table meets the requirements for 1NF.
    -- 2NF Analysis:
        -- The primary key (seller_id), is a single column, so there are no partial dependencies.
        -- All non-key columns (seller_name, phone_number, email, rating, account_status) are fully dependent on the entire primary key (seller_id), meaning they depend entirely on seller_id.
        -- Thus, the table satisfies 2NF.
    -- 3NF Analysis:
        -- In the Sellers table, all non-key columns (seller_name, phone_number, email, rating, account_status),
        -- describe attributes directly related to the seller and are dependent on the primary key (seller_id).
        -- None of the non-key columns depend on other non-key columns.
        -- Thus, the table satisfies 3NF.
-- As all conditions are satisfied, we can determine that this table is in Third Normal Form (3NF)


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

-- Products Table 3NF Analysis:
    -- 1NF Analysis:
        -- The table has a composite primary key (product_id, seller_id), which ensures each row is unique.
        -- All columns contain atomic values.
        -- Thus, the table meets the requirements for 1NF.
    -- 2NF Analysis:
        -- Although this table contains a composite primary key consisting of product_id and seller_id, 
        -- there are no partial dependencies because no non-key attribute depends only on part of the composite primary key.
        -- Note: We chage the Primary Key of seller_id to a Foreign Key.
        -- All non-key columns (product_name, product_description, product_price, product_weight, categories, ratings),
        -- are fully dependent on the entire primary key (product_id), meaning they depend entirely on product_id.
        -- Thus, the table satisfies 2NF.
    -- 3NF Analysis:
        -- In the Products table, all non-key columns (product_name, product_description, product_price, product_weight, categories, ratings),
        -- describe attributes directly related to the seller and are dependent on the primary key (product_id).
        -- None of the non-key columns depend on other non-key columns.
        -- Thus, the table satisfies 3NF.
-- As all conditions are satisfied, we can determine that this table is in Third Normal Form (3NF)
-- Note: If we want to store multiple categories per product this table would not be 3NF and we would need to make a new table for Product Categories.


CREATE TABLE Inventory (
    product_id INT REFERENCES Products(product_id),
    in_stock INT DEFAULT 0,
    min_stock_level INT,
    next_delivery_date DATE,
    next_shipment_quantity INT,
    PRIMARY KEY (product_id)
);

-- Inventory Table 3NF Analysis:
    -- 1NF Analysis:
        -- The table has a primary key (product_id).
        -- All columns (in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) contain atomic values. There are no arrays or repeating groups.
        -- Each row is unique because the product_id is a primary key, ensuring no duplicates.
        -- Thus, the table meets the requirements for 1NF.
    -- 2NF Analysis:
        -- The primary key is product_id, which is a single column, so there is no composite key to worry about. This means there can't be any partial dependencies.
        -- All non-key columns (in_stock, min_stock_level, next_delivery_date, next_shipment_quantity),
        -- are fully dependent on the entire primary key (product_id), meaning they depend entirely on product_id.
        -- Thus, the table satisfies 2NF.
    -- 3NF Analysis:
        -- All non-key columns are directly dependent on the primary key (product_id). There are no transitive dependencies because no non-key column depends on another non-key column.
        -- Each non-key column describes attributes related directly to the product_id, without being indirectly influenced by other non-key columns.
        -- Thus, the table satisfies 3NF.
-- As all conditions are satisfied, we can determine that this table is in Third Normal Form (3NF)


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

-- Order_History Table 3NF Analysis:
    -- 1NF Analysis:
        -- The table has a primary key (transaction_id), which ensures uniqueness for each row.
        -- All columns contain atomic values.
        -- The table does not have any repeating groups or arrays, and each row is unique due to the transaction_id.
        -- Thus, the table meets the requirements for 1NF.
    -- 2NF Analysis:
        -- The primary key is transaction_id, which is a single column. Since the primary key is not composite, there is no partial dependencies.
        -- All non-key columns (product_id, order_date, status, order_total, payment_method, shipping_address, customer_id),
        -- are fully dependent on the entire primary key (transaction_id), meaning they depend entirely on transaction_id.
        -- Thus, the table satisfies 2NF.
    -- 3NF Analysis:
        -- Each non-key column is directly dependent on transaction_id, which is the primary key. 
        -- There are no indirect dependencies between non-key columns that could lead to transitive dependencies.
        -- Thus, the table satisfies 3NF.
-- As all conditions are satisfied, we can determine that this table is in Third Normal Form (3NF)

exit;
EOF
