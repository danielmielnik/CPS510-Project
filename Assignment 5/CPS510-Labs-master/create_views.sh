#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12c/client64/lib
sqlplus64 "dmielnik/11128927@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

-- Sellers | Poorly rated sellers who have been suspended
CREATE VIEW poorly_rated_suspended_sellers AS
    (SELECT seller_id, seller_name, email, rating
    FROM Sellers
    WHERE rating <= 3
    AND account_status = 'Suspended');

-- Products + Order_History | Numbeer of times a product has been orderd from specified seller
CREATE VIEW product_order_totals AS
    SELECT o.product_id, COUNT(o.product_id) AS total_orderd
    FROM Order_History o
    JOIN Products p ON o.product_id = p.product_id
    AND p.seller_id = '75849473'
    GROUP BY o.product_id
    ORDER BY o.product_id DESC;

-- Order_History | Total in shipment to each loaction
CREATE VIEW location_shipped_totals AS
    SELECT shipping_address, COUNT(shipping_address) AS total_shipped
    FROM Order_History
    WHERE status = 'Shipped'
    GROUP BY shipping_address
    ORDER BY total_shipped DESC;

-- Inventory + Products | Next product delivery date for specified seller;
CREATE VIEW next_prod_delivery AS
    SELECT p.seller_id, i.product_id, p.product_name, i.next_delivery_date, i.next_shipment_quantity
    FROM Inventory i
    JOIN Products p ON i.product_id = p.product_id
    WHERE i.next_delivery_date BETWEEN SYSDATE AND SYSDATE + 20
    AND p.seller_id = '75849473';

-- Inventory + Sellers | Get all inventory items that are below the minimum stock threshold
CREATE VIEW needs_restocking AS
    SELECT i.product_id, s.seller_name, p.product_name, i.in_stock, i.min_stock_level
    FROM Inventory i
    JOIN Products p ON p.product_id = i.product_id
    JOIN Sellers s ON p.seller_id = s.seller_id
    WHERE i.in_stock < i.min_stock_level
    ORDER BY i.product_id ASC;

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

exit;
EOF
