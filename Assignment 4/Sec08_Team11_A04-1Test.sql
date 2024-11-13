ALTER TABLE Sellers MODIFY(
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10)
    );


INSERT INTO sellers VALUES (12124344, 'Pretty Paints Inc', '905 534 3721', 'info@prettypaintsinc.com', 2.10, 'Active');
INSERT INTO sellers (seller_id, seller_name) VALUES( 12124344, 'Pretty Paints Inc' );

INSERT INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) 
VALUES (12124344, 'Pretty Paints Inc', '905 534 3721', 'info@prettypaintsinc.com', 2.10, 'Active');

INSERT INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) 
VALUES (12124344, 'Pretty Paints Inc', '905 534 3721', 'info@prettypaintsinc.com', 2, 'Active');

DESCRIBE Customers;

INSERT INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) 
VALUES (12124344, 'Pretty Paints Inc', '905 534 3721', 'info@prettypaintsinc.com', 1, 'Active');

SELECT * FROM NLS_SESSION_PARAMETERS WHERE PARAMETER IN ('NLS_NUMERIC_CHARACTERS', 'NLS_LANGUAGE');

INSERT INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) 
VALUES (12124345, 'Another Seller', '1234567890', 'another@example.com', 2.5, 'Active');

INSERT INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) 
VALUES (12124343, 'Pretty Paints Inc', '9055343721', 'info@prettypaintsinc.com', 2.4, 'Active');

INSERT ALL
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (12124344, 'Pretty Paints Inc', '9055343721', 'info@prettypaintsinc.com', 2.1, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (23524346, 'Mighty Tools', '8883627302', 'support@mightytools.com', 4.2, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (24367473, 'Willies Wood Supply', '7483648837', 'contact@willieswoodsupply.com', 4.95, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (75849473, 'Gabbies Garden Shop', '6783722727', 'sales@gabbiesgardenshop.com', 4.89, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (64750584, 'Big Steel Works', '9993723722', 'inquiries@bigsteelworks.com', 1.23, 'Suspended')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (44505944, 'Sealants Plus', '3246744231', 'info@sealantsplus.com', 3.9, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (46859544, 'NutsBoltsN''More', NULL, 'sales@nutsboltsnmore.com', 2.98, 'Suspended')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (98474638, 'Crystal Lighting Co.', '7206623681', 'support@crystallightingco.com', 3.67, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (57849037, 'PlumbersRUs', '7203724772', 'contact@plumbersrus.com', 4.45, 'Active')
    INTO Sellers (seller_id, seller_name, phone_number, email, rating, account_status) VALUES (62435464, 'Electrical Supply', '9054536390', 'info@electricalsupply.com', 3.12, 'Active')
SELECT * FROM dual;

DELETE FROM customers;

INSERT INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, address, date_of_birth, user_role, password_hash) VALUES
(512346, 'Aidan White', '12125550123', 'skater@hotmail.com', NULL, 'Maplewood, Vermont', TO_DATE('15-01-1990', 'DD-MM-YYYY'), 'Customer', '5f4dcc3b5aa765d61d8327deb882cf99');

INSERT ALL
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (512346, 'Aidan White', '12125550123', 'skater@hotmail.com', NULL, TO_DATE('15-01-1990', 'DD-MM-YYYY'), 'Customer', '5f4dcc3b5aa765d61d8327deb882cf99', 'Maplewood, Vermont')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (723450, 'Cleopatra', NULL, 'iamancient@thetomb.com', NULL, TO_DATE('04-08-0069', 'DD-MM-YYYY'), 'Customer', 'e99a18c428cb38d5f260853678922e03', 'Alexandria, Egypt')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (820393, 'Velma Dinkley', '13105552345', 'vdinkley@hblive.com', 'mysteryinc@hblive.com', TO_DATE('22-03-1975', 'DD-MM-YYYY'), 'Customer', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Crystal Cove, California')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (362142, 'Shaggy Rogers', '14155553456', 'food_enjoyer@yahoo.com', 'mysteryinc@hblive.com', TO_DATE('13-09-1990', 'DD-MM-YYYY'), 'Customer', '3b79f3c408f64f3e9bade3948d798ad1', 'Crystal Cove, California')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (232132, 'Fred Jones', '16175554567', 'trap.master@gmail.com', 'mysteryinc@hblive.com', TO_DATE('28-02-1980', 'DD-MM-YYYY'), 'Customer', '5ebe2294ecd0e111d827a0e0f2b2e8b6', 'Crystal Cove, California')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (266377, 'Daphne Blake', '12025555678', 'daphneyblake@hblive.com', 'mysteryinc@hblive.com', TO_DATE('16-04-1985', 'DD-MM-YYYY'), 'Customer', '2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d', 'Crystal Cove, California')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (563729, 'Ahmed Shah', '92305556789', 'a.shah@outlook.com', NULL, TO_DATE('01-12-1988', 'DD-MM-YYYY'), 'Admin', 'e7c4f4c148c7e6f382c5c7744e7c58a2', 'Lahore, Pakistan')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (235221, 'Magdalena Dabrowska', '487135557890', 'magda@hotmail.com', 'd.magdalena@gmail.com', TO_DATE('30-07-1994', 'DD-MM-YYYY'), 'Admin', '5a105e8b9d40e1329780d62ea2265d8a', 'Kraków, Poland')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (322638, 'Daphne Blake', '16045558901', 'daphneyblake@hblive.com', 'mysteryinc@hblive.com', TO_DATE('16-04-1985', 'DD-MM-YYYY'), 'Customer', '2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d', 'Crystal Cove, California')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (252343, 'John Jones', '14165559012', 'jonnyj@yahoo.com', NULL, TO_DATE('05-05-1972', 'DD-MM-YYYY'), 'Customer', 'cc8e15b01a749f1a5e20e4d21e04577d', 'San Francisco, California')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (233523, 'John Young', '14035550123', 'young.john123@outlook.com', NULL, TO_DATE('12-11-1990', 'DD-MM-YYYY'), 'Customer', 'c4ca4238a0b923820dcc509a6f75849b15', 'Seattle, Washington')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (904732, 'Rodrigo Mendez', '52555551234', 'rdmendez@yahoo.com', NULL, TO_DATE('19-02-1996', 'DD-MM-YYYY'), 'Customer', '7c6a180b36896a0a8c02787eeafb0e4c', 'Bogotá, Colombia')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (348274, 'Sun Li Park', '8255552345', 'parksunli@gmail.com', NULL, TO_DATE('07-10-2001', 'DD-MM-YYYY'), 'Customer', '6dcd4ce23d88e2ee9568ba546c007c63', 'Seoul, South Korea')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (364738, 'Demetry Georgiopolis', '30215553456', 'demgeorgio@hotmail.com', 'greekgod@yahoo.com', TO_DATE('25-06-1965', 'DD-MM-YYYY'), 'Customer', 'd41d8cd98f00b204e9800998ecf8427e', 'Athens, Greece')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (738433, 'Amy Singh', '445553210', 'amy.singh@gmail.com', NULL, TO_DATE('10-03-1993', 'DD-MM-YYYY'), 'Admin', 'a2c6b8b8abca8b85a9183c4af4a3f8d5', 'Toronto, Canada')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (635373, 'Tiffany Chau', '6135554567', 'tiffany.chau@yahoo.com', NULL, TO_DATE('18-09-1991', 'DD-MM-YYYY'), 'Customer', 'c81e728d9d4c2f636f067f89cc14862c', 'Vancouver, Canada')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (363383, 'Manisha Patel', '9155556789', 'manisha.patel@hotmail.com', NULL, TO_DATE('08-01-1985', 'DD-MM-YYYY'), 'Customer', '8c6976e5b5410415bde908bd4dee15db', 'London, England')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (363773, 'Pawel Wozniczka', '48225558901', 'pawel.wozniczka@gmail.com', NULL, TO_DATE('02-04-1986', 'DD-MM-YYYY'), 'Customer', '7c6a180b36896a0a8c02787eeafb0e4c', 'Warsaw, Poland')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (637384, 'Eleni Drake', '30305556543', 'eleni.drake@yahoo.com', NULL, TO_DATE('30-08-1995', 'DD-MM-YYYY'), 'Customer', '5d41402abc4b2a76b9719d911017c592', 'Thessaloniki, Greece')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (463843, 'Penelope Perez', '13215554321', 'penelope.perez@hotmail.com', NULL, TO_DATE('15-12-1994', 'DD-MM-YYYY'), 'Customer', '7b8b965ad4bca0d441c0d0f600bfb0c093', 'Miami, Florida')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (244433, 'Montgomery Windham', '16025557654', 'montgomery.windham@gmail.com', NULL, TO_DATE('04-07-1989', 'DD-MM-YYYY'), 'Customer', '6dcd4ce23d88e2ee9568ba546c007c63', 'New Orleans, Louisiana')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (463743, 'Abby Miller', '16045550987', 'abby.miller@yahoo.com', NULL, TO_DATE('29-03-1992', 'DD-MM-YYYY'), 'Admin', '098f6bcd4621d373cade4e832627b4f6', 'Denver, Colorado')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (345743, 'Halina Brzeczyszkiewic', '48515555432', 'halina.brzeczyszkiewic@hotmail.com', NULL, TO_DATE('21-11-1988', 'DD-MM-YYYY'), 'Customer', '7b8b965ad4bca0d441c0d0f600bfb0c093', 'Wrocław, Poland')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (362824, 'Ava Jones', '15125556782', 'ava.jones@gmail.com', NULL, TO_DATE('14-02-2000', 'DD-MM-YYYY'), 'Customer', 'b6d767d2f8edc6f9c93f3c36c353e9f4', 'Austin, Texas')
    INTO Customers (customer_id, customer_name, phone_number, email, recovery_email, date_of_birth, user_role, password_hash, address) VALUES (479674, 'Mehmet Aydin', '902125557895', 'mehmet.aydin@yahoo.com', NULL, TO_DATE('29-10-1978', 'DD-MM-YYYY'), 'Customer', '1a79a4d60de6718e8e5b326e338ae533', 'Istanbul, Turkey')
SELECT * FROM dual;

SELECT * FROM customers;

ALTER TABLE Products MODIFY(
    product_id VARCHAR(10) UNIQUE
    );

INSERT ALL
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (101, 'Premium Acrylic Paint', 'High-quality acrylic paint in various colors.', 25.99, 1.5, 3.2, 12124344)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (102, 'Eco-Friendly Primer', 'Non-toxic primer for all surfaces.', 19.99, 2, 4.1, 12124344)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (103, 'Paint Brush Set', '5-piece paint brush set with ergonomic handles.', 12.99, 0.5, 2.8, 12124344)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (104, 'Spray Paint', 'Fast-drying spray paint for quick applications.', 14.99, 0.75, 4.5, 12124344)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (105, 'Canvas Drop Cloth', 'Heavy-duty drop cloth to protect floors.', 16.99, 3, 3.7, 12124344)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (201, 'Heavy-Duty Hammer', 'Durable hammer for tough jobs.', 18.99, 1.2, 4, 23524346)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (202, 'Cordless Drill', 'Versatile cordless drill with multiple settings.', 89.99, 3.5, 4.3, 23524346)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (203, 'Adjustable Wrench', '12-inch adjustable wrench for all sizes.', 15.99, 1, 2.5, 23524346)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (204, 'Tool Belt', 'Durable tool belt with multiple pockets.', 24.99, 0.8, 5, 23524346)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (205, 'Safety Goggles', 'Anti-fog safety goggles for clear vision.', 9.99, 0.3, 3.9, 23524346)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (301, 'Cedar Plank', 'Premium cedar plank for outdoor projects.', 12.99, 5, 4.6, 24367473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (302, 'Wood Glue', 'Strong, waterproof wood glue for all applications.', 6.99, 0.5, 3.1, 24367473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (303, 'Sanding Block', 'Ergonomic sanding block for smooth finishes.', 4.99, 0.3, 4.2, 24367473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (304, 'Hardwood Assortment', 'Mixed hardwood pack for various projects.', 39.99, 10, 4.8, 24367473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (305, 'Wood Stain', 'Rich wood stain available in multiple shades.', 15.99, 1, 2.9, 24367473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (401, 'Organic Fertilizer', 'All-natural fertilizer for healthy plants.', 19.99, 2, 3.5, 75849473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (402, 'Plant Pots', 'Set of 5 biodegradable plant pots.', 14.99, 1, 4, 75849473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (403, 'Garden Trowel', 'Durable trowel for digging and planting.', 12.99, 0.8, 4.4, 75849473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (404, 'Pruning Shears', 'High-quality pruning shears for clean cuts.', 24.99, 0.5, 3.6, 75849473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (405, 'Seed Starter Kit', 'Everything you need to start seeds indoors.', 29.99, 3, 4.9, 75849473)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (501, 'Steel Angle Bracket', 'Heavy-duty steel angle bracket for support.', 10.99, 2, 2.7, 64750584)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (502, 'Welded Steel Beam', 'Sturdy welded steel beam for construction.', 79.99, 25, 4.2, 64750584)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (503, 'Steel Rod', 'Strong steel rod for various applications.', 14.99, 3, 3.8, 64750584)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (504, 'Metal Sheeting', 'Corrugated metal sheeting for roofing.', 29.99, 10, 3, 64750584)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (505, 'Galvanized Pipe', 'Durable galvanized pipe for plumbing.', 19.99, 5, 4.7, 64750584)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (601, 'Silicone Sealant', 'High-performance silicone sealant for waterproofing.', 8.99, 0.5, 4.1, 44505944)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (602, 'Acrylic Caulk', 'Flexible acrylic caulk for indoor use.', 6.99, 0.4, 3.4, 44505944)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (603, 'Construction Adhesive', 'Strong adhesive for various materials.', 12.99, 0.6, 4.5, 44505944)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (604, 'Foam Sealant', 'Expanding foam sealant for gaps and cracks.', 10.99, 0.8, 2.6, 44505944)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (605, 'Weatherstripping Tape', 'Self-adhesive tape for sealing drafts.', 5.99, 0.3, 4.8, 44505944)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (701, 'Assorted Nuts And Bolts', 'Mixed pack of nuts and bolts for various uses.', 14.99, 1.5, 3.3, 46859544)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (702, 'Washer Set', 'Set of washers in various sizes.', 8.99, 0.5, 4.2, 46859544)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (703, 'Heavy-Duty Screws', 'Strong screws for construction projects.', 12.99, 1, 2.4, 46859544)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (704, 'Anchors', 'Wall anchors for secure installation.', 9.99, 0.3, 4, 46859544)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (705, 'Rivets', 'Pack of rivets for metalwork.', 11.99, 0.4, 3.9, 46859544)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (801, 'LED Pendant Light', 'Stylish LED pendant light for modern homes.', 49.99, 3, 5, 98474638)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (802, 'Floor Lamp', 'Elegant floor lamp with adjustable height.', 89.99, 10, 4.3, 98474638)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (803, 'Crystal Chandelier', 'Stunning crystal chandelier for dining areas.', 299.99, 15, 4.5, 98474638)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (804, 'Wall Sconce', 'Decorative wall sconce for ambiance.', 39.99, 2, 3.1, 98474638)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (805, 'Table Lamp', NULL, NULL, NULL, NULL, 98474638)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (901, 'Copper Pipe', 'Durable copper pipe for plumbing projects.', 2.99, 0.5, 3.5, 57849037)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (902, 'PVC Fittings', 'Assorted PVC fittings for various plumbing needs.', 9.99, 1, 2.9, 57849037)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (903, 'Pipe Wrench', 'Adjustable pipe wrench for secure grip.', 15.99, 2, 4.6, 57849037)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (904, 'Plumber''s Putty', 'Sealing putty for sink and fixture installation.', 5.99, 0.3, 4.2, 57849037)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (905, 'Toilet Repair Kit', 'Complete kit for toilet repairs.', 29.99, 1.5, 5, 57849037)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (1001, 'LED Light Bulb', 'Energy-efficient LED light bulb.', 10.99, 0.2, 3.8, 62435464)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (1002, 'Extension Cord', '25-foot heavy-duty extension cord.', 19.99, 1.5, 4.1, 62435464)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (1003, 'Circuit Breaker', '20-amp circuit breaker for home use.', 15.99, 0.5, 3.3, 62435464)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (1004, 'Power Strip', '6-outlet power strip with surge protection.', 12.99, 0.8, 4.7, 62435464)
    INTO Products (product_id, product_name, product_description, product_price, product_weight, rating, seller_id) VALUES (1005, 'Electrical Tape', 'High-quality electrical tape for safe wiring.', 3.99, 0.2, 2.2, 62435464)
SELECT * FROM dual;
Here’s an SQL `INSERT ALL` query for the provided data:

```sql
INSERT ALL
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (101, 12124344, 150, 20, '2024-10-15', 100)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (102, 12124344, 80, 15, '2024-10-20', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (103, 12124344, 200, 30, '2024-10-18', 150)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (104, 12124344, 120, 25, '2024-10-25', 75)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (105, 12124344, 90, 10, '2024-10-30', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (201, 23524346, 60, 10, '2024-10-22', 40)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (202, 23524346, 45, 5, '2024-10-30', 20)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (203, 23524346, 100, 20, '2024-10-18', 70)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (204, 23524346, 75, 10, '2024-10-28', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (205, 23524346, 130, 30, '2024-10-20', 100)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (301, 24367473, 150, 20, '2024-10-15', 100)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (302, 24367473, 200, 50, '2024-10-22', 150)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (303, 24367473, 75, 10, '2024-10-30', 30)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (304, 24367473, 30, 5, '2024-10-28', 20)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (305, 24367473, 60, 15, '2024-10-18', 40)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (401, 75849473, 100, 15, '2024-10-15', 70)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (402, 75849473, 150, 20, '2024-10-20', 100)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (403, 75849473, 80, 10, '2024-10-25', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (404, 75849473, 90, 10, '2024-10-22', 60)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (405, 75849473, 40, 5, '2024-10-30', 25)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (501, 64750584, 100, 20, '2024-10-18', 70)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (502, 64750584, 30, 5, '2024-10-30', 15)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (503, 64750584, 80, 15, '2024-10-25', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (504, 64750584, 50, 10, '2024-10-20', 30)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (505, 64750584, 200, 25, '2024-10-22', 150)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (601, 44505944, 120, 15, '2024-10-15', 80)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (602, 44505944, 70, 10, '2024-10-20', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (603, 44505944, 60, 10, '2024-10-25', 40)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (604, 44505944, 80, 15, '2024-10-30', 60)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (605, 44505944, 90, 20, '2024-10-28', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (701, 46859544, 200, 25, '2024-10-22', 150)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (702, 46859544, 150, 20, '2024-10-30', 100)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (703, 46859544, 120, 15, '2024-10-25', 80)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (704, 46859544, 100, 10, '2024-10-20', 70)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (705, 46859544, 80, 10, '2024-10-18', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (801, 98474638, 60, 10, '2024-10-22', 40)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (802, 98474638, 50, 10, '2024-10-30', 30)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (803, 98474638, 20, 5, '2024-10-28', 10)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (804, 98474638, 90, 15, '2024-10-20', 60)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (805, 98474638, 30, 5, '2024-10-18', 20)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (901, 34567890, 100, 20, '2024-10-18', 80)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (902, 34567890, 90, 15, '2024-10-20', 70)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (903, 34567890, 110, 25, '2024-10-25', 90)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (904, 34567890, 120, 30, '2024-10-30', 100)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (905, 34567890, 50, 10, '2024-10-22', 40)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1001, 45678901, 140, 25, '2024-10-15', 60)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1002, 45678901, 80, 10, '2024-10-20', 50)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1003, 45678901, 120, 20, '2024-10-25', 80)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1004, 45678901, 75, 15, '2024-10-28', 40)
    INTO inventory (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1005, 45678901, 60, 10, '2024-10-30', 30)
SELECT * FROM dual;

INSERT INTO products (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES ('PP101', 12124344, 150, 20, '2024-10-15', 100)
    INTO products (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES ('PP102', 12124344, 80, 15, '2024-10-20', 50)
    INTO products (product_id, seller_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES ('PP103', 12124344, 200, 30, '2024-10-18', 150)
SELECT * FROM dual;

SELECT product_id, seller_id FROM products;

DROP inventory;

Describe inventory;


ALTER TABLE inventory RENAME COLUMN  NEXT_SHIPMENT_AMOUNT TO  next_shipment_quantity;

INSERT ALL
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (101, 150, 20, '2024-10-15', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (102, 80, 15, '2024-10-20', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (103, 200, 30, '2024-10-18', 150)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (104, 120, 25, '2024-10-25', 75)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (105, 90, 10, '2024-10-30', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (201, 60, 10, '2024-10-22', 40)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (202, 45, 5, '2024-10-30', 20)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (203, 100, 20, '2024-10-18', 70)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (204, 75, 10, '2024-10-28', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (205, 130, 30, '2024-10-20', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (301, 150, 20, '2024-10-15', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (302, 200, 50, '2024-10-22', 150)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (303, 75, 10, '2024-10-30', 30)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (304, 30, 5, '2024-10-28', 20)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (305, 60, 15, '2024-10-18', 40)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (401, 100, 15, '2024-10-15', 70)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (402, 150, 20, '2024-10-20', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (403, 80, 10, '2024-10-25', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (404, 90, 10, '2024-10-22', 60)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (405, 40, 5, '2024-10-30', 25)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (501, 100, 20, '2024-10-18', 70)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (502, 30, 5, '2024-10-30', 15)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (503, 80, 15, '2024-10-25', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (504, 50, 10, '2024-10-20', 30)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (505, 200, 25, '2024-10-22', 150)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (601, 120, 15, '2024-10-15', 80)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (602, 70, 10, '2024-10-20', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (603, 60, 10, '2024-10-25', 40)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (604, 80, 15, '2024-10-30', 60)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (605, 90, 20, '2024-10-28', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (701, 200, 25, '2024-10-22', 150)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (702, 150, 20, '2024-10-30', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (703, 120, 15, '2024-10-25', 80)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (704, 100, 10, '2024-10-20', 70)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (705, 80, 10, '2024-10-18', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (801, 60, 10, '2024-10-22', 40)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (802, 50, 10, '2024-10-30', 30)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (803, 20, 5, '2024-10-28', 10)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (804, 90, 15, '2024-10-15', 60)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (805, 80, 10, '2024-10-20', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (901, 150, 20, '2024-10-18', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (902, 100, 15, '2024-10-20', 70)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (903, 80, 10, '2024-10-30', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (904, 200, 25, '2024-10-31', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (905, 40, 5, '2024-11-01', 10)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1001, 300, 50, '2024-10-15', 200)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1002, 150, 20, '2024-10-20', 100)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1003, 90, 15, '2024-10-25', 50)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1004, 200, 30, '2024-10-18', 150)
    INTO Inventory (product_id, in_stock, min_stock_level, next_delivery_date, next_shipment_quantity) VALUES (1005, 250, 40, '2024-10-30', 150)
SELECT * FROM dual;  -- Required for the INSERT ALL statement to work

SELECT product_id FROM inventory;

INSERT ALL
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000001, 101, '2024-09-01', 'Shipped', 50.99, 'Credit Card', 'Maplewood, Vermont', 512346)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000002, 201, '2024-09-05', 'Delivered', 15.99, 'PayPal', 'Maplewood, Vermont', 512346)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000003, 401, '2024-09-10', 'Pending', 20.00, 'Debit Card', 'Maplewood, Vermont', 512346)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000004, 901, '2024-09-12', 'Shipped', 5.99, 'Gift Card', 'Maplewood, Vermont', 512346)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000005, 1001, '2024-09-03', 'Delivered', 10.99, 'Credit Card', 'Alexandria, Egypt', 723450)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000006, 202, '2024-09-06', 'Shipped', 45.50, 'PayPal', 'Alexandria, Egypt', 723450)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000007, 402, '2024-09-15', 'Pending', 30.00, 'Debit Card', 'Alexandria, Egypt', 723450)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000008, 102, '2024-09-20', 'Delivered', 25.00, 'Gift Card', 'Alexandria, Egypt', 723450)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000009, 301, '2024-09-02', 'Shipped', 60.00, 'Credit Card', 'Crystal Cove, California', 820393)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000010, 601, '2024-09-07', 'Delivered', 15.99, 'PayPal', 'Crystal Cove, California', 820393)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000011, 1002, '2024-09-11', 'Pending', 19.99, 'Debit Card', 'Crystal Cove, California', 820393)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000012, 801, '2024-09-16', 'Shipped', 49.99, 'Gift Card', 'Crystal Cove, California', 820393)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000013, 501, '2024-09-05', 'Delivered', 25.00, 'Credit Card', 'Crystal Cove, California', 362142)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000014, 701, '2024-09-08', 'Shipped', 30.50, 'PayPal', 'Crystal Cove, California', 362142)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000015, 403, '2024-09-12', 'Pending', 12.99, 'Debit Card', 'Crystal Cove, California', 362142)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000016, 103, '2024-09-18', 'Delivered', 22.50, 'Gift Card', 'Crystal Cove, California', 362142)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000017, 602, '2024-09-03', 'Shipped', 16.99, 'Credit Card', 'Crystal Cove, California', 232132)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000018, 802, '2024-09-09', 'Delivered', 40.00, 'PayPal', 'Crystal Cove, California', 232132)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000019, 1003, '2024-09-14', 'Pending', 12.00, 'Debit Card', 'Crystal Cove, California', 232132)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000020, 702, '2024-09-20', 'Shipped', 15.50, 'Gift Card', 'Crystal Cove, California', 232132)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000021, 203, '2024-09-04', 'Delivered', 22.00, 'Credit Card', 'Crystal Cove, California', 266377)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000022, 104, '2024-09-10', 'Shipped', 18.50, 'PayPal', 'Crystal Cove, California', 266377)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000023, 404, '2024-09-15', 'Pending', 35.00, 'Debit Card', 'Crystal Cove, California', 266377)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000024, 502, '2024-09-18', 'Delivered', 50.00, 'Gift Card', 'Crystal Cove, California', 266377)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000025, 302, '2024-09-06', 'Shipped', 20.00, 'Credit Card', 'Lahore, Pakistan', 563729)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000026, 603, '2024-09-12', 'Delivered', 14.99, 'PayPal', 'Lahore, Pakistan', 563729)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000027, 803, '2024-09-16', 'Pending', 55.00, 'Debit Card', 'Lahore, Pakistan', 563729)
  INTO Order_History (transaction_id, product_id, order_date, status, order_total, payment_method, shipping_address, customer_id) VALUES (1000000028, 902, '2024-09-22', 'Shipped', 6.99, 'Gift Card', 'Lahore, Pakistan', 563729)
SELECT * FROM dual;

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

CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) CHECK(LENGTH(phone_number) >= 10),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    rating FLOAT,
    account_status VARCHAR(10) CHECK( account_status in ('Active', 'Suspended'))
);

CREATE TABLE Products (
    product_id VARCHAR(10) UNIQUE,
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
    in_stock INT DEFAULT 0,
    min_stock_level INT,
    next_delivery_date DATE,
    next_shipment_quantity INT,
    PRIMARY KEY (product_id)
);

ALTER TABLE Order_History MODIFY(
PRIMARY KEY (transaction_id)
);

DROP TABLE ORDER_HISTORY;

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

SELect product_id from products;
select customer_id from customers;

SELECT * FROM Inventory;

SELECT customer_id, customer_name, email
FROM Customers
WHERE user_role = 'Customer';

SELECT seller_id, seller_name, email
FROM Sellers
WHERE rating >= 4
AND account_status = 'Active';

SELECT product_id, product_name, product_price
FROM Products
WHERE rating >= 4
ORDER BY product_price ASC;

SELECT p.seller_id, i.product_id, p.product_name, i.next_delivery_date, i.next_shipment_quantity
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
WHERE i.next_delivery_date BETWEEN SYSDATE AND SYSDATE + 20;

--PRIMARY KEY (transaction_id, product_id, customer_id)

DESCRIBE ORDER_HISTORY;

SELECT * 
FROM all_constraints 
WHERE constraint_name = 'SYS_C001950603';

SELECT R_CONSTRAINT_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'SYS_C001894714';

SELECT *
FROM DBA_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'SYS_C001894714';

SELECT PRODUCT_ID FROM PRODUCTS;
SELECT CUSTOMER_ID FROM CUSTOMERS;

SELECT OWNER, TABLE_NAME
FROM ALL_TABLES
WHERE TABLE_NAME = 'customers';

SELECT o.transaction_id, p.product_name, c.customer_name
FROM Order_History o
JOIN Products p ON o.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Pending'
ORDER BY o.order_date ASC;


-- Product + Order_History
SELECT p.product_id, p.product_name, SUM(o.order_total) AS OrderTotal
FROM Products p
JOIN Order_History o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY OrderTotal DESC;

SELECT *
FROM (
    SELECT p.product_id, p.product_name, SUM(o.order_total) AS OrderTotal
    FROM Products p
    JOIN Order_History o ON p.product_id = o.product_id
    GROUP BY p.product_id, p.product_name
    ORDER BY OrderTotal DESC
)
WHERE ROWNUM <= 5;

-- Sellers + Products + Order_History
SELECT o.product_id, COUNT(o.product_id) AS total_pending
FROM Order_History o
JOIN Products p ON o.product_id = p.product_id
WHERE o.status = 'Pending'
AND p.seller_id = '75849473'
GROUP BY o.product_id
ORDER BY total_pending DESC;