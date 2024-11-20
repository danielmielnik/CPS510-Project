CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    date_of_birth DATE,
    password_hash VARCHAR(100)
);

CREATE TABLE Customer_Details (
    email VARCHAR(100) PRIMARY KEY CHECK(email LIKE '%@%'),
    customer_name VARCHAR(100) NOT NULL,
    recovery_email VARCHAR(100),
    user_role VARCHAR(10) CHECK(user_role IN ('Customer', 'Admin')),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Addresses (
    address VARCHAR(100) NOT NULL,
    customer_id INT REFERENCES Customers(customer_id),
    Primary Key (customer_id)
);


CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    rating FLOAT
);

CREATE TABLE Seller_Details (
    email VARCHAR(100) PRIMARY KEY CHECK(email LIKE '%@%'),
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended')),
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);


CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(100) NOT NULL,
    product_description VARCHAR(1000),
    product_price FLOAT DEFAULT 0.00,
    product_weight FLOAT,
    categories VARCHAR(25),
    rating FLOAT,
    seller_id INT,
    PRIMARY KEY (product_id),
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);

CREATE TABLE Inventory (
    product_id INT REFERENCES Products(product_id),
    in_stock INT DEFAULT 0,
    min_stock_level INT,
    next_delivery_date DATE,
    next_shipment_quantity INT,
    PRIMARY KEY (product_id)
);

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


INSERT ALL
    INTO Customers (customer_id, phone_number, date_of_birth, password_hash) 
    VALUES (1, '123-456-7890', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'hashedpassword1')
    INTO Customers (customer_id, phone_number, date_of_birth, password_hash) 
    VALUES (2, '987-654-3210', TO_DATE('1985-08-22', 'YYYY-MM-DD'), 'hashedpassword2')
    INTO Customers (customer_id, phone_number, date_of_birth, password_hash) 
    VALUES (3, '555-123-4567', TO_DATE('2000-02-10', 'YYYY-MM-DD'), 'hashedpassword3')
    INTO Customers (customer_id, phone_number, date_of_birth, password_hash) 
    VALUES (4, '444-321-7654', TO_DATE('1992-11-30', 'YYYY-MM-DD'), 'hashedpassword4')
    INTO Customers (customer_id, phone_number, date_of_birth, password_hash) 
    VALUES (5, '333-789-0123', TO_DATE('1988-06-18', 'YYYY-MM-DD'), 'hashedpassword5')
SELECT * FROM dual;


SELECT * FROM Customers;


