-- Insert into productcategories
INSERT INTO productcategories (pc_categoryname, parentcategory_id)
VALUES
    ('Consumer Electronics', NULL),
    ('Home and Kitchen Appliances', NULL),
    ('Clothing and Fashion', NULL),
    ('Health and Beauty', NULL),
    ('Furniture and Home Decor', NULL),
    ('Books and Media', NULL),
    ('Sports and Outdoors', NULL),
    ('Automotive', NULL),
    ('Toys and Games', NULL),
    ('Groceries and Food', NULL);

-- Insert into products
INSERT INTO products (p_productname, category_id, p_price, p_stocklevel, p_description)
VALUES
    ('Product1', 1, 49.99, 100, 'Description for Product1'),
    ('Product2', 3, 29.99, 50, 'Description for Product2'),
    ('Product3', 5, 149.99, 75, 'Description for Product3'),
    ('Product4', 7, 79.99, 30, 'Description for Product4'),
    ('Product5', 10, 2.99, 200, 'Description for Product5'),
    ('Product6', 12, 9.99, 80, 'Description for Product6'),
    ('Product7', 14, 199.99, 25, 'Description for Product7'),
    ('Product8', 2, 149.99, 60, 'Description for Product8'),
    ('Product9', 4, 49.99, 100, 'Description for Product9'),
    ('Product10', 6, 19.99, 120, 'Description for Product10');

-- Insert into customers
INSERT INTO customers (c_firstname, c_surname, c_street, c_city, c_postalcode, c_country, c_registrationdate, c_contact, c_email)
VALUES
    ('John', 'Doe', '123 Main St', 'City1', '12345', 'Country1', '2023-01-01', '1234567890', 'john.doe@email.com'),
    ('Jane', 'Smith', '456 Oak St', 'City2', '54321', 'Country2', '2023-02-15', '9876543210', 'jane.smith@email.com'),
    ('Bob', 'Johnson', '789 Pine St', 'City3', '67890', 'Country3', '2023-03-22', '2345678901', 'bob.johnson@email.com'),
    ('Alice', 'Williams', '101 Elm St', 'City4', '09876', 'Country4', '2023-04-05', '3456789012', 'alice.williams@email.com'),
    ('Charlie', 'Davis', '202 Cedar St', 'City5', '56789', 'Country5', '2023-05-10', '4567890123', 'charlie.davis@email.com'),
    ('Eva', 'Martin', '303 Birch St', 'City6', '23456', 'Country6', '2023-06-18', '5678901234', 'eva.martin@email.com'),
    ('David', 'Taylor', '404 Maple St', 'City7', '78901', 'Country7', '2023-07-25', '6789012345', 'david.taylor@email.com'),
    ('Grace', 'Anderson', '505 Pine St', 'City8', '12345', 'Country8', '2023-08-30', '7890123456', 'grace.anderson@email.com'),
    ('Henry', 'Miller', '606 Oak St', 'City9', '54321', 'Country9', '2023-09-12', '8901234567', 'henry.miller@email.com'),
    ('Isabel', 'Clark', '707 Elm St', 'City10', '98765', 'Country10', '2023-10-21', '9012345678', 'isabel.clark@email.com');

-- Insert into orders
INSERT INTO orders (customer_id, o_orderdate, o_orderquantity, o_orderstatus)
VALUES
    (1, '2023-01-05', 2, 'Pending'),
    (2, '2023-02-20', 1, 'Shipped'),
    (3, '2023-03-25', 3, 'Pending'),
    (4, '2023-04-10', 2, 'Delivered'),
    (5, '2023-05-15', 1, 'Shipped'),
    (6, '2023-06-30', 4, 'Pending'),
    (7, '2023-07-08', 2, 'Delivered'),
    (8, '2023-08-16', 3, 'Shipped'),
    (9, '2023-09-29', 1, 'Pending'),
    (10, '2023-10-05', 2, 'Delivered');

-- Insert into orderitems
INSERT INTO orderitems (order_id, product_id, oi_quantity, oi_priceperunit)
VALUES
    (1, 1, 1, 49.99),
    (2, 3, 1, 29.99),
    (3, 5, 2, 149.99),
    (4, 7, 1, 199.99),
    (5, 9, 3, 49.99),
    (6, 2, 2, 9.99),
    (7, 4, 1, 79.99),
    (8, 6, 2, 19.99),
    (9, 8, 1, 149.99),
    (10, 10, 3, 19.99);

-- Insert into shippingdetails
INSERT INTO shippingdetails (order_id, sd_shippingmethod, sd_trackingnumber, sd_deliverystatus, sd_estimateddeliverydate)
VALUES
    (1, 'Air', 'ABC123', 'Pending', '2023-01-10'),
    (2, 'Land', 'XYZ456', 'Shipped', '2023-02-25'),
    (3, 'Sea', '123DEF', 'Pending', '2023-03-30'),
    (4, 'Air', '789GHI', 'Delivered', '2023-04-15'),
    (5, 'Land', '456JKL', 'Shipped', '2023-05-20'),
    (6, 'Sea', 'LMN789', 'Pending', '2023-07-05'),
    (7, 'Air', 'OPQ123', 'Delivered', '2023-07-13'),
    (8, 'Land', '456RST', 'Shipped', '2023-08-21'),
    (9, 'Sea', 'UVW789', 'Delivered', '2023-10-03'),
    (10, 'Air', 'XYZ456', 'Pending', '2023-10-10');