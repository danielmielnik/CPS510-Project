CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(phone_number >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    recovery_email VARCHAR(100),
    address VARCHAR(100),
    date_of_birth DATE,
    user_role VARCHAR(10) CHECK( user_role in ('Customer', 'Admin')),
    password_hash VARCHAR(100)
);

CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10) CHECK(phone_number >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    rating FLOAT,
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended'))
);

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

CREATE TABLE Inventory (
    product_id INT REFERENCES Products(product_id),
    seller_id INT REFERENCES Sellers(seller_id),
    in_stock INT DEFAULT 0,
    min_stock_level INT,
    next_deliver_date DATE,
    next_shipment_amount INT,
    PRIMARY KEY (product_id, seller_id)
);

CREATE TABLE Order_History (
    transaction_id INT UNIQUE,
    product_id INT REFERENCES Products(product_id),
    order_date DATE,
    status VARCHAR(20) CHECK( status in ('Order Proccessed', 'Shipped', 'Delivered')),
    order_total FLOAT DEFAULT 0.00,
    payment_method VARCHAR(20) CHECK( payment_method in ('Credit Card', 'Debit Card', 'PayPal', 'Gift Card')),
    shipping_address VARCHAR(100) NOT NULL,
    customer_id INT REFERENCES Customers(customer_id),
    PRIMARY KEY (transaction_id, customer_id, product_id)
);