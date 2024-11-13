-- Display All for Each
SELECT * FROM Customers;

SELECT * FROM Sellers;

SELECT * FROM Products;

SELECT * FROM Inventory;

SELECT * FROM Order_History;

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



