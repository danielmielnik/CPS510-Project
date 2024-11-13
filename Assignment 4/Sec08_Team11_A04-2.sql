-- Display All for Each
SELECT * FROM Customers;

SELECT * FROM Sellers;

SELECT * FROM Products;

SELECT * FROM Inventory;

SELECT * FROM Order_History;

-- Views
-- Sellers | Poorly rated sellers who have been suspended
CREATE VIEW poorly_rated_suspended_sellers AS
    (SELECT seller_id, seller_name, email, rating
    FROM Sellers
    WHERE rating <= 3
    AND account_status = 'Suspended');
    
SELECT * FROM poorly_rated_suspended_sellers;

-- Products + Order_History | Numbeer of times a product has been orderd from specified seller
CREATE VIEW product_order_totals AS
    SELECT o.product_id, COUNT(o.product_id) AS total_orderd
    FROM Order_History o
    JOIN Products p ON o.product_id = p.product_id
    AND p.seller_id = '75849473'
    GROUP BY o.product_id
    ORDER BY o.product_id DESC;
    
SELECT * FROM product_order_totals;

-- Order_History | Total in shipment to each loaction
CREATE VIEW location_shipped_totals AS
    SELECT shipping_address, COUNT(shipping_address) AS total_shipped
    FROM Order_History
    WHERE status = 'Shipped'
    GROUP BY shipping_address
    ORDER BY total_shipped DESC;
    
SELECT * FROM location_shipped_totals;

-- Inventory + Products | Next product delivery date for specified seller;
CREATE VIEW next_prod_delivery AS
    SELECT p.seller_id, i.product_id, p.product_name, i.next_delivery_date, i.next_shipment_quantity
    FROM Inventory i
    JOIN Products p ON i.product_id = p.product_id
    WHERE i.next_delivery_date BETWEEN SYSDATE AND SYSDATE + 20
    AND p.seller_id = '75849473';

SELECT * FROM next_prod_delivery;

-- Inventory + Sellers | Get all inventory items that are below the minimum stock threshold
CREATE VIEW needs_restocking AS
    SELECT i.seller_id, i.product_id, s.seller_name, p.product_name, i.in_stock, i.min_stock_level
    FROM Inventory i
    JOIN Sellers s ON i.seller_id = s.seller_id
    JOIN Products p ON p.product_id = i.product_id
    WHERE i.in_stock < i.min_stock_level
    ORDER BY i.product_id ASC;
    
SELECT * FROM needs_restocking;

-- Order_History + Customers | Gets Customers who has spent the most money on orders
CREATE VIEW highest_spenders AS
    SELECT c.customer_name, total_spent
    FROM (
        SELECT customer_id AS cid, SUM(o.order_total) AS total_spent
        FROM Order_History o
        GROUP BY o.customer_id
    )
    JOIN Customers c ON cid = c.customer_id
    ORDER BY total_spent DESC;

-- Queries
-- Customers + Order_History | Total orders by customer, what customers order the most
SELECT c.customer_id, c.customer_name, COUNT(o.transaction_id) AS total_orders
FROM Customers c
JOIN Order_History o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Products + Inventory | Gets products with less than 20 in stock
SELECT p.product_id, p.product_name, i.in_stock
FROM Products p
JOIN Inventory i ON p.product_id = i.product_id
WHERE i.in_stock < 20
ORDER BY i.in_stock ASC;

-- Order_History + Products | Understand top products by month
SELECT EXTRACT(MONTH FROM o.order_date) AS month, p.product_name, COUNT(o.product_id) AS total_sold
FROM Order_History o
JOIN Products p ON o.product_id = p.product_id
GROUP BY EXTRACT(MONTH FROM o.order_date), p.product_name
ORDER BY month ASC, total_sold DESC;

-- Customers | Display all users whose roll is customer
SELECT customer_id, customer_name, email
FROM Customers
WHERE user_role = 'Customer';

-- Sellers | Display all users whose rating is greater than 4 and status is active
SELECT seller_id, seller_name, email
FROM Sellers
WHERE rating >= 4
AND account_status = 'Active';

-- Products | Display all products with a rating greater than 4 in ascending order
SELECT product_id, product_name, product_price
FROM Products
WHERE rating >= 4
ORDER BY product_price ASC;

-- Inventory + Products | Display combined inventory and products table with specified data where based on the product delivery date
SELECT p.seller_id, i.product_id, p.product_name, i.next_delivery_date, i.next_shipment_quantity
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
WHERE i.next_delivery_date BETWEEN SYSDATE AND SYSDATE + 20;

-- Order_History + Products + Customers | Display customer and seller names connected to transaction number
SELECT o.transaction_id, p.product_name, c.customer_name
FROM Order_History o
JOIN Products p ON o.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Pending'
ORDER BY o.order_date ASC;

-- Product + Order_History | Display frst five rows of product name and order total connected through product id
SELECT *
FROM (
    SELECT p.product_id, p.product_name, SUM(o.order_total) AS OrderTotal
    FROM Products p
    JOIN Order_History o ON p.product_id = o.product_id
    GROUP BY p.product_id, p.product_name
    ORDER BY OrderTotal DESC
)
WHERE ROWNUM <= 5;

-- Sellers + Products + Order_History | Display total orders pending for seller
SELECT o.product_id, COUNT(o.product_id) AS total_pending
FROM Order_History o
JOIN Products p ON o.product_id = p.product_id
WHERE o.status = 'Pending'
AND p.seller_id = '75849473'
GROUP BY o.product_id
ORDER BY total_pending DESC;

